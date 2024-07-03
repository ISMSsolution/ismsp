package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.itextpdf.text.DocumentException;

import ismspdao.ismspdao;
import ismspdto.resultdto;

@WebServlet("/ismsp")
@MultipartConfig
public class ismsp extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		String category = request.getParameter("category");
		//if(category==null) request.getAttribute("category");
		if(category==null) category = "1.1.1 경영진의 참여";
		//System.out.println("get category : "+category);
		System.out.println("get category : "+category);
		
		ismspdao db = new ismspdao();
		String categoryResult = "";
		resultdto result = null;
		try {
			result = db.selectResultTable(category);
			if(result!=null && result.getDescription()!=null)
				result.setDescription(result.getDescription().replace("\n\n", "\n"));
			categoryResult = db.selectCategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.Close();
		//System.out.println("categoryResult : "+categoryResult);
		request.setAttribute("category", category);
		request.setAttribute("categoryResult", categoryResult);
		System.out.println("result : "+result.getDescription());
		if(result.getDescription()!=null && result.getDescription().contains("\\"))
			result.setDescription(result.getDescription().replace("\\", ""));
		//if(result.getDescription() != null && result.getDescription().contains("nn"))
		//	result.setDescription(result.getDescription().replace("nn", "n"));
		String[] sens;
		if(result.getDescription() != null && result.getDescription().contains("n")) {
			sens = result.getDescription().split("nn");
			System.out.println("sens length : "+sens.length);
			for(int i=0;i<sens.length;i++)
				System.out.println("sens : "+sens[i]);
		}
		request.setAttribute("result", result);

		PDFMaker pdfMaker = new PDFMaker();
		try {
			pdfMaker.createPDF(request.getSession().getServletContext().getRealPath("/"));
		} catch (DocumentException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("ismsp.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
		// 입력 받은 파일들 다 가져오기
        Collection<Part> parts = request.getParts();
        ArrayList<String> files = new ArrayList<>();
        for(Part part : parts) {
        	// 그 중에 '실제' 입력 받은 파일만 웹서버에 저장하고 리스트에 추가
        	if(part.getSubmittedFileName()==null || part.getSubmittedFileName().equals(""))
        		continue;
        	String filepath = "", filename = "";
        	filename = part.getSubmittedFileName();

        	filepath =request.getSession().getServletContext().getRealPath("/");
        	String sentfilepath = fileupload(part, filepath, filename);
        	files.add(sentfilepath);
        }
        
        // 만약 입력 받은 파일이 없으면 경고문 띄우고 원래 화면으로
    	if(files.size() == 0) {
    		String category = request.getParameter("category");
    		//if(category==null) request.getAttribute("category");
    		if(category==null) category = "1.1.1 경영진의 참여";
    		System.out.println("error post category : "+category);
    		
    		ismspdao db = new ismspdao();
    		String categoryResult = "";
    		resultdto result = null;
    		try {
    			result = db.selectResultTable(category);
    			if(result!=null && result.getDescription()!=null)
    				result.setDescription(result.getDescription().replace("\n\n", "\n"));
    			categoryResult = db.selectCategory();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		db.Close();

    		System.out.println("categoryResult :"+categoryResult);
    		request.setAttribute("category", category);
    		request.setAttribute("categoryResult", categoryResult);
    		request.setAttribute("result", result);
			PrintWriter out = response.getWriter();
		    out.print("<script>");
		    out.print("alert('인증을 진행할 파일을 선택하세요.');");
		    out.print("location.href = 'YIGA'");
		    //out.print("location.href = 'YIGA.jsp?category="+category+"'");
		    out.print("</script>");
		    return;
        }

    	// 현재 카테고리 가져오기
		String category = request.getParameter("category");
		//if(category==null) request.getAttribute("category");
		if(category==null) category = "1.1.1 경영진의 참여";
		System.out.println("post category : "+category);
        
    	// 여기서부턴 http로 파이썬 서버에 파일 전송하는 코드
        String boundary = "^-----^";
        String LINE_FEED = "\r\n";
        String charset = "UTF-8";
        OutputStream outputStream;
        PrintWriter writer;

        String gptresponse = null;
        ArrayList<String> filelist = new ArrayList<>();
        try{
        	// 파일을 수신할 파이썬 서버 URL
            URL url = new URL("http://127.0.0.1:5000/server");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setRequestProperty("Content-Type", "multipart/form-data;charset=utf-8;boundary=" + boundary);
            connection.setRequestMethod("POST");
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setUseCaches(false);
            connection.setConnectTimeout(15000);

            outputStream = connection.getOutputStream();
            writer = new PrintWriter(new OutputStreamWriter(outputStream, charset), true);
            
            FileInputStream inputStream = null;

            // 문자열 파트 전송
            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"category\"").append(LINE_FEED);
            writer.append("Content-Type: text/plain; charset=UTF-8").append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.append(category).append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();
            
            // 위에서 '실제' 입력 받았던 파일 개수만큼 http 데이터에 추가
            for(int i=0;i<files.size();i++) {
            	File sentfile = new File(files.get(i));
	            writer.append("--" + boundary).append(LINE_FEED);
	            writer.append("Content-Disposition: form-data; name=\"file"+(i+1)+"\"; filename=\"" + sentfile.getName() + "\"").append(LINE_FEED);
	            writer.append("Content-Type: " + URLConnection.guessContentTypeFromName(sentfile.getName())).append(LINE_FEED);
	            writer.append("Content-Transfer-Encoding: binary").append(LINE_FEED);
	            writer.append(LINE_FEED);
	            writer.flush();
	
	            inputStream = new FileInputStream(sentfile);
	            byte[] buffer = new byte[4096];
	            int bytesRead = -1;
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outputStream.write(buffer, 0, bytesRead);
	            }
	            outputStream.flush();
	            inputStream.close();
	            writer.append(LINE_FEED);
	            writer.flush();
	            filelist.add(sentfile.getName());
            }

            writer.append("--" + boundary + "--").append(LINE_FEED);
            writer.flush();
            writer.close();

            // http로 파일 전송한 후 데이터를 처리한 결과값 리턴 받기
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
                String inputLine;
                StringBuffer responseBuf = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                	responseBuf.append(inputLine);
                }
                in.close();
                
                gptresponse = responseBuf.toString();
                System.out.println("response : "+gptresponse);
            } else {
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getErrorStream(), "UTF-8"));
                String inputLine;
                StringBuffer responseBuf = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                	responseBuf.append(inputLine);
                }
                in.close();
                gptresponse = responseBuf.toString();
                System.out.println("result : "+gptresponse);
            }
            gptresponse = gptresponse.replace("\"", "");
            
            // 응답 결과에서 개행 지우기
            //gptresponse = gptresponse.replace("\\n\\n", "\n");
            //gptresponse = gptresponse.replace("\\n", "\n");
    		if(gptresponse !=null && gptresponse.contains("\\"))
    			gptresponse = gptresponse.replace("\\", "");
            System.out.println("result : "+gptresponse);
            // ISMS 인증 기준 적합성 판단에 쓰인 파일 리스트와 그 결과를 jsp에서 사용하기 위해 속성값으로 저장
            request.setAttribute("filelist", filelist);
        } catch (Exception e) {
        	e.printStackTrace();
        }
		
		ismspdao db = new ismspdao();
		String categoryResult = "";
		String check = "";
		if(gptresponse.contains("Y") || gptresponse.contains("O"))
			check = "준수";
		else
			check = "미준수";
		try {
			String materials = "";
			for(int i=0;i<filelist.size();i++) {
				materials += filelist.get(i)+",";
			}
			db.insertManageTable(materials, category, "박정환");
			db.insertResultTable(category, materials, check, gptresponse);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		categoryResult = db.selectCategory();
		resultdto result = null;
		try {
			result = db.selectResultTable(category);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("categoryResult : "+categoryResult);
		request.setAttribute("category", category);
		request.setAttribute("categoryResult", categoryResult);
		System.out.println("result : "+result.getDescription());
		request.setAttribute("result", result);
		
		PDFMaker pdfMaker = new PDFMaker();
		try {
			pdfMaker.createPDF(request.getSession().getServletContext().getRealPath("/"));
		} catch (DocumentException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		db.Close();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ismsp.jsp");
		dispatcher.forward(request, response);
	}

	String fileupload(Part part, String filepath, String filename) {
		String fullpath = filepath+"upload\\"+filename;
        try {
        	System.out.println("write : "+fullpath);
			part.write(fullpath);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Error fileupload");
		}

        return fullpath;
	}
}
