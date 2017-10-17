package com.song.dao;

import java.util.List;

import com.song.model.DeptEntity;

public interface IDeptDao {
    int deleteByPrimaryKey(Integer deptId);

    int insert(DeptEntity record);

    int insertSelective(DeptEntity record);

    DeptEntity selectByPrimaryKey(Integer deptId);

    int updateByPrimaryKeySelective(DeptEntity record);

    int updateByPrimaryKey(DeptEntity record);

	List<DeptEntity> findAllDepts();

	DeptEntity findDempByPid(int id);
}