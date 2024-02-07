package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ReqBean;
import com.dao.Dao;

/**
 * Servlet implementation class MakeReq
 */
@WebServlet("/MakeReq")
public class MakeReq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeReq() {
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
		String sid = request.getParameter("sid");
		String sql = "select * from distributor where email='"+uid+"'";
		String name = "", em = "", mob = "", com = "", loc = "";
		List<String> lt = Dao.getSeller(sql);
		Iterator<String> itr = lt.iterator();
		while(itr.hasNext()){
			name = itr.next();
			em = itr.next();
			mob = itr.next();
			com = itr.next();
			loc = itr.next();
		}
		sql = "insert into creq values(?,?,?,?,?,?,?)";
		ReqBean rb = new ReqBean();
		rb.setName(name);
		rb.setEm(em);
		rb.setMob(mob);
		rb.setCom(com);
		rb.setLoc(loc);
		rb.setSid(sid);
		int i = Dao.sendReq(sql, rb);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Request Sent to Seller Successfully...');");
			o.println("window.location='cserach.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Request not Sent');");
			o.println("window.location='cserach.jsp';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
