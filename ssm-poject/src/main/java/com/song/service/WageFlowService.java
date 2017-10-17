package com.song.service;

import java.util.List;

import com.song.model.WageFlowEntity;

/**
* create by: song on 2017年10月10日
* 
* 类说明:
*/

public interface WageFlowService {

	//保存复议记录
	void save(WageFlowEntity wfEntity);

	//根据记录wageid找所有的记录
	List<WageFlowEntity> findByWageId(int id);

}
