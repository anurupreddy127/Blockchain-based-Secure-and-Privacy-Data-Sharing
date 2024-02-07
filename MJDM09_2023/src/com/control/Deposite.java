package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.DepositeBean;
import com.dao.Dao;

/**
 * Servlet implementation class Deposite
 */
@WebServlet("/Deposite")
public class Deposite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposite() {
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
		HttpSession session = request.getSession(false);
		String uid = (String) session.getAttribute("uid");
		String acc = request.getParameter("acc");
		String pwd = request.getParameter("pwd");
		double amu = Double.parseDouble(request.getParameter("amu"));
		String sql = "insert into deposite values(?,?,?,?)";
		DepositeBean db = new DepositeBean();
		db.setUid(uid);
		db.setAcc(acc);
		db.setPwd(pwd);
		db.setAmu(amu);
		int i = Dao.createAcc(sql, db);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Amount Deposited Successfully...');");
			o.println("window.location='bdeposit.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Amount not Deposited');");
			o.println("window.location='bdeposit.jsp';</script>");
		}
	}

}
