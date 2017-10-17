package com.song.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.InviteInfoEntity;
import com.song.service.InviterService;
import com.song.service.VisitorService;
import com.song.utils.CommonMsg;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* create by: song on 2017年9月27日
* 
* 类说明:招聘信息管理
*/
@Controller
@RequestMapping("/inviter")
public class InviterController {
	@Autowired
	private InviterService inviterSerivce;
	@Autowired
	private VisitorService visitorService;
	
	/**
	 * 查询所有的招聘信息
	 * @param pn
	 * @return
	 */
	@RequestMapping("/showInviterInfoJSON/{pn}")
	@ResponseBody
	public CommonMsg showInviterInfo(@PathVariable(value="pn", required=false)int pn, String findByName) {
		//每页显示五条记录
		PageHelper.startPage(pn, 5);
		if(findByName != null) {
			//模糊查询
			List<InviteInfoEntity> inviterList = inviterSerivce.findListByName(findByName);
			PageInfo pageInfo = new PageInfo(inviterList, 3);
			return CommonMsg.success().add("pageInfo", pageInfo);
		}
		
		List<InviteInfoEntity> invInfoList = visitorService.getAllInviter();
		//导航栏显示3页
		PageInfo pageInfo = new PageInfo(invInfoList, 3);
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 增加招聘信息
	 */
	@RequestMapping("/addInvite")
	@ResponseBody
	public CommonMsg addInvite(InviteInfoEntity entity) {
		inviterSerivce.addByEntity(entity);
		
		return CommonMsg.success();
	}
	
	/**
	 * 删除操作
	 */
	@RequestMapping("/delInvite/{id}")
	@ResponseBody
	public CommonMsg delInvite(@PathVariable(value="id")int id) {
		inviterSerivce.deleteById(id);
		return CommonMsg.success();
	}
	
	/**
	 * 按id查找
	 */
	@RequestMapping(value="/findById/{id}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg findById(@PathVariable(value="id")int id) {
		InviteInfoEntity inviteInfoEntity = inviterSerivce.findById(id);
		return CommonMsg.success().add("list", inviteInfoEntity);
	}
	
	/**
	 * 更新
	 */
	@RequestMapping(value="/updateInvite/{id}", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg updateInvite(@PathVariable(value="id")int id, InviteInfoEntity entity){
		entity.setInviteId(id);
		inviterSerivce.updateInvite(entity);
		
		return CommonMsg.success();
	}
	
}















