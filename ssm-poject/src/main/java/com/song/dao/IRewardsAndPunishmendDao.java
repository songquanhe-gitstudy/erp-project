package com.song.dao;

import java.util.List;
import java.util.Map;

import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;

public interface IRewardsAndPunishmendDao {
    int deleteByPrimaryKey(Integer rapId);

    int insert(RewardsAndPunishmendEntity record);

    int insertSelective(RewardsAndPunishmendEntity record);

    RewardsAndPunishmendEntity selectByPrimaryKey(Integer rapId);

    int updateByPrimaryKeySelective(RewardsAndPunishmendEntity record);

    int updateByPrimaryKey(RewardsAndPunishmendEntity record);

	List<RewardsAndPunishmendEntity> findAllRecords();

	List<RewardsAndPunishmendEntity> findUserRecords(Integer uId);

	List<RewardsAndPunishmendEntity> findByYearAndMonth(Map<String, Object> map);

	List<RewardsAndPunishmendEntity> findByYearAndMonthNoUser(Map<String, Object> map);
}