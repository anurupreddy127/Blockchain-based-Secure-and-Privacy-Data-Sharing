package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.BReqBean;
import com.dao.Dao;

/**
 * Servlet implementation class BReq
 */
@WebServlet("/BReq")
public class BReq extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BReq() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		HttpSession session = request.getSession(false);
		String did = (String) session.getAttribute("uid");
		String uid = request.getParameter("uid");
		String id = request.getParameter("id");
		int d = Integer.parseInt(id);
		String sql = "select * from breq where id='" + id + "' and userid='"
				+ uid + "' and did='" + did + "'";
		if (Dao.login(sql)) {
			sql = "insert into breq(id,userid, did, status1) values(?,?,?,?)";
			BReqBean bb = new BReqBean();
			bb.setId(id);
			bb.setUid(uid);
			bb.setDid(did);
			int i = Dao.buyerReq(sql, bb);
			if (i > 0) {
				sql = "update dkey set status1='Approved' where userid='"+uid+"' and id="+d;
				Dao.update(sql);
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Prodcut Key Request Sent to Buyer Successfully...');");
				o.println("window.location='dkey.jsp';</script>");
			} else {
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Prodcut Key Request not Sent to Buyer');");
				o.println("window.location='dkey.jsp';</script>");
			}
		} else {
			sql = "insert into breq(id,userid, did, status1) values(?,?,?,?)";
			BReqBean bb = new BReqBean();
			bb.setId(id);
			bb.setUid(uid);
			bb.setDid(did);
			int i = Dao.buyerReq(sql, bb);
			if (i > 0) {
				sql = "update dkey set status1='Approved' where userid='"+uid+"' and id="+d;
				Dao.update(sql);
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Prodcut Key Request Sent to Buyer Successfully...');");
				o.println("window.location='dkey.jsp';</script>");
			} else {
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Prodcut Key Request not Sent to Buyer');");
				o.println("window.location='dkey.jsp';</script>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
