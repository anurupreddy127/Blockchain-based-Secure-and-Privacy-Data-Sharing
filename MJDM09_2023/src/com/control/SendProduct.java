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

import com.bean.KeyBean;
import com.dao.Dao;
import com.dao.PortNumber;

/**
 * Servlet implementation class SendProduct
 */
@WebServlet("/SendProduct")
public class SendProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendProduct() {
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
		String sql = "select * from orders where id="+id;
		String uid = "", pid = "", pname = "";
		String key = PortNumber.getKeys();
		List<String> lt = Dao.getValues(sql);
		Iterator<String> itr = lt.iterator();
		while(itr.hasNext()){
			uid = itr.next();
			pid = itr.next();
			pname = itr.next();
		}
		String cid = request.getParameter("cid");
		KeyBean kb = new KeyBean();
		kb.setUid(uid);
		kb.setPid(pid);
		kb.setPname(pname);
		kb.setKey(key);
		kb.setId(id);
		kb.setCid(cid);
		sql = "insert into pkey values(0,?,?,?,?,?,?,?,?)";
		int i = Dao.sendOrder(sql, kb);
		if (i > 0) {
			sql = "update orders set status1='Approved' where id="+id;
			Dao.update(sql);
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Order Send to Courier Successfully...');");
			o.println("window.location='sproduct.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Order not Sent to Courier');");
			o.println("window.location='sproduct.jsp';</script>");
		}
	}

}
