package com.song.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.song.model.DeptEntity;
import com.song.model.JobPostEntity;
import com.song.model.userEntity;
import com.song.service.DeptAndPostSeivice;
import com.song.service.LoginService;
import com.song.utils.CommonMsg;

/**
* create by: song on 2017年9月24日
* 
* 类说明:
*/

@Controller
@RequestMapping("/deptPost")
public class DeptAndPostController {
	@Autowired
	private DeptAndPostSeivice deptAndPostSeivice;
	@Autowired
	private LoginService loginService;
	
	/**
	 * 查所有部门
	 * @return
	 */
	@RequestMapping("/getDepts")
	@ResponseBody
	public CommonMsg getDepts() {
		List<DeptEntity> deptList = deptAndPostSeivice.findAllDepts();
		
		return CommonMsg.success().add("deptList", deptList);
	}
	
	/**
	 * 所有职位
	 */
	@RequestMapping("/getPosts")
	@ResponseBody
	public CommonMsg getPosts() {
		List<JobPostEntity> postList = deptAndPostSeivice.findAllPosts();
		
		return CommonMsg.success().add("postList", postList);
	}
	
	/**
	 * 添加职位
	 */
	 @RequestMapping("PostAdd")
		@ResponseBody
		public CommonMsg PostAdd(JobPostEntity entity) {
			entity.setCreateDate(new Date());
			deptAndPostSeivice.savePost(entity);
			return CommonMsg.success();
		}
	 
	 /**
	  * 更新职位信息
	  */
	  @RequestMapping(value="/updatePost", method=RequestMethod.POST)
	  @ResponseBody
	  public CommonMsg updatePost(JobPostEntity entity) {
		  deptAndPostSeivice.updatePost(entity);
		  return CommonMsg.success();
		}
	  
	  /**
	   * 删除职位
	   */
	  	@RequestMapping("/PostDel/{id}")
		@ResponseBody
		public CommonMsg PostDel(@PathVariable(value="id", required=false)int id) {
			int count = 0;
			//找职位是否还有员工
			List<userEntity> empEntity = loginService.findAllEmps(id);
			if(empEntity.size() == 0) {
				count = 1;
				deptAndPostSeivice.deletePostById(id);
				return CommonMsg.success().add("list", count);
			}
			return CommonMsg.success().add("list", count);
		}
	  
	
	/**
	 * 添加部门
	 */
	@RequestMapping("deptAdd")
	@ResponseBody
	public CommonMsg deptAdd(DeptEntity entity) {
		entity.setCreateDate(new Date());
		deptAndPostSeivice.save(entity);
		return CommonMsg.success();
	}
	
	/**
	 * 更新部门信息
	 */
	@RequestMapping(value="/updateDept", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg updateDept(DeptEntity entity) {
		deptAndPostSeivice.update(entity);
		return CommonMsg.success();
	}
	
	/**
	 * 删除部门
	 */
	@RequestMapping("/deptDel/{id}")
	@ResponseBody
	public CommonMsg deptDel(@PathVariable(value="id", required=false)int id) {
		int count = 0;
		//找部门是否还有职位
		List<JobPostEntity> postEntity = deptAndPostSeivice.findPostByEmptId(id);
		if(postEntity.size() == 0) {
			count = 1;
			deptAndPostSeivice.deleteById(id);
			return CommonMsg.success().add("list", count);
		}
		return CommonMsg.success().add("list", count);
	}
	
	/**
	 * 根据部门id去查找职位
	 * @param emptId
	 * @return
	 */
	@RequestMapping(value="/getPosts/{emptId}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getPosts(@PathVariable(value="emptId", required=false)int emptId) {
		List<JobPostEntity> jobPostList = deptAndPostSeivice.findPostByEmptId(emptId);
		
		return CommonMsg.success().add("jobPostList", jobPostList);
	}
	
	/**
	 * 根据职位id去拿所有员工
	 */
	@RequestMapping("/getEmps/{postId}")
	@ResponseBody
	public CommonMsg getEmps(@PathVariable(value="postId", required=false)int postId) {
		List<userEntity> empList = loginService.findAllEmps(postId);
		
		return CommonMsg.success().add("empList", empList);
	}
	
	/**
	 * 根据职位id找职位
	 */
	@RequestMapping(value="/getPostById", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getPostById(@RequestParam(value="id", required=false)int id) {
		JobPostEntity entity = deptAndPostSeivice.findPostById(id);
		return CommonMsg.success().add("list", entity);
	}
	
	/**
	 * 根据职位id找部门
	 */
	@RequestMapping(value="/getDmptByPId", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getDmptByPId(@RequestParam(value="id", required=false)int id) {
		JobPostEntity postEntity = deptAndPostSeivice.findPostById(id);
		DeptEntity deptEntity = deptAndPostSeivice.findDempById(postEntity.getParentId());
		return CommonMsg.success().add("list", deptEntity);
	}
	
	/**
	 * 根据部门id找部门
	 */
	@RequestMapping(value="/getDeptBydID/{id}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getDeptBydID(@PathVariable(value="id", required=false)int id) {
		DeptEntity entity = deptAndPostSeivice.findDempById(id);
		return CommonMsg.success().add("list", entity);
	}
	
	/**
	 * 换岗
	 */
	@RequestMapping(value="/chDeptAndPost", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg chDeptAndPost(userEntity entity) {
		loginService.update(entity);
		return CommonMsg.success();
	}
}








