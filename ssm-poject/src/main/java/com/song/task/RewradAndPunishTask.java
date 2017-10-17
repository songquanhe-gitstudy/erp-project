package com.song.task;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.song.model.AttendanceSheetEntity;
import com.song.model.RewardsAndPunishmendEntity;
import com.song.model.userEntity;
import com.song.service.AttendanceSheetService;
import com.song.service.LoginService;
import com.song.service.RewardAndPunishmentService;

/**
* create by: song on 2017年10月16日
* 
* 类说明:奖惩相关定时任务
*/
@Component
public class RewradAndPunishTask {
	private final static int MATH_ONE = 1;
	private final static int MINUS_ONE_HUNDRED = -100;
	private final static int MINUS_TWO_HUNDRED = -200;
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private AttendanceSheetService attendanceSheetService;
	@Autowired
	private RewardAndPunishmentService rapService;
	
	/**
	 * 每天凌晨12点准时检查每个人的考勤记录并生成奖惩
	 */
//	@Scheduled(cron="0 59 23 * * ?")  //每天的23点59分执行一次
	public void addRapRecords() {
		Map<String, Object> map = new HashMap<>();
		//当前月份
		Calendar calendar = Calendar.getInstance();
		int currentYear = calendar.get(Calendar.YEAR);
		int currentMonth = calendar.get(Calendar.MONTH);
		int currentDay = calendar.get(Calendar.DATE);
		int allDays = calendar.get(Calendar.DAY_OF_MONTH);
		calendar.set(currentYear, currentMonth, 0);
		String years = currentYear +"";
		String months = currentMonth + "";
		String days = currentDay +"";
		//获取每位员工
		List<userEntity> empList = loginService.findEmpByRoleId();
		for (userEntity user : empList) {
			map.put("userId", user.getUserId());
			map.put("years", years);
			map.put("months", months);
			map.put("days", days);
			List<AttendanceSheetEntity> asList =  attendanceSheetService.findByYearAndMonthAndDay(map);
			for (AttendanceSheetEntity asEntity : asList) {
				if(null != asEntity.getIfLate()  && asEntity.getIfLate()== MATH_ONE) {
					//奖惩相关
					RewardsAndPunishmendEntity rapEntity = new RewardsAndPunishmendEntity();
					rapEntity.setCreateTime(new Date());
					BigDecimal decimal = new BigDecimal(MINUS_ONE_HUNDRED);
					rapEntity.setMoney(decimal);
					rapEntity.setYears(years);
					rapEntity.setMonths(months);
					rapEntity.setReason("迟到或早退");
					rapEntity.setType("惩罚");
					rapEntity.setUserId(user.getUserId());
					rapService.save(rapEntity);
				}else if(asEntity.getIfKg() == MATH_ONE || asEntity.getOutWorkTime() == null){
					//奖惩相关
					RewardsAndPunishmendEntity rapEntity = new RewardsAndPunishmendEntity();
					rapEntity.setCreateTime(new Date());
					BigDecimal decimal = new BigDecimal(MINUS_TWO_HUNDRED);
					rapEntity.setMoney(decimal);
					rapEntity.setYears(years);
					rapEntity.setMonths(months);
					rapEntity.setReason("旷工");
					rapEntity.setType("惩罚");
					rapEntity.setUserId(user.getUserId());
					rapService.save(rapEntity);
				}
			}
			//月总上班天数减去考勤记录数为旷工
			for (int i = 0; i < allDays - asList.size(); i++) {
				//奖惩相关
				RewardsAndPunishmendEntity rapEntity = new RewardsAndPunishmendEntity();
				rapEntity.setCreateTime(new Date());
				BigDecimal decimal = new BigDecimal(-200);
				rapEntity.setMoney(decimal);
				rapEntity.setYears(years);
				rapEntity.setMonths(months);
				rapEntity.setReason("旷工");
				rapEntity.setType("惩罚");
				rapEntity.setUserId(user.getUserId());
				rapService.save(rapEntity);
			}
	}
  }
}







