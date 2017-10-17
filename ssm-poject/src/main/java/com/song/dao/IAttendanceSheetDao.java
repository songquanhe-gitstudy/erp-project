package com.song.dao;

import java.util.List;
import java.util.Map;

import com.song.model.AttendanceSheetEntity;

public interface IAttendanceSheetDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AttendanceSheetEntity record);

    int insertSelective(AttendanceSheetEntity record);

    AttendanceSheetEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AttendanceSheetEntity record);

    int updateByPrimaryKey(AttendanceSheetEntity record);

	AttendanceSheetEntity findByDate(Map<String, Object> map);

	List<AttendanceSheetEntity> findByUid(Integer userId);

	List<AttendanceSheetEntity> findByYearAndMonth(Map<String, Object> map);

	List<AttendanceSheetEntity> findByYearAndMonthAndDay(Map<String, Object> map);

}