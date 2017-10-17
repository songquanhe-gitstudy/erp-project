package com.song.task;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;
import com.song.model.WageEntity;
import com.song.model.userEntity;
import com.song.service.AttendanceSheetService;
import com.song.service.LoginService;
import com.song.service.RewardAndPunishmentService;
import com.song.service.WageService;

/**
* create by: song on 2017年10月16日
* 
* 类说明:工资定时任务
*/
@Component
public class WageTask {
	@Autowired
	private LoginService loginService;
	@Autowired
	private AttendanceSheetService attendanceSheetService;
	@Autowired
	private RewardAndPunishmentService rapService;
	@Autowired
	private WageService wageService;
	
//	@Scheduled(cron="0 0 0 10W * ?") //每月十号最近的工作日发工资
	public void wageCalculation() {
		Map<String, Object> map = new HashMap<>();
		//当前月份
		Calendar calendar = Calendar.getInstance();
		int currentYear = calendar.get(Calendar.YEAR);
		int currentMonth = calendar.get(Calendar.MONTH+1);
		calendar.set(currentYear, currentMonth, 0);
		int allDays = calendar.get(Calendar.DAY_OF_MONTH);
		String years = currentYear +"";
		String months = currentMonth + "";
		//获取每位员工
		List<userEntity> empList = loginService.findEmpByRoleId();
		//遍历员工根据当前年上个月月份以及员工id获取所有考勤记录
		for (userEntity user : empList) {
			map.put("userId", user.getUserId());
			map.put("years", years);
			map.put("months", months);
			List<AttendanceSheetEntity> asList =  attendanceSheetService.findByYearAndMonth(map);
			BigDecimal ovMoney = new BigDecimal(0); //加班费
			for (AttendanceSheetEntity asEntity : asList) {
				if(null != asEntity.getIfJb() && asEntity.getIfJb() == 1){
					//加班
					ovMoney = ovMoney.add(new BigDecimal(50));
				}
			}
			//遍历员工根据当前月份以及员工id获取所有奖惩记录
			List<RewardsAndPunishmendEntity> rapList = rapService.findByYearAndMonth(map);
			BigDecimal rapMoney = new BigDecimal(0); //奖惩金
			for (RewardsAndPunishmendEntity rapEntity : rapList) {
				rapMoney = rapMoney.add(rapEntity.getMoney());
			}
			BigDecimal jinbaoMoney = new BigDecimal(-500); //社保
			//绩效
			DecimalFormat df = new DecimalFormat("0.00");
			String s = df.format((float)asList.size()/allDays);
			BigDecimal prefMoney = new BigDecimal(500*(Float.parseFloat(s)));
			//总工资
			BigDecimal totalMoney = new BigDecimal(0);
			totalMoney = totalMoney.add(prefMoney).add(jinbaoMoney).add(rapMoney).add(ovMoney).add(new BigDecimal(user.getSalary()));
			//工资单
			WageEntity wageEntity = new WageEntity();
			wageEntity.setEmpId(user.getUserId());
			wageEntity.setYears(years);
			wageEntity.setMonths(months);
			wageEntity.setBaseWage(new BigDecimal(user.getSalary()));
			wageEntity.setJinpoWage(jinbaoMoney);
			wageEntity.setOvWage(ovMoney);
			wageEntity.setPerfWage(prefMoney);
			wageEntity.setRapWage(rapMoney);
			wageEntity.setTotalWage(totalMoney);
			wageService.save(wageEntity);
		}
	}
	
	
}
