package com.song.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IRewardsAndPunishmendDao;
import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;
import com.song.service.RewardAndPunishmentService;

/**
* create by: song on 2017年10月1日
* 
* 类说明:
*/

@Service
public class RewardAndPunishmentServiceImpl implements RewardAndPunishmentService{
	@Autowired
	private IRewardsAndPunishmendDao rewardAndPunishmentDao;

	@Override
	public List<RewardsAndPunishmendEntity> findAllRecords() {
		return rewardAndPunishmentDao.findAllRecords();
	}

	@Override
	public List<RewardsAndPunishmendEntity> findUserRecords(Integer uId) {
		return rewardAndPunishmentDao.findUserRecords(uId);
	}

	@Override
	public void save(RewardsAndPunishmendEntity rapEntity) {
		rewardAndPunishmentDao.insertSelective(rapEntity);
	}

	@Override
	public List<RewardsAndPunishmendEntity> findByYearAndMonth(Map<String, Object> map) {
		return rewardAndPunishmentDao.findByYearAndMonth(map);
	}

	@Override
	public List<RewardsAndPunishmendEntity> findByYearAndMonthNoUser(Map<String, Object> map) {
		return rewardAndPunishmentDao.findByYearAndMonthNoUser(map);
	}

	@Override
	public void delById(int id) {
		rewardAndPunishmentDao.deleteByPrimaryKey(id);
	}

	@Override
	public RewardsAndPunishmendEntity findRecordById(int id) {
		return rewardAndPunishmentDao.selectByPrimaryKey(id);
	}

	@Override
	public void update(RewardsAndPunishmendEntity entity) {
		rewardAndPunishmentDao.updateByPrimaryKeySelective(entity);
	}
	
	

}



