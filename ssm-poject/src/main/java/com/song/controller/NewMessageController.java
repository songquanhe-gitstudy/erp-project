package com.song.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.NewMessageEntity;
import com.song.model.userEntity;
import com.song.service.NewMessageService;
import com.song.utils.CommonMsg;
import com.song.utils.MessageConstant;

/**
* create by: song on 2017年9月29日
* 
* 类说明:消息操作
*/

@Controller
@RequestMapping("/newMessage")
public class NewMessageController {
	@Autowired
	private NewMessageService newMessageService;
	
	/**
	 * 游客信息显示
	 * @param pn
	 * @param session
	 * @return
	 */
	@RequestMapping("/getNewMessageData/{pn}")
	@ResponseBody
	public CommonMsg getNewMessageData(@PathVariable(value="pn")int pn, HttpSession session) {
		//找出所有游客面试信息
		PageHelper.startPage(pn, 5);
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			List<NewMessageEntity> messageLsit = newMessageService.findAllInterViewByUId(user.getUserId());
			PageInfo pageInfo = new PageInfo(messageLsit, 3);
			for (NewMessageEntity newMessageEntity : messageLsit) {
				if(newMessageEntity.getMessageState() == MessageConstant.messgevalid) {
					//将查出的有效信息置为失效
					newMessageEntity.setMessageState(MessageConstant.messageinvalid);
					newMessageService.update(newMessageEntity);
				}
			}
			return CommonMsg.success().add("pageInfo", pageInfo);
			
		}
		return CommonMsg.success();
	}
	
	/**
	 * 员工信息显示
	 */
	@RequestMapping("/getEmpMessageData/{pn}")
	@ResponseBody
	public CommonMsg getEmpMessageData(@PathVariable(value="pn")int pn, HttpSession session) {
		//找出所有游客面试信息
		PageHelper.startPage(pn, 5);
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			List<NewMessageEntity> messageLsit = newMessageService.findAllMessageByUId(user.getUserId());
			PageInfo pageInfo = new PageInfo(messageLsit, 3);
			for (NewMessageEntity newMessageEntity : messageLsit) {
				if(newMessageEntity.getMessageState() == MessageConstant.messgevalid) {
					//将查出的有效信息置为失效
					newMessageEntity.setMessageState(MessageConstant.messageinvalid);
					newMessageService.update(newMessageEntity);
				}
			}
			return CommonMsg.success().add("pageInfo", pageInfo);
			
		}
		return CommonMsg.success();
	}
	

}
