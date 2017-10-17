package com.song.dao;

import java.util.List;

import com.song.model.ResumeEntity;

public interface IResumeDao {
    int deleteByPrimaryKey(Integer resumeId);

    int insert(ResumeEntity record);

    int insertSelective(ResumeEntity record);

    ResumeEntity selectByPrimaryKey(Integer resumeId);

    int updateByPrimaryKeySelective(ResumeEntity record);

    int updateByPrimaryKey(ResumeEntity record);

	ResumeEntity findByUid(Integer userId);

	List<ResumeEntity> findAll();

	ResumeEntity findById(int id);

	List<ResumeEntity> findResumeByAppId(Integer userId);
}