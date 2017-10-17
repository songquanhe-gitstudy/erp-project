package com.song.utils;

/**
* create by: song on 2017年9月26日
* 
* 类说明:员工状态
*/

public enum UserState {
	ONJOB("在职"), TRYOUT("试用"), PRACTICE("实习"), OUTJOB("离职"), All("所有"), visitor("游客");
	
	private String state;

	private UserState(String state) {
		this.state = state;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
}
