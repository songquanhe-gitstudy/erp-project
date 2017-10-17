package com.song.dao;

import java.util.List;

import com.song.model.WageEntity;

public interface IWageDao {
    int deleteByPrimaryKey(Integer wageId);

    int insert(WageEntity record);

    int insertSelective(WageEntity record);

    WageEntity selectByPrimaryKey(Integer wageId);

    int updateByPrimaryKeySelective(WageEntity record);

    int updateByPrimaryKey(WageEntity record);

	List<WageEntity> findWageByUid(Integer id);

	List<WageEntity> getReConsiderWage();

	int checkRecords(String years, String months);
}