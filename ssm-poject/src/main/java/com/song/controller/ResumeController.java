package com.song.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.mail.InviterViewMail;
import com.song.model.JobPostEntity;
import com.song.model.NewMessageEntity;
import com.song.model.ResumeEntity;
import com.song.model.ResumeFlowEntity;
import com.song.model.userEntity;
import com.song.service.DeptAndPostSeivice;
import com.song.service.LoginService;
import com.song.service.NewMessageService;
import com.song.service.ResumeFolwService;
import com.song.service.ResumeService;
import com.song.utils.CommonMsg;
import com.song.utils.MessageConstant;
import com.song.utils.ResumeFlow;
import com.song.utils.RoleState;
import com.song.utils.TimeStamp;
import com.song.utils.UserState;

/**
* create by: song on 2017年9月27日
* 
* 类说明:
*/
@Controller
@RequestMapping("/resume")
public class ResumeController {
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private ResumeFolwService resumeFlowService;
	@Autowired
	private NewMessageService newMessageService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private DeptAndPostSeivice deptAndPostService;
	
	/**
	 * 查出所有简历
	 * @param pn
	 * @return
	 */
	@RequestMapping("/showResumeData/{pn}")
	@ResponseBody
	public CommonMsg showResumeData(@PathVariable(value="pn", required=false)int pn) {
		PageHelper.startPage(pn, 5);
		List<ResumeEntity> resumeList = resumeService.findAll();
		
		PageInfo pageInfo = new PageInfo(resumeList, 3);
		return CommonMsg.success().add("list", pageInfo);
	}
	
	/**
	 * 按id查找
	 */
	@RequestMapping(value="/getResumeInfo/{id}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getResumeInfo(@PathVariable(value="id")int id) {
		ResumeEntity entity = resumeService.findById(id);
		return CommonMsg.success().add("entity", entity);
	}
	
	/**
	 * 按id删除
	 */
	@RequestMapping("/deleteResume/{id}")
	@ResponseBody
	public CommonMsg deleteResume(@PathVariable(value="id")int id) {
		resumeService.deleteById(id);
		return CommonMsg.success();
	}
	
	/**
	 * 查出所属指派面试人的简历
	 */
	@RequestMapping("/getAppointResumeData/{pn}")
	@ResponseBody
	public CommonMsg getAppointResumeData(@PathVariable(value="pn")int pn, HttpSession session) {
		userEntity user = (userEntity)session.getAttribute("user");
		PageHelper.startPage(pn, 3);
		List<ResumeEntity> resumeList = resumeService.findResumeByAppId(user.getUserId());
		if(resumeList.size() > 0) {
			PageInfo pageInfo = new PageInfo(resumeList, 3); 
			return CommonMsg.success().add("list", pageInfo);
		}else {
			return CommonMsg.fail();
		}
	}
	
	/**
	 * 重写简历（删除）
	 */
	@RequestMapping("/writeResumeAgain/{resumeId}")
	@ResponseBody
	public CommonMsg writeResumeAgain(@PathVariable(value="resumeId")int resumeId) {
		resumeService.deleteById(resumeId);
		return CommonMsg.success();
	}
	
	
	//======================================简历流程相关====================================================
	/**
	 * 更新成已经查阅状态
	 */
	@RequestMapping("/updateResumeCheck")
	@ResponseBody
	public CommonMsg updateResumeCheck(int id, int state) {
		//如果状态大于要发展得状态则不操作
		if(state >= ResumeFlow.check.getCode()) {
			return CommonMsg.success();
		}
		//否则更新状态
		ResumeEntity entity = resumeService.findById(id);
		entity.setState(ResumeFlow.check.getCode());
		resumeService.updateById(entity);
		//流程操作
		ResumeFlowEntity flowEntity = new ResumeFlowEntity();
		flowEntity.setResumeId(id);
		flowEntity.setContent(ResumeFlow.check.getDescribe());
		flowEntity.setCreateTime(new Date());
		flowEntity.setState(ResumeFlow.check.getCode());
		flowEntity.setOperatorNow("admin");
		resumeFlowService.save(flowEntity);
		return CommonMsg.success();
	}
	
