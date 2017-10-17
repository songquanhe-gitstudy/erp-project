package com.song.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;
import com.song.model.userEntity;
import com.song.service.AttendanceSheetService;
import com.song.service.RewardAndPunishmentService;
import com.song.utils.AttendanceConstant;
import com.song.utils.CommonMsg;

/**
* create by: song on 2017年9月30日
* 
* 类说明:考勤操作
*/

@Controller
@RequestMapping("/attendance")
public class AttendanceSheetController {
	@Autowired
	private AttendanceSheetService attendanceSheetService;
	@Autowired
	private RewardAndPunishmentService rapService;

	/**
	 * 显示个人考勤记录
	 * @param pn
	 * @return
	 */
	@RequestMapping(value="/AttendanceSheetData/{pn}")
	@ResponseBody
	public CommonMsg AttendanceSheetData(@PathVariable(value="pn")int pn, HttpSession session) {
		userEntity user = (userEntity)session.getAttribute("user");
		PageHelper.startPage(pn, 5);
		List<AttendanceSheetEntity> asLsit = attendanceSheetService.findByUid(user.getUserId());
		PageInfo pageInfo = new PageInfo(asLsit, 3);
		
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 管理员查看员工考勤记录
	 */
	@RequestMapping("/asUserData/{uId}")
	@ResponseBody
	public CommonMsg asUserData(@PathVariable(value="uId")int uId) {
		List<AttendanceSheetEntity> asLsit = attendanceSheetService.findByUid(uId);
		return CommonMsg.success().add("asLsit", asLsit);
	}
	
	/**
	 * 上班打卡
	 */
	@RequestMapping("/pushCardInWork")
	@ResponseBody
	public CommonMsg pushCardInWork(HttpSession session, AttendanceSheetEntity entity, Map<String,Object> map) {
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			//找到当天的上班记录
			Calendar calendar = Calendar.getInstance();
			String year = calendar.get(Calendar.YEAR)+"";
			String month = calendar.get(Calendar.MONTH)+1+"";
			String day = calendar.get(Calendar.DATE)+"";
			map.put("userId", user.getUserId());
			map.put("year", year);
			map.put("month", month);
			map.put("day", day);
			//记录下班时间
			AttendanceSheetEntity findEntity = attendanceSheetService.findByDate(map);
			if(findEntity != null) {
				return CommonMsg.info();
			}else {
				entity.setUserId(user.getUserId());
				//上班时间
				entity.setOnWorkTime(new Date());
				//设置年月日便于查询
				entity.setYears(year);
				entity.setMonths(month);
				entity.setDays(day);
				attendanceSheetService.save(entity);
				return CommonMsg.success();
			}
		}
		return CommonMsg.fail();
	}
	
	/**
	 * 下班打卡
	 */
	@RequestMapping("/pushCarOutWork")
	@ResponseBody
	public CommonMsg pushCarOutWork(HttpSession session, Map<String, Object> map) {
		userEntity user = (userEntity)session.getAttribute("user");
		//找到当天的上班记录
		Calendar calendar = Calendar.getInstance();
		String year = calendar.get(Calendar.YEAR)+"";
		String month = calendar.get(Calendar.MONTH)+1+"";
		String day = calendar.get(Calendar.DATE)+"";
		map.put("userId", user.getUserId());
		map.put("year", year);
		map.put("month", month);
		map.put("day", day);
		//记录下班时间
		AttendanceSheetEntity entity = attendanceSheetService.findByDate(map);
		if(entity == null) {
			return CommonMsg.fail();
		}
		entity.setOutWorkTime(new Date());
		//判断状态
		Date inWorkTime = entity.getOnWorkTime(); //上班时间
		Date outWorkTime = new Date();	//当前时间（下班时间）
		SimpleDateFormat sf = new SimpleDateFormat("HH"); //拿到小时
		SimpleDateFormat sdf = new SimpleDateFormat("mm");
		String  inWorkHHs = sf.format(inWorkTime); //上班时刻
		String outWorkHHs = sf.format(outWorkTime); //下班时刻
		int  inWorkmms = Integer.parseInt(sdf.format(inWorkTime)); //上班分钟
		int outWorkmms = Integer.parseInt(sdf.format(outWorkTime)); //下班分钟
		 DecimalFormat df=new DecimalFormat("0.00");
		 String inWorkMMs = df.format((float)inWorkmms/AttendanceConstant.second).substring(1,4);
		 String outWorkMMs = df.format((float)outWorkmms/AttendanceConstant.second).substring(1,4);
		 //小时与分钟化成的float型
		 float inWorkHours = Float.parseFloat(inWorkHHs+inWorkMMs);
		 float outWorkHours = Float.parseFloat(outWorkHHs+outWorkMMs);
		//迟到或早退
		if((inWorkHours > 9 && inWorkHours <= 10 && outWorkHours>=18) ||
				inWorkHours <= 9 && outWorkHours >= 17 && outWorkHours < 18) {
			entity.setIfLate(1);
			entity.setIfKg(0);
			entity.setIfJb(0);
			entity.setDescript("迟到或早退");
		}
		//旷工 (既迟到又早退视为旷工)
		if(inWorkHours > 10 || outWorkHours < 17 || 
			(inWorkHours > 9 && inWorkHours <= 10 && outWorkHours >= 17 && outWorkHours < 18)) {
			entity.setIfLate(0);
			entity.setIfKg(1);
			entity.setIfJb(0);
			entity.setDescript("旷工");
		}
		//加班
		if(inWorkHours <= 9 && outWorkHours >= 20) {
			entity.setIfLate(0);
			entity.setIfKg(0);
			entity.setIfJb(1);
			entity.setDescript("加班");
		}
		//正常
		if(inWorkHours <= 9 && outWorkHours >= 18 && outWorkHours <= 20) {
			entity.setDescript("正常");
		}
		attendanceSheetService.update(entity);
		
		return CommonMsg.success();
	}
	
	/**
	 * 查看当天打卡记录情况
	 */
	@RequestMapping("/findDailyRecord")
	@ResponseBody
	public CommonMsg findDailyRecord(HttpSession session, Map<String, Object> map) {
		userEntity user = (userEntity)session.getAttribute("user");
		//找到当天的上班记录
		Calendar calendar = Calendar.getInstance();
		String year = calendar.get(Calendar.YEAR)+"";
		String month = calendar.get(Calendar.MONTH)+1+"";
		String day = calendar.get(Calendar.DATE)+"";
		map.put("userId", user.getUserId());
		map.put("year", year);
		map.put("month", month);
		map.put("day", day);
		//记录下班时间
		AttendanceSheetEntity entity = attendanceSheetService.findByDate(map);
		if(entity != null) {
			return CommonMsg.success();
		}
		return CommonMsg.fail();
	}
	
	/**
	 *按年月查询记录 
	 */
	@RequestMapping(value="/getDateRecords/{pn}")
	@ResponseBody
	public CommonMsg getDateRecords(@PathVariable(value="pn")int pn,HttpSession session,
			Map<String, Object> map, String years, String months) {
		userEntity user = (userEntity)session.getAttribute("user");
		PageHelper.startPage(pn, 3);
		map.put("userId", user.getUserId());
		map.put("years", years);
		map.put("months", months);
		List<AttendanceSheetEntity> asList = attendanceSheetService.findByYearAndMonth(map);
		PageInfo pageInfo = new PageInfo(asList, 3);
		
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
}















