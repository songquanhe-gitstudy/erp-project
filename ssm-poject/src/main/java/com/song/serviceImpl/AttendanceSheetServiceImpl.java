package com.song.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IAttendanceSheetDao;
import com.song.model.AttendanceSheetEntity;
import com.song.service.AttendanceSheetService;

/**
* create by: song on 2017年9月30日
* 
* 类说明:
*/

@Service
public class AttendanceSheetServiceImpl implements AttendanceSheetService{
	@Autowired
	private IAttendanceSheetDao attendanceSheetDao;

	@Override
	public AttendanceSheetEntity findByDate(Map<String, Object> map) {
		return attendanceSheetDao.findByDate(map);
	}

	@Override
	public void save(AttendanceSheetEntity entity) {
		attendanceSheetDao.insertSelective(entity);
	}

	@Override
	public void update(AttendanceSheetEntity entity) {
		attendanceSheetDao.updateByPrimaryKeySelective(entity);
	}

	@Override
	public List<AttendanceSheetEntity> findByUid(Integer userId) {
		return attendanceSheetDao.findByUid(userId);
	}

	@Override
	public List<AttendanceSheetEntity> findByYearAndMonth(Map<String, Object> map) {
		return attendanceSheetDao.findByYearAndMonth(map);
	}

	@Override
	public List<AttendanceSheetEntity> findByYearAndMonthAndDay(Map<String, Object> map) {
		return attendanceSheetDao.findByYearAndMonthAndDay(map);
	}

}
