package com.song.dao;

import java.util.List;

import com.song.model.ResumeFlowEntity;

public interface IResumeFlowDao {
    int deleteByPrimaryKey(Integer flowId);

    int insert(ResumeFlowEntity record);

    int insertSelective(ResumeFlowEntity record);

    ResumeFlowEntity selectByPrimaryKey(Integer flowId);

    int updateByPrimaryKeySelective(ResumeFlowEntity record);

    int updateByPrimaryKey(ResumeFlowEntity record);

	List<ResumeFlowEntity> findByResumeId(int id);
}