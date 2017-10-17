package com.song.dao;

import java.util.List;

import com.song.model.InviteInfoEntity;

public interface IInviteInfoDao {
    int deleteByPrimaryKey(Integer inviteId);

    int insert(InviteInfoEntity record);

    int insertSelective(InviteInfoEntity record);

    InviteInfoEntity selectByPrimaryKey(Integer inviteId);

    int updateByPrimaryKeySelective(InviteInfoEntity record);

    int updateByPrimaryKey(InviteInfoEntity record);

	List<InviteInfoEntity> findAll();

	List<InviteInfoEntity> findListByName(String name);
}