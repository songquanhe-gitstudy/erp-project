package com.song.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;
import com.song.model.userEntity;
import com.song.service.RewardAndPunishmentService;
import com.song.utils.CommonMsg;

/**
* create by: song on 2017年10月1日
* 
* 类说明:奖惩
*/

@Controller
@RequestMapping("/rap")
public class RewardsAndPunishmentController {
	@Autowired
	private RewardAndPunishmentService rewardAndPunishmentService;
	
	
	/**
	 * 获取所有的奖惩记录并分页
	 * @return
	 */
	@RequestMapping("/getRapRecords")
	@ResponseBody
	public CommonMsg getRapRecords(@RequestParam(value="pn", defaultValue="1")int pn) {
		PageHelper.startPage(pn, 5);
		List<RewardsAndPunishmendEntity> rapList = rewardAndPunishmentService.findAllRecords();
		
		PageInfo pageInfo = new PageInfo(rapList, 3);
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 员工获取自己所属奖惩记录
	 */
	@RequestMapping("/getUserRecords")
	@ResponseBody
	public CommonMsg getUserRecords(@RequestParam(value="pn", defaultValue="1")int pn, HttpSession session) {
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			PageHelper.startPage(pn, 5);
			List<RewardsAndPunishmendEntity> rapList = rewardAndPunishmentService.findUserRecords(user.getUserId());
			
			PageInfo pageInfo = new PageInfo(rapList, 3);
			return CommonMsg.success().add("pageInfo", pageInfo);
		}
		return CommonMsg.fail();
	}
	
	/**
	 *按年月人查询记录 
	 */
	@RequestMapping(value="/getDateRecords/{pn}")
	@ResponseBody
	public CommonMsg getDateRecords(@PathVariable(value="pn")int pn,HttpSession session,
			Map<String, Object> map, String years, String months) {
		userEntity user = (userEntity)session.getAttribute("user");
		PageHelper.startPage(pn, 5);
		map.put("userId", user.getUserId());
		map.put("years", years);
		map.put("months", months);
		List<RewardsAndPunishmendEntity> asList = rewardAndPunishmentService.findByYearAndMonth(map);
		PageInfo pageInfo = new PageInfo(asList, 3);
		
		return CommonMsg.success().add("pageInfo", pageInfo);
	}

	/**
	 * 按年月查询记录
	 */
	@RequestMapping(value="/getDateRecordsNoUser/{pn}")
	@ResponseBody
	public CommonMsg getDateRecordsNoUser(@PathVariable(value="pn")int pn,
			Map<String, Object> map, String years, String months) {
		PageHelper.startPage(pn, 5);
		map.put("years", years);
		map.put("months", months);
		List<RewardsAndPunishmendEntity> asList = rewardAndPunishmentService.findByYearAndMonthNoUser(map);
		PageInfo pageInfo = new PageInfo(asList, 3);
		
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 增加奖惩记录
	 */
	@RequestMapping(value="/addRapRecords", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg addRapRecords(RewardsAndPunishmendEntity entity) {
		Calendar calendar = Calendar.getInstance();
		String year = calendar.get(Calendar.YEAR) + "";
		String month = calendar.get(Calendar.MONTH)+1 + "";
		entity.setYears(year);
		entity.setMonths(month);
		entity.setCreateTime(new Date());
		rewardAndPunishmentService.save(entity);
		return CommonMsg.success();
	}
	
	/**
	 *删除奖惩记录 
	 */
	@RequestMapping("/delRapRecord/{id}")
	@ResponseBody
	public CommonMsg delRapRecord(@PathVariable(value="id")int id) {
		rewardAndPunishmentService.delById(id);
		return CommonMsg.success();
	}
	
	/**
	 * 找到记录
	 */
	@RequestMapping("/findRecordById")
	@ResponseBody
	public CommonMsg findRecordById(@RequestParam(value="id")int id) {
		RewardsAndPunishmendEntity entity = rewardAndPunishmentService.findRecordById(id);
		return CommonMsg.success().add("entity", entity);
	}
	
	/**
	 * 更新记录
	 */
	@RequestMapping("/updateRecord/{id}")
	@ResponseBody
	public CommonMsg updateRecord(@PathVariable(value="id")int id, RewardsAndPunishmendEntity entity) {
		entity.setRapId(id);
		rewardAndPunishmentService.update(entity);
		return CommonMsg.success();
	}
}











