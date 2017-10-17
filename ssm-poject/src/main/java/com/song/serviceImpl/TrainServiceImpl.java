package com.song.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.ITrainDao;
import com.song.model.NewMessageEntity;
import com.song.model.TrainEntity;
import com.song.service.TrainService;

/**
* create by: song on 2017年9月26日
* 
* 类说明:
*/

@Service
public class TrainServiceImpl implements TrainService{
	@Autowired
	private ITrainDao trainDao;

	@Override
	public List<TrainEntity> findAll() {
		return trainDao.findAll();
	}

	@Override
	public void addTrain(TrainEntity entity) {
		trainDao.insert(entity);
	}

	@Override
	public void deleteTrainById(int id) {
		trainDao.deleteByPrimaryKey(id);
	}

	@Override
	public TrainEntity findById(int id) {
		return trainDao.selectByPrimaryKey(id);
	}

	@Override
	public void update(TrainEntity entity) {
		trainDao.updateByPrimaryKeySelective(entity);		
	}

	@Override
	public List<TrainEntity> findByName(String name) {
		return trainDao.findByName(name);
	}


	@Override
	public List<NewMessageEntity> findTrainBytime(Integer deptId) {
		return trainDao.findTrainBytime(deptId);
	}

	@Override
	public List<TrainEntity> findByUid(Integer userId) {
		return trainDao.findByUid(userId);
	}

	@Override
	public List<TrainEntity> findByDeptId(Integer deptId) {
		return trainDao.findByDeptId(deptId);
	}

	@Override
	public TrainEntity findWityGrade(Map<String, Object> map) {
		return trainDao.findWityGrade(map);
	}

}
