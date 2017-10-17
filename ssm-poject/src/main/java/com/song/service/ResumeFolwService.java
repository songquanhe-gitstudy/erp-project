package com.song.service;

import java.util.List;

import com.song.model.ResumeFlowEntity;

/**
* create by: song on 2017年9月28日
* 
* 类说明:
*/

public interface ResumeFolwService {
	
	//保存流程记录
	void save(ResumeFlowEntity flowEntity);

	//用简历id查找指定的流程
	List<ResumeFlowEntity> findByResumeId(int id);
}
