package com.song.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TrainEntity {
    private Integer trainId;

    private Integer deptId;

    private String trainName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
   // @JSONField(format="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date trainTime;

    private String trainContent;

    private String recall;
    
    private int uid;	//培训的人
    
    private TrainGradeEntity trainGradeEntity;

}