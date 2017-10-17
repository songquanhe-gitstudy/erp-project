package com.song.service;

import java.util.List;

import com.song.model.TrainExamEntity;

/**
* create by: song on 2017年10月13日
* 
* 类说明:
*/

public interface TrainExamService {

	//选出无培训的试题
	List<TrainExamEntity> findExamNoTrainId();

	//更新
	void update(TrainExamEntity trainExamEntity);

	//根据培训id找试题
	List<TrainExamEntity> findExamByTrainId(int trainId);

}
