package com.song.service;

import java.util.List;

import com.song.model.userEntity;

/**
* create by: song on 2017年9月23日
* 
* 类说明:
*/

public interface LoginService {

	//登录信息校验
	userEntity find(userEntity entity);

	//注册
	void save(userEntity entity);

	//通过职位id去找该职位所有员工
	List<userEntity> findAllEmps(int postId);

	//更新员工信息
	void update(userEntity entity);

	//根据id找员工
	userEntity findById(Integer userId);

	//找所有的员工
	List<userEntity> findAll();

	//根据名字模糊查询
	List<userEntity> findByName(String findByName);

	//找所有的角色为员工的用户
	List<userEntity> findEmpByRoleId();

	//状态跟用户名查询
	List<userEntity> findByNameAndState(String findByName, String state);

	//获取用户
	userEntity getEmpById(int uid);

	//根据名字检查是否有此人
	userEntity checkUser(String empName);


}
