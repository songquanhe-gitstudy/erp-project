package com.song.utils;

import java.util.HashMap;
import java.util.Map;

/**
 *author:song
 *date:2017年7月23日
**/
public class CommonMsg {
	
	private int code;	//提示码
	
	private String msg;	//提示信息
	
	private Map<String, Object> map = new HashMap<>();
	
	public static CommonMsg success() {
		CommonMsg commonMsg = new CommonMsg();
		commonMsg.setCode(100);
		commonMsg.setMsg("访问成功!");
		return commonMsg;
	}
	
	public static CommonMsg fail() {
		CommonMsg commonMsg = new CommonMsg();
		commonMsg.setCode(200);
		commonMsg.setMsg("访问失败!");
		return commonMsg;
	}
	
	public static CommonMsg info() {
		CommonMsg commonMsg = new CommonMsg();
		commonMsg.setCode(300);
		commonMsg.setMsg("访问信息!");
		return commonMsg;
	}
	
	public CommonMsg add(String key, Object value) {
		this.getMap().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	}
