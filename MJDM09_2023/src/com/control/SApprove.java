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
 * Servlet implementation class SApprove
 */
@WebServlet("/SApprove")
public class SApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SApprove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		HttpSession session = request.getSession(false);
		String uid = (String) session.getAttribute("uid");
		String cid = request.getParameter("cid");
		String sql = "update creq set status1='Approve' where sid='"+uid+"' and cid='"+cid+"'";
		int i = Dao.update(sql);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Courier Request Accepted Successfully...');");
			o.println("window.location='scourier.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Courier Request not Accepted');");
			o.println("window.location='scourier.jsp';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
