package com.song.service;

import java.util.Date;
import java.util.List;

import com.song.model.NewMessageEntity;

/**
* create by: song on 2017年9月29日
* 
* 类说明:
*/

public interface NewMessageService {

	//保存消息
	void save(NewMessageEntity messageEntity);

	//所有最新（有效）面试信息
	List<NewMessageEntity> findInterViewByUId(Integer userId);

	//更新消息
	void update(NewMessageEntity newMessageEntity);

	//所有面试信息
	List<NewMessageEntity> findAllInterViewByUId(Integer userId);

	//员工面试最新消息
	List<NewMessageEntity> findAppointByUId(Integer userId);

	//所有指定员工面试信息
	List<NewMessageEntity> findAllAppointByUId(Integer userId);

	//培训消息查询
	List<NewMessageEntity> findTrainByUid(Integer userId);

	//员工所有消息
	List<NewMessageEntity> findAllMessageByUId(Integer userId);

	//根据时间查培训消息
	List<NewMessageEntity> findTrainBytime(Integer uid);

}
