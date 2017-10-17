package com.song.dao;

import java.util.List;

import com.song.model.TrainExamEntity;

public interface ITrainExamDao {
    int deleteByPrimaryKey(Integer examId);

    int insert(TrainExamEntity record);

    int insertSelective(TrainExamEntity record);

    TrainExamEntity selectByPrimaryKey(Integer examId);

    int updateByPrimaryKeySelective(TrainExamEntity record);

    int updateByPrimaryKey(TrainExamEntity record);

	List<TrainExamEntity> findExamNoTrainId();

	List<TrainExamEntity> findExamByTrainId(int trainId);
}