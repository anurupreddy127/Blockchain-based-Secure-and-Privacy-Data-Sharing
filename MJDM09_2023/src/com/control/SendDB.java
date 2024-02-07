package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.SendBean;
import com.dao.Dao;

/**
 * Servlet implementation class SendDB
 */
@WebServlet("/SendDB")
public class SendDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendDB() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String uid = request.getParameter("uid");
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String qun = request.getParameter("qun");
		String price = request.getParameter("price");
		String key = request.getParameter("key");
		String db = request.getParameter("db");
		String sql = "insert into dkey values(?,?,?,?,?,?,?,?,?)";
		SendBean sb = new SendBean();
		sb.setId(id);
		sb.setUid(uid);
		sb.setPid(pid);
		sb.setPname(pname);
		sb.setQun(qun);
		sb.setPrice(price);
		sb.setKey(key);
		sb.setDb(db);
		int i = Dao.sendKey(sql, sb);
		if (i > 0) {
			sql = "update pkey set sstatus='Approved' where oid="+id;
			Dao.update(sql);
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product Sent to Delivery Boy Successfully...');");
			o.println("window.location='ckey.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Prodcut not Sent to Delivery Boy');");
			o.println("window.location='ckey.jsp';</script>");
		}
	}

}
