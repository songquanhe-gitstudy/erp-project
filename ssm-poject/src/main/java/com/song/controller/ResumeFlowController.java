package com.song.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.song.model.ResumeFlowEntity;
import com.song.service.ResumeFolwService;
import com.song.utils.CommonMsg;

/**
* create by: song on 2017年9月28日
* 
* 类说明:简历流程状态
*/

@Controller
@RequestMapping("/resumeFlow")
public class ResumeFlowController {
	@Autowired
	private ResumeFolwService resumeFolwService;
	
	/**
	 * 查询指定简历的所有状态
	 */
	@RequestMapping(value="/getFlowData/{id}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getFlowData(@PathVariable(value="id")int id) {
		List<ResumeFlowEntity> rfList = resumeFolwService.findByResumeId(id);
		
		return CommonMsg.success().add("rfList", rfList);
	}
}
















