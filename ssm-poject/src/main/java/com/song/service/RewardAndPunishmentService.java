package com.song.service;

import java.util.List;
import java.util.Map;

import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;

/**
* create by: song on 2017年10月1日
* 
* 类说明:
*/

public interface RewardAndPunishmentService {

	//获取所有的奖惩记录
	List<RewardsAndPunishmendEntity> findAllRecords();

	//获取所属员工的奖惩记录
	List<RewardsAndPunishmendEntity> findUserRecords(Integer uId);

	//保存奖惩记录
	void save(RewardsAndPunishmendEntity rapEntity);

	//按照年月人查询奖惩记录
	List<RewardsAndPunishmendEntity> findByYearAndMonth(Map<String, Object> map);

	//按照年月查询奖惩记录
	List<RewardsAndPunishmendEntity> findByYearAndMonthNoUser(Map<String, Object> map);

	//删除奖惩记录
	void delById(int id);

	//根据id找记录
	RewardsAndPunishmendEntity findRecordById(int id);

	//更新记录
	void update(RewardsAndPunishmendEntity entity);

}
