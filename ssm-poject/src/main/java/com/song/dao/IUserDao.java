package com.song.dao;

import java.util.List;

import com.song.model.userEntity;

public interface IUserDao {
    int deleteByPrimaryKey(Integer userId);

    int insert(userEntity record);

    int insertSelective(userEntity record);

    userEntity selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(userEntity record);

    int updateByPrimaryKey(userEntity record);

	userEntity find(userEntity entity);

	List<userEntity> findAllEmps(int postId);

	List<userEntity> findAll();

	List<userEntity> findByName(String name);

	List<userEntity> findEmpByRoleId();

	List<userEntity> findByNameAndState(String findByName, String state);

	userEntity getEmpById(int id);

	userEntity checkUser(String empName);
}