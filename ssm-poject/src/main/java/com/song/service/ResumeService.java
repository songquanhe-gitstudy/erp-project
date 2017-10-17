package com.song.service;

import java.util.List;

import com.song.model.ResumeEntity;

/**
* create by: song on 2017年9月24日
* 
* 类说明:
*/

public interface ResumeService {

	//提交简历
	void save(ResumeEntity entity);

	//根据用户查找简历
	ResumeEntity findByUid(Integer userId);

	//已经有了简历根据id更新简历
	void updateById(ResumeEntity entity);

	//找出所有简历
	List<ResumeEntity> findAll();

	//按id查找简历
	ResumeEntity findById(int id);

	//按照id删除简历
	void deleteById(int id);

	//面试官找到对应简历
	List<ResumeEntity> findResumeByAppId(Integer userId);
	
}
