package com.bean;

import java.io.InputStream;

public class UploadBean {

	private String pid, pro, pname, com, fea;
	private double cost;
	private int qun;
	private InputStream img;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public String getFea() {
		return fea;
	}
	public void setFea(String fea) {
		this.fea = fea;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public int getQun() {
		return qun;
	}
	public void setQun(int qun) {
		this.qun = qun;
	}
	public InputStream getImg() {
		return img;
	}
	public void setImg(InputStream img) {
		this.img = img;
	}
}
