package com.song.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.InviteInfoEntity;
import com.song.model.NewMessageEntity;
import com.song.model.ResumeEntity;
import com.song.model.ResumeFlowEntity;
import com.song.model.userEntity;
import com.song.service.NewMessageService;
import com.song.service.ResumeFolwService;
import com.song.service.ResumeService;
import com.song.service.VisitorService;
import com.song.utils.CommonMsg;
import com.song.utils.MessageConstant;
import com.song.utils.ResumeFlow;
import com.song.utils.ResumeState;

/**
* create by: song on 2017年9月23日
* 
* 类说明:用户操作
*/

@Controller
@RequestMapping("/visitor")
public class VisitorController {
	@Autowired
	private VisitorService visitorService;
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private ResumeFolwService resumeFlowService;
	@Autowired
	private NewMessageService newMessageService;
	
	/**
	 * 跳到消息页面,并做消息处理
	 */
	@RequestMapping("/showViMessageInfo")
	public String showMessageInfo(HttpSession session, Model model) {
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			//查出游客最新简历消息(有效)
			List<NewMessageEntity> messageList = newMessageService.findInterViewByUId(user.getUserId());
			//员工面试消息
			model.addAttribute("InterViewMessage", messageList.size());
		}
		return "visitor/viMessage";
	}

	/**
	 * 跳到招聘信息页面，消息处理
	 * @param pn
	 * @return
	 */
	@RequestMapping("/showInviterInfo")
	public String showInviterInfo() {
		
		return "visitor/showInvInfo";
	}
	
	/**
	 * 显示招聘信息分页
	 * @param pn
	 * @return
	 */
	@RequestMapping("/showInviterInfoJSON")
	@ResponseBody
	public PageInfo showInviterInfo(@RequestParam(value="pn", defaultValue="1", required=false)int pn) {
		//每页显示五条记录
		PageHelper.startPage(pn, 5);
		List<InviteInfoEntity> invInfoList = visitorService.getAllInviter();
		//导航栏显示3页
		PageInfo pageInfo = new PageInfo(invInfoList, 3);
		
		return pageInfo;
	}
	
	/**
	 * 进入简历页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/inviterWrite")
	public String inviterWrite(HttpSession session, Model model) {
		userEntity user = (userEntity) session.getAttribute("user");
		//通过用户id查是否本人已经有简历
		if(user != null) {
			ResumeEntity entity = resumeService.findByUid(user.getUserId());
			if(entity != null) {
				model.addAttribute("entity", JSON.toJSONString(entity));
				return "visitor/inviterWritePage";
			}
		}
		model.addAttribute("entity", "1");
		
		return "visitor/inviterWritePage";
	}
	
	/**
	 *提交简历 
	 * @param entity
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/saveResume", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg saveResume(ResumeEntity entity, HttpSession session) {
		userEntity user = (userEntity) session.getAttribute("user");
		entity.setUserId(user.getUserId()); 
		entity.setState(ResumeFlow.collect.getCode());
		resumeService.save(entity);
		
		//流程操作
		ResumeEntity findEntity = resumeService.findByUid(user.getUserId());
		ResumeFlowEntity flowEntity = new ResumeFlowEntity();
		flowEntity.setResumeId(findEntity.getResumeId());
		flowEntity.setContent(ResumeFlow.collect.getDescribe());
		flowEntity.setCreateTime(new Date());
		flowEntity.setState(ResumeFlow.collect.getCode());
		flowEntity.setOperatorNow("admin");
		resumeFlowService.save(flowEntity);
		return CommonMsg.success();
	}
	
	/**
	 * 修改简历(简历被查看后就不能修改)
	 */
	@RequestMapping("/updateResume")
	@ResponseBody
	public CommonMsg updateResume(ResumeEntity entity, HttpSession session){
		userEntity user = (userEntity) session.getAttribute("user");
		//查看是否有简历
		if(user != null) {
			ResumeEntity findEntity = resumeService.findByUid(user.getUserId());
			if(findEntity != null) {
				//已经有就更新
				entity.setUserId(user.getUserId());
				entity.setResumeId(findEntity.getResumeId());
				resumeService.updateById(entity);
				return CommonMsg.success();
			}
		}
		return CommonMsg.success();
	}
	
}













