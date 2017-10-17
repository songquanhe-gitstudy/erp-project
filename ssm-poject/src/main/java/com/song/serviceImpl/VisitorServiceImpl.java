package com.song.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.song.dao.IInviteInfoDao;
import com.song.model.InviteInfoEntity;
import com.song.service.VisitorService;

/**
* create by: song on 2017年9月23日
* 
* 类说明:
*/

@Service
public class VisitorServiceImpl implements VisitorService{
	@Autowired
	private IInviteInfoDao inviterInfoDao;

	@Override
	public List<InviteInfoEntity> getAllInviter() {
		return inviterInfoDao.findAll();
	}

}
