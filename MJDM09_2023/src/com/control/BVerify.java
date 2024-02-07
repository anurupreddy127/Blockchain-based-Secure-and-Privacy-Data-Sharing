package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;

/**
 * Servlet implementation class BVerify
 */
@WebServlet("/BVerify")
public class BVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BVerify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		String id = request.getParameter("id");
		String db = request.getParameter("db");
		HttpSession session = request.getSession(false);
		String uid = (String) session.getAttribute("uid");
		String key = request.getParameter("key");
		String sql = "update breq set pkey='"+key+"', status1='Sent' where userid='"+uid+"' and id='"+id+"' and did='"+db+"'";
		System.out.println(sql);
		int i = Dao.update(sql);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Key Sent to Delivery Boy Successfully...');");
			o.println("window.location='bverify.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Key does not Sent to Delivery Boy');");
			o.println("window.location='bverify.jsp';</script>");
		}
	}

}
