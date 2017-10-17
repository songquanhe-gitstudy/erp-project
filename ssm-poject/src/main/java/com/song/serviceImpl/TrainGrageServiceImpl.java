package com.song.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.ITrainGradeDao;
import com.song.model.TrainGradeEntity;
import com.song.service.TrainGrageService;

/**
* create by: song on 2017年10月13日
* 
* 类说明:
*/
@Service
public class TrainGrageServiceImpl implements TrainGrageService{
	@Autowired
	private ITrainGradeDao trainGradeDao;

	@Override
	public void save(TrainGradeEntity tgEntity) {
		trainGradeDao.insertSelective(tgEntity);		
	}

}
