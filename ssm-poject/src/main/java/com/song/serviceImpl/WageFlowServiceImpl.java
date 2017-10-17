package com.song.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IWageFlowDao;
import com.song.model.WageFlowEntity;
import com.song.service.WageFlowService;

/**
* create by: song on 2017年10月10日
* 
* 类说明:
*/

@Service
public class WageFlowServiceImpl implements WageFlowService{
	@Autowired
	private IWageFlowDao wageFlowDao;

	@Override
	public void save(WageFlowEntity wfEntity) {
		wageFlowDao.insertSelective(wfEntity);
	}

	@Override
	public List<WageFlowEntity> findByWageId(int id) {
		return wageFlowDao.findByWageId(id);
	}
	

}