	/**
	 * 通知投简历人去面试
	 * @throws ParseException 
	 */
	@RequestMapping("/updateResumeAdvice")
	@ResponseBody
	public CommonMsg updateResumeAdvice(int id, String interviewDates) throws ParseException {
		//找到该简历
		ResumeEntity entity = resumeService.findById(id);
		entity.setInterviewDate(TimeStamp.stampToDate(interviewDates));
		//状态设置为通知面试
		entity.setState(ResumeFlow.advice.getCode());
		
		resumeService.updateById(entity);
		//游客面试消息记录
		NewMessageEntity messageEntity = new NewMessageEntity();
		messageEntity.setUserId(entity.getUserId());
		messageEntity.setCreateTime(new Date());
		messageEntity.setAssignId(id);
		messageEntity.setContent(MessageConstant.interViewinform);
		messageEntity.setMessageState(MessageConstant.messgevalid);
		messageEntity.setType(MessageConstant.interViewintype);
		messageEntity.setAppointedtime(TimeStamp.stampToDate(interviewDates));
		messageEntity.setSender("admin");
		newMessageService.save(messageEntity);
		
		//流程操作
		ResumeFlowEntity flowEntity = new ResumeFlowEntity();
		flowEntity.setResumeId(id);
		flowEntity.setContent(ResumeFlow.advice.getDescribe());
		flowEntity.setCreateTime(new Date());
		flowEntity.setState(ResumeFlow.advice.getCode());
		flowEntity.setOperatorNow("admin");
		resumeFlowService.save(flowEntity);
		
		//邮件通知
		ApplicationContext content=new ClassPathXmlApplicationContext("spring-mail.xml");
		InviterViewMail mail=	(InviterViewMail) content.getBean("mail");
	    System.out.println(mail);
	    try {
			mail.send(entity.getName(), entity.getEmail(), entity.getInterviewDate());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return CommonMsg.success();
	}
	
	/**
	 * 安排人员去给游客面试
	 * @throws ParseException 
	 */
	@RequestMapping("/updateResumeDeptManage")
	@ResponseBody
	public CommonMsg updateResumeDeptManage(int resume_id, int empId, String interviewDates) throws ParseException {
		ResumeEntity entity = resumeService.findById(resume_id);
		//安排的人
		entity.setToadminId(empId);
		//更新状态
		entity.setState(ResumeFlow.dpetManage.getCode());
		resumeService.updateById(entity);
		//面试人消息记录
		NewMessageEntity messageEntity = new NewMessageEntity();
		messageEntity.setUserId(empId);
		messageEntity.setCreateTime(new Date());
		messageEntity.setAssignId(resume_id);
		messageEntity.setContent(MessageConstant.appointinform);
		messageEntity.setMessageState(MessageConstant.messgevalid);
		messageEntity.setType(MessageConstant.appointtype);
		messageEntity.setAppointedtime(TimeStamp.stampToDate(interviewDates));
		messageEntity.setSender("admin");
		newMessageService.save(messageEntity);
		
		//流程操作
		ResumeFlowEntity flowEntity = new ResumeFlowEntity();
		flowEntity.setResumeId(resume_id);
		flowEntity.setContent(ResumeFlow.dpetManage.getDescribe());
		flowEntity.setCreateTime(new Date());
		flowEntity.setState(ResumeFlow.dpetManage.getCode());
		flowEntity.setOperatorNow("admin");
		resumeFlowService.save(flowEntity);
		return CommonMsg.success();
	}
	
	/**
	 * 录用游客,同时更新流程
	 */
	@RequestMapping("/offerVisitorResume")
	@ResponseBody
	public CommonMsg offerVisitorResume(userEntity entity, int resumeid, HttpSession session) {
		userEntity sUser = (userEntity)session.getAttribute("user");
		JobPostEntity postEntity = deptAndPostService.findPostById(sUser.getParentId());
		
		//更新游客为员工
		userEntity user = loginService.findById(entity.getUserId());
		user.setSalary(entity.getSalary());
		user.setRoleId(RoleState.EMPLOYEE.getCode());
		user.setParentId(entity.getParentId());
		user.setState(UserState.ONJOB.getState());
		loginService.update(user);
		//更新简历状态
		ResumeEntity resumeEntity = resumeService.findById(resumeid);
		resumeEntity.setState(ResumeFlow.offer.getCode());
		resumeService.updateById(resumeEntity);
		
		//流程操作
		ResumeFlowEntity flowEntity = new ResumeFlowEntity();
		flowEntity.setResumeId(resumeid);
		flowEntity.setContent(ResumeFlow.offer.getDescribe());
		flowEntity.setCreateTime(new Date());
		flowEntity.setState(ResumeFlow.offer.getCode());
		flowEntity.setOperatorNow(postEntity.getPostName()+"-"+ sUser.getUserName());
		resumeFlowService.save(flowEntity);
		return CommonMsg.success();
		
	}
	
	/**
	 * 不录用游客
	 */
	@RequestMapping("/refuseVisitorResume/{resumeid}")
	@ResponseBody
	public CommonMsg refuseVisitorResume(@PathVariable(value="resumeid")int resumeid, HttpSession session) {
		userEntity sUser = (userEntity)session.getAttribute("user");
		JobPostEntity postEntity = deptAndPostService.findPostById(sUser.getParentId());
		//更新简历状态
		ResumeEntity resumeEntity = resumeService.findById(resumeid);
		resumeEntity.setState(ResumeFlow.noOffer.getCode());
		resumeService.updateById(resumeEntity);
		
		//流程操作
		ResumeFlowEntity flowEntity = new ResumeFlowEntity();
		flowEntity.setResumeId(resumeid);
		flowEntity.setContent(ResumeFlow.noOffer.getDescribe());
		flowEntity.setCreateTime(new Date());
		flowEntity.setState(ResumeFlow.noOffer.getCode());
		flowEntity.setOperatorNow(postEntity.getPostName()+"-"+ sUser.getUserName());
		resumeFlowService.save(flowEntity);
		return CommonMsg.success();
	}

}















