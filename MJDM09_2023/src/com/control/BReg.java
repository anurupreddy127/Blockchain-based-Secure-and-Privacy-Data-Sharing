package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.BuyerBean;
import com.dao.Dao;

/**
 * Servlet implementation class BReg
 */
@WebServlet("/BReg")
public class BReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BReg() {
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
		String name = request.getParameter("name");
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String mob = request.getParameter("mob");
		String loc = request.getParameter("loc");
		String add = request.getParameter("add");
		String sql = "insert into buyer values(?,?,?,?,?,?)";
		BuyerBean bb = new BuyerBean();
		bb.setName(name);
		bb.setUid(uid);
		bb.setPwd(pwd);
		bb.setMob(mob);
		bb.setLoc(loc);
		bb.setAdd(add);
		int i = Dao.buyer(sql, bb);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Buyer Register Successfully...');");
			o.println("window.location='buyer.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='breg.jsp';</script>");
		}
	}

}
