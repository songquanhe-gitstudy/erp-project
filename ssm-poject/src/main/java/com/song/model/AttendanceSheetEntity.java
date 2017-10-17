package com.song.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

public class AttendanceSheetEntity {
    private Integer id;

    private Integer userId;

    private String years;

    private String months;
    
	private String days;

	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	@JSONField(format="yyyy-MM-dd hh:mm:ss")
    private Date onWorkTime;	//上班时间

	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	@JSONField(format="yyyy-MM-dd hh:mm:ss")
    private Date outWorkTime;	//下班时间

    private String descript;	//状态描述

    private Integer ifLate;		//是否迟到

    private Integer ifKg;		//是否旷工

    private Integer ifJb;		//是否加班

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years == null ? null : years.trim();
    }

    public String getMonths() {
        return months;
    }

    public void setMonths(String months) {
        this.months = months == null ? null : months.trim();
    }

    public Date getOnWorkTime() {
        return onWorkTime;
    }

    public void setOnWorkTime(Date onWorkTime) {
        this.onWorkTime = onWorkTime;
    }

    public Date getOutWorkTime() {
        return outWorkTime;
    }

    public void setOutWorkTime(Date outWorkTime) {
        this.outWorkTime = outWorkTime;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript == null ? null : descript.trim();
    }

    public Integer getIfLate() {
        return ifLate;
    }

    public void setIfLate(Integer ifLate) {
        this.ifLate = ifLate;
    }

    public Integer getIfKg() {
        return ifKg;
    }

    public void setIfKg(Integer ifKg) {
        this.ifKg = ifKg;
    }

    public Integer getIfJb() {
        return ifJb;
    }

    public void setIfJb(Integer ifJb) {
        this.ifJb = ifJb;
    }

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}
    

}