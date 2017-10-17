package com.song.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.ITrainExamDao;
import com.song.model.TrainExamEntity;
import com.song.service.TrainExamService;

/**
* create by: song on 2017年10月13日
* 
* 类说明:
*/
@Service
public class TrainExamServiceImpl implements TrainExamService{
	@Autowired
	private ITrainExamDao trainExamDao;

	@Override
	public List<TrainExamEntity> findExamNoTrainId() {
		return trainExamDao.findExamNoTrainId();
	}

	@Override
	public void update(TrainExamEntity trainExamEntity) {
		trainExamDao.updateByPrimaryKeySelective(trainExamEntity);
	}

	@Override
	public List<TrainExamEntity> findExamByTrainId(int trainId) {
		return trainExamDao.findExamByTrainId(trainId);
	}

}






