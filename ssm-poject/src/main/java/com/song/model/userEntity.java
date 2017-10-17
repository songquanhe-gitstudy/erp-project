package com.song.model;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class userEntity {
    private Integer userId;

    private Integer roleId;

    private Integer parentId;

    private Integer resumeId;

    @Pattern(regexp="(^[\u2E80-\u9FFF]{2,5}$)", message="用户名为2-5位中文")
    private String userName;

    private String age;

    @Pattern(regexp="^[A-Za-z]+[0-9]+[A-Za-z0-9]*|[0-9]+[A-Za-z]+[A-Za-z0-9]*$", message="密码必须由6-16个英文字母和数字的字符串组成")
    private String password;

    private String state;

    private String gender;

    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$", message="邮箱格式不正确")
    private String email;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    //@JSONField(format="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date birthDay;

    private String education;

    private Integer phoneNumber;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    //@JSONField(format="yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    
    private String reason;
    
    private String salary;

}