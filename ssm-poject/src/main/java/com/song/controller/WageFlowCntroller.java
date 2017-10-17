package com.song.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.song.model.ResumeFlowEntity;
import com.song.model.WageFlowEntity;
import com.song.service.WageFlowService;
import com.song.utils.CommonMsg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
* create by: song on 2017年10月10日
* 
* 类说明:工资复议流程
*/

@Controller
@RequestMapping("/wageFlow")
public class WageFlowCntroller {
	@Autowired
	private WageFlowService wageFlowServce;
	
	@RequestMapping(value="/getFlowData/{id}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getFlowData(@PathVariable(value="id")int id) {
		List<WageFlowEntity> wfList = wageFlowServce.findByWageId(id);
		
		return CommonMsg.success().add("wfList", wfList);
	}

}










