package com.song.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.song.model.DeptEntity;
import com.song.model.JobPostEntity;
import com.song.model.NewMessageEntity;
import com.song.model.userEntity;
import com.song.service.DeptAndPostSeivice;
import com.song.service.EmployeeService;
import com.song.service.LoginService;
import com.song.service.NewMessageService;
import com.song.service.TrainService;

/**
* create by: song on 2017年9月25日
* 
* 类说明:员工操作
*/

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private NewMessageService newMessageService;
	@Autowired
	private DeptAndPostSeivice deptAndPostSeivice;
	@Autowired
	private TrainService trainService;
	
	/**
	 * 显示员工个人信息
	 * @param session:保存用户登录信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/showEmpInfo")
	public String showEmpInfo(HttpSession session, Model model) {
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			userEntity uEntity = loginService.findById(user.getUserId());
			if(uEntity != null) {
				model.addAttribute("entity", JSON.toJSONString(uEntity));
				return "employee/personalInfo";
			}
			model.addAttribute("entity", JSON.toJSONString(user));
		}
		
		return "employee/personalInfo";
	}
	
	/**
	 * 跳转到部门信息页面
	 * @return
	 */
	@RequestMapping("/showDeptInfo")
	public String showDeptInfo() {
		
		return "employee/deptInfo";
	}
	
	/**
	 *个人信息修改更新 
	 */
	@RequestMapping(value="/saveInfo", method=RequestMethod.POST)
	public String saveInfo(userEntity entity, HttpSession session) {
		userEntity user = (userEntity)session.getAttribute("user");
		entity.setUserId(user.getUserId());
		loginService.update(entity);
		
		return "forward:/employee/showEmpInfo";
	}
	
	/**
	 * 跳到培训页面
	 */
	@RequestMapping("/showEmpTrainInfo")
	public String showEmpTrainInfo() {
		
		return "employee/empTrainInfo";
	}
	
	/**
	 * 跳到面试信息页面
	 */
	@RequestMapping("/showInterViewInfo")
	public String showInterViewInfo() {
		
		return "employee/interViewInfo";
	}
	
	/**
	 * 员工新消息页面
	 * @throws ParseException 
	 */
	@RequestMapping("/showEmpMessage")
	public String showEmpMessage(HttpSession session, Model model) throws ParseException {
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			//查出员工最新面试消息(有效)
			List<NewMessageEntity> appointList = newMessageService.findAppointByUId(user.getUserId());
			//游客面试消息
			model.addAttribute("appointMessage", appointList.size());
			
			//查出员工培训消息
			List<NewMessageEntity> trainMessage = newMessageService.findTrainByUid(user.getUserId());
			model.addAttribute("trainMessage", trainMessage.size());
			
			//查出员工培训时间已到消息
			//根据用户获取部门
			JobPostEntity postEntity = deptAndPostSeivice.findPostById(user.getParentId());
			DeptEntity deptEntity = deptAndPostSeivice.findDempById(postEntity.getParentId());
			List<NewMessageEntity> trainStartMessage = trainService.findTrainBytime(deptEntity.getDeptId());
			model.addAttribute("trainStartMessage", trainStartMessage.size());
		}
		return "employee/empMessage";
	}
	
	/**
	 * 跳到个人考勤页面
	 */
	@RequestMapping("/showAttendanceSheet")
	public String showAttendanceSheet() {
		
		return "employee/attendanceSheet";
	}
	
	/**
	 * 跳转到个人奖惩页面
	 */
	@RequestMapping("/showRapInfo")
	public String showRapInfo() {
		
		return "employee/rapInfo";
	}
	
	/**
	 * 跳转到个人工资单页面
	 */
	@RequestMapping("/showWageInfo")
	public String showWageInfo() {
		
		return "employee/wageInfo";
	}
	
	/**
	 * 跳转到培训管理页面
	 */
	@RequestMapping("/showEmpTrainManage")
	public String showEmpTrainManage() {
		
		return "employee/empTrainManage";
	}

}
















