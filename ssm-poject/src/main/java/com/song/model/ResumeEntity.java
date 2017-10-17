package com.song.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ResumeEntity {
    private Integer resumeId;

    private Integer userId;

    private Integer toadminId;

    private String name;

    private String gender;

    private Integer age;

    private String phoneNumber;
    
    private String jobDept;

    private String jobPositon;

    private String preJob;

    private String exceptSalary;

    private String education;

    private String email;

    private String politicsStatus;  //政治面貌

    private String jobExp;

    private String hobbies;

    private String mark;

    private Integer state;
    
    @JSONField(format="yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date interviewDate;

}