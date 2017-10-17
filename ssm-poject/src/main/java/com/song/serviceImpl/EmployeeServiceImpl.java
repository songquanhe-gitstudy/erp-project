package com.song.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IUserDao;
import com.song.service.EmployeeService;

/**
* create by: song on 2017年9月25日
* 
* 类说明:
*/

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private IUserDao userDao;

}
