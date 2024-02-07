package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.PaymentBean;
import com.dao.Dao;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
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
		String pid = request.getParameter("id");
		String acc = request.getParameter("acc");
		String pwd = request.getParameter("pwd");
		double price = Double.parseDouble(request.getParameter("price"));
		int qun = Integer.parseInt(request.getParameter("qun"));
		String sql = "select * from deposite where userid='"+uid+"' and uname='"+acc+"' and password='"+pwd+"'";
		if(Dao.login(sql)){
			sql = "select amount from deposite where uname='"+acc+"'";
			double amu = Dao.getAmount(sql);
			if(amu >= price){
				sql = "select name from product where pid='"+pid+"'";
				String pname = Dao.getName(sql);
				sql = "select company from product where pid='"+pid+"'";
				String com = Dao.getName(sql);
				PaymentBean pb = new PaymentBean();
				pb.setUid(uid);
				pb.setPid(pid);
				pb.setPname(pname);
				pb.setQun(qun);
				pb.setPrice(price);
				pb.setCom(com);
				sql = "insert into orders values(0,?,?,?,?,?,?,?)";
				int i = Dao.order(sql, pb);
				if (i > 0) {
					amu = amu - price;
					sql = "update deposite set amount="+amu+" where Uname='"+acc+"'";
					Dao.update(sql);
					o.println("<script type=\"text/javascript\">");
					o.println("alert('Order Placed Successfully... Please Wait for Product Key');");
					o.println("window.location='bhome.jsp';</script>");
				} else {
					price = price/qun;
					o.println("<script type=\"text/javascript\">");
					o.println("alert('Order not Placed');");
					o.println("window.location='payment.jsp?id="+pid+"&&price="+price+"&&qun="+qun+"';</script>");
				}
			}else{
				price = price/qun;
				o.println("<script type=\"text/javascript\">");
				o.println("alert('Insufficient Funds Please Add Amount...');");
				o.println("window.location='bacc.jsp?id="+pid+"&&price="+price+"&&qun="+qun+"';</script>");
			}
		}else{
			price = price/qun;
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Please enter valid Details');");
			o.println("window.location='payment.jsp?id="+pid+"&&price="+price+"&&qun="+qun+"';</script>");
		}
	}

}
