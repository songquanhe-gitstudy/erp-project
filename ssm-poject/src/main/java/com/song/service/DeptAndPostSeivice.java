package com.song.service;

import java.util.List;

import com.song.model.DeptEntity;
import com.song.model.JobPostEntity;
import com.song.model.userEntity;

/**
* create by: song on 2017年9月24日
* 
* 类说明:
*/

public interface DeptAndPostSeivice {

	//查询所有部门信息
	List<DeptEntity> findAllDepts();

	//通过部门查找职位信息
	List<JobPostEntity> findPostByEmptId(int emptId);

	//根据职位id找职位
	JobPostEntity findPostById(int id);
	
	//根据职位id找部门
	DeptEntity findDempById(Integer parentId);

	//添加部门
	void save(DeptEntity entity);

	//更新部门信息
	void update(DeptEntity entity);

	//删除部门
	int deleteById(int id);

	//添加职位
	void savePost(JobPostEntity entity);

	//更新职位信息
	void updatePost(JobPostEntity entity);

	//删除职位
	void deletePostById(int id);

	//所有职位
	List<JobPostEntity> findAllPosts();

	//根据部门id找所有的员工
	List<userEntity> findAllEmpByDid(Integer deptId);

}
