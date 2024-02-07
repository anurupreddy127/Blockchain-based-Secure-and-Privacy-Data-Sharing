package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.DeliveyBean;
import com.dao.Dao;

/**
 * Servlet implementation class AddDB
 */
@WebServlet("/AddDB")
public class AddDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDB() {
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
		String name = request.getParameter("name");
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		String mob = request.getParameter("mob");
		String loc = request.getParameter("loc");
		HttpSession session = request.getSession(false);
		String cid = (String) session.getAttribute("uid");
		String sql = "insert into deliveryboy values(?,?,?,?,?,?,?)";
		DeliveyBean db = new DeliveyBean();
		db.setId(id);
		db.setName(name);
		db.setUid(uid);
		db.setPwd(pwd);
		db.setMob(mob);
		db.setLoc(loc);
		db.setCid(cid);
		int i = Dao.deliveryBoy(sql, db);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Delivery Boy Added Successfully...');");
			o.println("window.location='cdb.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='cdb.jsp';</script>");
		}
	}

}
