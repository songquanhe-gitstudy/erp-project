package com.song.dao;

import com.song.model.TrainGradeEntity;

public interface ITrainGradeDao {
    int deleteByPrimaryKey(Integer gradeId);

    int insert(TrainGradeEntity record);

    int insertSelective(TrainGradeEntity record);

    TrainGradeEntity selectByPrimaryKey(Integer gradeId);

    int updateByPrimaryKeySelective(TrainGradeEntity record);

    int updateByPrimaryKey(TrainGradeEntity record);
}