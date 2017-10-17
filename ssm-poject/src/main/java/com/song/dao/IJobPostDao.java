package com.song.dao;

import java.util.List;

import com.song.model.JobPostEntity;

public interface IJobPostDao {
    int deleteByPrimaryKey(Integer postId);

    int insert(JobPostEntity record);

    int insertSelective(JobPostEntity record);

    JobPostEntity selectByPrimaryKey(Integer postId);

    int updateByPrimaryKeySelective(JobPostEntity record);

    int updateByPrimaryKey(JobPostEntity record);

	List<JobPostEntity> findPostByEmptId(int emptId);

	JobPostEntity findPostById(int id);

	List<JobPostEntity> findAllPosts();
}