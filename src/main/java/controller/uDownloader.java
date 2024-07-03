package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/uDownloader")
public class uDownloader extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dstDownloadPath = "C:\\Users\\"+System.getProperty("user.name")+"\\Downloads";
		System.out.println("dst : "+dstDownloadPath);
		String filename = "인증심사_결과.pdf";
		filename = request.getParameter("filename");
		System.out.println("filename : "+filename);
		// 신청 서류 양식 다운받을 땐 \\download로 고쳐야 함
		String curFilePath = request.getSession().getServletContext().getRealPath("/")+"\\upload";
		File file = new File(curFilePath, filename);
		
		response.setContentType("application/octet-stream");
		String encodedFilename = URLEncoder.encode(filename, "UTF-8").replace("+", "%20");
		response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''"+encodedFilename);
		response.setContentLengthLong(file.length());
		System.out.println("file : "+file.getPath());
		response.setStatus(HttpServletResponse.SC_OK);
		
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		
		in = new BufferedInputStream(new FileInputStream(file));
		out = new BufferedOutputStream(response.getOutputStream());
		
		byte[] buffer = new byte[4096];
		int read = 0;
		while((read=in.read(buffer))!=-1) {
			out.write(buffer, 0, read);
		}
		in.close();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dstDownloadPath = "C:\\Users\\"+System.getProperty("user.name")+"\\Downloads";
		System.out.println("dst : "+dstDownloadPath);
		String filename = "인증심사_결과.pdf";
		String curFilePath = request.getSession().getServletContext().getRealPath("/")+"\\download";
		File file = new File(curFilePath, filename);
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename="+filename+";");
		response.setContentLengthLong(file.length());
		System.out.println("file : "+file.getPath());
		response.setStatus(HttpServletResponse.SC_OK);
		
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		
		in = new BufferedInputStream(new FileInputStream(file));
		out = new BufferedOutputStream(response.getOutputStream());
		
		byte[] buffer = new byte[4096];
		int read = 0;
		while((read=in.read(buffer))!=-1) {
			out.write(buffer, 0, read);
		}
		in.close();
		out.close();
	}
}
