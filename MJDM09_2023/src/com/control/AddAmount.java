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
 * Servlet implementation class AddAmount
 */
@WebServlet("/AddAmount")
public class AddAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAmount() {
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
		String price = request.getParameter("price");
		String qun = request.getParameter("qun");
		String acc = request.getParameter("acc");
		String pwd = request.getParameter("pwd");
		double amu = Double.parseDouble(request.getParameter("amu"));
		String sql = "select amount from deposite where uname='"+acc+"'";
		double a = Dao.getAmount(sql);
		amu = amu + a;
		sql = "update deposite set amount="+amu+" where uname='"+acc+"' and password='"+pwd+"'";
		int i = Dao.update(sql);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Amount Added into Account Successfully...');");
			o.println("window.location='payment.jsp?id="+id+"&&price="+price+"&&qun="+qun+"';</script>");
		}else{
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Amount not Added...');");
			o.println("window.location='bacc.jsp?id="+id+"&&price="+price+"&&qun="+qun+"';</script>");
		}
	}

}
