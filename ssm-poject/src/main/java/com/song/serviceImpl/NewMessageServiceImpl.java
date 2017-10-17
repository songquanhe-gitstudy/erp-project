package com.song.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.INewMessageDao;
import com.song.model.NewMessageEntity;
import com.song.service.NewMessageService;

/**
* create by: song on 2017年9月29日
* 
* 类说明:
*/

@Service
public class NewMessageServiceImpl implements NewMessageService{
	@Autowired
	private INewMessageDao newMessageDao;
	
	
	@Override
	public void save(NewMessageEntity messageEntity) {
		newMessageDao.insertSelective(messageEntity);		
	}


	@Override
	public List<NewMessageEntity> findInterViewByUId(Integer userId) {
		return newMessageDao.findInterViewByUId(userId);
	}


	@Override
	public void update(NewMessageEntity newMessageEntity) {
		newMessageDao.updateByPrimaryKeySelective(newMessageEntity);		
	}


	@Override
	public List<NewMessageEntity> findAllInterViewByUId(Integer userId) {
		return newMessageDao.findAllInterViewByUId(userId);
	}


	@Override
	public List<NewMessageEntity> findAppointByUId(Integer userId) {
		return newMessageDao.findAppointByUId(userId);
	}


	@Override
	public List<NewMessageEntity> findAllAppointByUId(Integer userId) {
		return newMessageDao.findAllAppointByUId(userId);
	}


	@Override
	public List<NewMessageEntity> findTrainByUid(Integer userId) {
		return newMessageDao.findTrainByUid(userId);
	}


	@Override
	public List<NewMessageEntity> findAllMessageByUId(Integer userId) {
		return newMessageDao.findAllMessageByUId(userId);
	}


	@Override
	public List<NewMessageEntity> findTrainBytime(Integer uid) {
		return newMessageDao.findTrainBytime(uid);
	}



}
