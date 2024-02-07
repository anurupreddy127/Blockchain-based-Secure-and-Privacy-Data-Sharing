package com.control;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bean.UploadBean;
import com.dao.Dao;

/**
 * Servlet implementation class Upload
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		String pid = request.getParameter("pid");
		String pro = request.getParameter("pro");
		String pname = request.getParameter("pname");
		HttpSession session = request.getSession(false);
		String sql = "select company from seller where email='"+session.getAttribute("uid")+"'";
		String com = Dao.getName(sql);
		String fea = request.getParameter("fea");
		double cost = Double.parseDouble(request.getParameter("cost"));
		int qun = Integer.parseInt(request.getParameter("qun"));
		InputStream img = null;
		Part photo = request.getPart("img");
		if(photo != null){
			img = photo.getInputStream();
		}
		sql = "insert into product values(?,?,?,?,?,?,?,?)";
		UploadBean ub = new UploadBean();
		ub.setPid(pid);
		ub.setPro(pro);
		ub.setPname(pname);
		ub.setCom(com);
		ub.setFea(fea);
		ub.setCost(cost);
		ub.setQun(qun);
		ub.setImg(img);
		int i = Dao.upload(sql, ub);
		if (i > 0) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product Uploaded Successfully...');");
			o.println("window.location='upload.jsp';</script>");
		} else {
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Product not Uploaded');");
			o.println("window.location='upload.jsp';</script>");
		}
	}

}
