package com.song.utils;

/**
* create by: song on 2017年9月27日
* 
* 类说明:简历流程状态
*/

public enum ResumeFlow {
	collect(1, "管理员收取简历"), check(2, "管理员查阅简历"), mark(3, "标记"), advice(4, "通知面试")
	, dpetManage(5, "通知部门管理人面试"), offer(6, "录用"), noOffer(7, "不录用");
	
	
	private ResumeFlow(int code, String describe) {
		this.code = code;
		this.describe = describe;
	}
	
	private int code;
	private String describe;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	

}
