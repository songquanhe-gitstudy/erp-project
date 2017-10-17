package com.song.service;

import java.util.List;

import com.song.model.WageEntity;

/**
* create by: song on 2017年10月10日
* 
* 类说明:
*/


public interface WageService {

	//根据用户id找所属工资单
	List<WageEntity> findWageByUid(Integer userId);

	//更新工资单
	void updateUserWage(WageEntity entity);

	//所有处于复议中的记录
	List<WageEntity> getReConsiderWage();

	//保存工资单
	void save(WageEntity wageEntity);

	//判断当前年上个月有木有打卡
	int checkRecords(String years, String months);

}
