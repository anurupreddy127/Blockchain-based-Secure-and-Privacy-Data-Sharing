package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Dao;

/**
 * Servlet implementation class PVerify
 */
@WebServlet("/PVerify")
public class PVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PVerify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String uid = request.getParameter("uid");
		String key = request.getParameter("key");
		String sql = "select key1 from pkey where oid="+id+ " and uid='"+uid+"'";
		String key1 = Dao.getName(sql);
		if(key.equals(key1)){
			sql = "update breq set pkey='"+key+"', status1='Delivered' where userid='"+uid+"' and id='"+id+"'";
			Dao.update(sql);
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product Key Verified and Product Delivered Successfully...');");
			o.println("window.location='dverify.jsp';</script>");
		}else{
			sql = "update breq set status1='pending' where userid='"+uid+"' and id='"+id+"'";
			Dao.update(sql);
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product Key is Wrong...');");
			o.println("window.location='dverify.jsp';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
