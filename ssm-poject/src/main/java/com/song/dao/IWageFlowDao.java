package com.song.dao;

import java.util.List;

import com.song.model.WageFlowEntity;

public interface IWageFlowDao {
    int deleteByPrimaryKey(Integer flowId);

    int insert(WageFlowEntity record);

    int insertSelective(WageFlowEntity record);

    WageFlowEntity selectByPrimaryKey(Integer flowId);

    int updateByPrimaryKeySelective(WageFlowEntity record);

    int updateByPrimaryKey(WageFlowEntity record);

	List<WageFlowEntity> findByWageId(int id);
}