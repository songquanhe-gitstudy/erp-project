package com.song.model;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class WageEntity {
    private Integer wageId;

    private Integer empId;

    private String years;

    private String months;

    private BigDecimal totalWage;	//总工资

    private BigDecimal baseWage;	//基本工资

    private BigDecimal perfWage;	//绩效工资

    private BigDecimal ovWage;		//加班费

    private BigDecimal rapWage;		//奖惩金

    private BigDecimal jinpoWage;	//社保

    private Integer state;

    private String descript;	//附议内容

    private String adminDescript;	//管理员审核内容
    
    private userEntity user;

}