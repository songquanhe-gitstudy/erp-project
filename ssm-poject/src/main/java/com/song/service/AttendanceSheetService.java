package com.song.service;

import java.util.List;
import java.util.Map;

import com.song.model.AttendanceSheetEntity;

/**
* create by: song on 2017年9月30日
* 
* 类说明:
*/

public interface AttendanceSheetService {

	//根据日期找到今天的上班记录
	AttendanceSheetEntity findByDate(Map<String, Object> map);

	//保存上班打卡记录
	void save(AttendanceSheetEntity entity);

	//更新下班打卡记录
	void update(AttendanceSheetEntity entity);

	//根据用户查找自己所有考勤记录
	List<AttendanceSheetEntity> findByUid(Integer userId);

	//按年月查考勤记录
	List<AttendanceSheetEntity> findByYearAndMonth(Map<String, Object> map);

	//年月日找今天的记录
	List<AttendanceSheetEntity> findByYearAndMonthAndDay(Map<String, Object> map);

}
