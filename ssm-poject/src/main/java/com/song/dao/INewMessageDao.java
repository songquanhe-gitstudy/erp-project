package com.song.dao;

import java.util.Date;
import java.util.List;

import com.song.model.NewMessageEntity;

public interface INewMessageDao {
    int deleteByPrimaryKey(Integer messageId);

    int insert(NewMessageEntity record);

    int insertSelective(NewMessageEntity record);

    NewMessageEntity selectByPrimaryKey(Integer messageId);

    int updateByPrimaryKeySelective(NewMessageEntity record);

    int updateByPrimaryKey(NewMessageEntity record);

	List<NewMessageEntity> findInterViewByUId(Integer userId);

	List<NewMessageEntity> findAllInterViewByUId(Integer userId);

	List<NewMessageEntity> findAppointByUId(Integer userId);

	List<NewMessageEntity> findAllAppointByUId(Integer userId);

	List<NewMessageEntity> findTrainByUid(Integer userId);

	List<NewMessageEntity> findAllMessageByUId(Integer userId);

	List<NewMessageEntity> findTrainBytime(int uid);
}