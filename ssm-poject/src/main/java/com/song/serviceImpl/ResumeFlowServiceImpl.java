package com.song.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IResumeFlowDao;
import com.song.model.ResumeFlowEntity;
import com.song.service.ResumeFolwService;

/**
* create by: song on 2017年9月28日
* 
* 类说明:
*/

@Service
public class ResumeFlowServiceImpl implements ResumeFolwService{
	@Autowired
	private IResumeFlowDao resumeDao;

	@Override
	public void save(ResumeFlowEntity flowEntity) {
		resumeDao.insertSelective(flowEntity);
	}

	@Override
	public List<ResumeFlowEntity> findByResumeId(int id) {
		return resumeDao.findByResumeId(id);
	}
}
















