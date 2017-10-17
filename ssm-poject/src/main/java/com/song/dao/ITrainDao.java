package com.song.dao;

import java.util.List;
import java.util.Map;

import com.song.model.NewMessageEntity;
import com.song.model.TrainEntity;

public interface ITrainDao {
    int deleteByPrimaryKey(Integer trainId);

    int insert(TrainEntity record);

    int insertSelective(TrainEntity record);

    TrainEntity selectByPrimaryKey(Integer trainId);

    int updateByPrimaryKeySelective(TrainEntity record);

    int updateByPrimaryKey(TrainEntity record);

	List<TrainEntity> findAll();

	List<TrainEntity> findByName(String name);

	List<NewMessageEntity> findTrainBytime(Integer deptId);

	List<TrainEntity> findByUid(Integer userId);

	List<TrainEntity> findByDeptId(Integer deptId);

	TrainEntity findWityGrade(Map<String, Object> map);
}