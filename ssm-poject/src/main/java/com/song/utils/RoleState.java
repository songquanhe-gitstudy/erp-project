package com.song.utils;

/**
* create by: song on 2017年9月26日
* 
* 类说明:
*/

public enum RoleState {
	ADMIN("管理员", 1), EMPLOYEE("员工", 2), VISIITOR("游客", 3), OUTUER("离职", 4);
	
	private String rleName;
	private int code;
	
	private RoleState(String rleName, int code) {
		this.rleName = rleName;
		this.code = code;
	}
	public String getRleName() {
		return rleName;
	}
	public void setRleName(String rleName) {
		this.rleName = rleName;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	
}
