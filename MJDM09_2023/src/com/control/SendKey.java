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
 * Servlet implementation class SendKey
 */
@WebServlet("/SendKey")
public class SendKey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendKey() {
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
		String sql = "update pkey set astatus='Approved' where oid="+id;
		int i = Dao.update(sql);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product Key Sent to Buyer Successfully...');");
			o.println("window.location='areq.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product Key not Sent to Buyer');");
			o.println("window.location='sreg.jsp';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
