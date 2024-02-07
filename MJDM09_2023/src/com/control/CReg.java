package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.SellerBean;
import com.dao.Dao;

/**
 * Servlet implementation class CReg
 */
@WebServlet("/CReg")
public class CReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CReg() {
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
		String com = request.getParameter("com");
		String loc = request.getParameter("loc");
		String sql = "insert into distributor values(?,?,?,?,?,?)";
		SellerBean sb = new SellerBean();
		sb.setName(name);
		sb.setUid(uid);
		sb.setPwd(pwd);
		sb.setMob(mob);
		sb.setCom(com);
		sb.setLoc(loc);
		int i = Dao.courier(sql, sb);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Courier Company Register Successfully...');");
			o.println("window.location='courier.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='creg.jsp';</script>");
		}
	}

}
