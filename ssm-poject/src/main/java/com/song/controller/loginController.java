package com.song.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.song.model.userEntity;
import com.song.service.LoginService;
import com.song.utils.CommonMsg;
import com.song.utils.RoleState;
import com.song.utils.UserState;

/**
* create by: song on 2017年9月23日
* 
* 类说明:登录注册功能
*/

@Controller
@RequestMapping("user")
public class loginController {
	@Autowired
	private LoginService loginService;
	
	//登录跳转
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "../../login";
    }
	
	/**
	 * 登录
	 * @param entity
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String  login(userEntity entity, HttpSession session) {
		userEntity loginer = loginService.find(entity);
		if(loginer != null) {
			session.setAttribute("user", loginer);
			if (loginer.getRoleId() == 1) {
				return "redirect:/admin/showEmpInfo";
			} else if (loginer.getRoleId() == 2) {
				return "redirect:/employee/showEmpMessage";
			} else if (loginer.getRoleId() == 3) {
				return "redirect:/visitor/showViMessageInfo";
			}
		}
		return "redirect:/login.jsp";
	}
	
	/**
	 * 注册
	 * @param entity
	 * @return
	 * @BindingResult 封装校验结果
	 */
	@RequestMapping(value="register", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg registerUser(@Valid userEntity entity, BindingResult result) {
		if(result.hasErrors()){
			//拿出所有字段的校验信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errorsList = result.getFieldErrors();
			for (FieldError fieldError : errorsList) {
				//fieldError.getField()  错误字段
				//fieldError.getDefaultMessage()  错误信息 
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			
			return CommonMsg.fail().add("errorFields", map);
		}else {
			//注册时为游客
			entity.setRoleId(RoleState.VISIITOR.getCode());
			entity.setCreateTime(new Date());
			entity.setState(UserState.visitor.getState());
			loginService.save(entity);
			return CommonMsg.success();
		}
		
		
	}
	
	/**
	 * 根据用户id找用户
	 */
	@RequestMapping("/getEmpNameById/{uid}")
	@ResponseBody
	public CommonMsg getEmpNameById(@PathVariable(value="uid")int uid) {
		userEntity user = loginService.getEmpById(uid);
		return CommonMsg.success().add("entity", user);
	}
	
	/**
	 *检验用户名是否存在 
	 */
	@RequestMapping(value="/checkuser", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg checkuser(@RequestParam(value="empName")String empName) {
		userEntity user = loginService.checkUser(empName);
		if(user != null){
			return CommonMsg.success();
		}
		return CommonMsg.fail();
		
	}
}
















