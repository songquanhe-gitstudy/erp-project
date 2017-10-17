package com.song.utils;

/**
* create by: song on 2017年9月24日
* 
* 类说明:简历状态
*/

public enum ResumeState {
	WAIT("未提交", 1), SUBMIT("已提交", 2), SUCCESS("通过", 3), FAIL("未通过", 4);
	
	private String message;
	private int state;
	
	private ResumeState(String message, int state) {
		this.message = message;
		this.state = state;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	
	
	

}
