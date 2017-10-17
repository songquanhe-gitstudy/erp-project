package com.song.service;

import java.util.List;
import java.util.Map;

import com.song.model.NewMessageEntity;
import com.song.model.TrainEntity;

/**
* create by: song on 2017年9月26日
* 
* 类说明:
*/

public interface TrainService {

	//查出所有的培训信息
	List<TrainEntity> findAll();

	//增加培训信息
	void addTrain(TrainEntity entity);

	//删除培训
	void deleteTrainById(int id);

	//按id找培训
	TrainEntity findById(int id);

	//更新
	void update(TrainEntity entity);

	//用名字模糊查询
	List<TrainEntity> findByName(String name);

	//根据部门id找所有的培训信息
	List<TrainEntity> findByDeptId(Integer integer);

	List<NewMessageEntity> findTrainBytime(Integer deptId);

	//更具培训人id去查培训
	List<TrainEntity> findByUid(Integer userId);

	//查有成绩的培训记录
	TrainEntity findWityGrade(Map<String, Object> map);

}
