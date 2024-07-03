package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ismspdao.ismspdao;
import ismspdto.managedto;

@WebServlet("/docmanage")
public class docmanage extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		System.out.println("start : "+starttime);
		System.out.println("start : "+endtime);
        ismspdao db = new ismspdao();
        List<managedto> managelist = null;
        try {
			managelist = db.selectManageTable(starttime, endtime);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("managelist", managelist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("docmanage.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post manage");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		System.out.println("start : "+starttime);
		if(starttime!=null && !starttime.equals("")) {
			String[] tmp = starttime.split("-");
			starttime = tmp[2]+"-"+tmp[1]+"-"+tmp[0];
		}
		if(starttime.equals(""))
			starttime = null;
		System.out.println("end : "+endtime);
		if(endtime!=null && !endtime.equals("")) {
			String[] tmp = endtime.split("-");
			endtime = tmp[2]+"-"+tmp[1]+"-"+tmp[0];
		}
		if(endtime.equals(""))
			endtime = null;
        ismspdao db = new ismspdao();
        List<managedto> managelist = null;
        try {
			managelist = db.selectManageTable(starttime, endtime);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("managelist", managelist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("docmanage.jsp");
		dispatcher.forward(request, response);
	}
}
