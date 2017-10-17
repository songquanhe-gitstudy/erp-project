package com.song.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
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
import com.song.model.WageEntity;
import com.song.model.WageFlowEntity;
import com.song.model.userEntity;
import com.song.service.AttendanceSheetService;
import com.song.service.LoginService;
import com.song.service.RewardAndPunishmentService;
import com.song.service.WageFlowService;
import com.song.service.WageService;
import com.song.utils.CommonMsg;

/**
* create by: song on 2017年10月10日
* 
* 类说明:薪资操作
*/

@Controller
@RequestMapping("/wage")
public class WageController {
	@Autowired
	private WageService wageService;
	@Autowired
	private WageFlowService wageFlowService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private AttendanceSheetService attendanceSheetService;
	@Autowired
	private RewardAndPunishmentService rapService;
	
	/**
	 * 查询所有自己的工资单
	 */
	@RequestMapping(value="/getUserWage/{pn}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg getUserWage(@PathVariable(value="pn")int pn, HttpSession session) {
		userEntity user = (userEntity)session.getAttribute("user");
		if(user != null) {
			PageHelper.startPage(pn, 5);
			List<WageEntity> wageList = wageService.findWageByUid(user.getUserId());
			
			PageInfo pageInfo = new PageInfo(wageList, 3);
			return CommonMsg.success().add("pageInfo", pageInfo);
		}
		return CommonMsg.fail();
	}
	
	/**
	 * 管理员查看用户工资单
	 */
	@RequestMapping("/findUserWage/{uId}")
	@ResponseBody
	public CommonMsg findUserWage(@PathVariable(value="uId")int uId) {
		List<WageEntity> wageList = wageService.findWageByUid(uId);
		return CommonMsg.success().add("wageList", wageList);
	}
	
	/**
	 * 提交复议内容
	 * @param id
	 * @param entity
	 * @return
	 */
	@RequestMapping(value="/updateUserWage/{id}", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg updateUserWage(@PathVariable(value="id")int id, HttpSession session, WageEntity entity, WageFlowEntity wfEntity) {
		userEntity user = (userEntity)session.getAttribute("user");
		entity.setWageId(id);
		entity.setState(1);
		wageService.updateUserWage(entity);
		//流程相关
		wfEntity.setWageId(id);
		wfEntity.setState("1");
		wfEntity.setOperatorNow(user.getUserName());
		wfEntity.setCreateTime(new Date());
		wfEntity.setContent(user.getUserName()+":"+entity.getDescript());
		wageFlowService.save(wfEntity);
		return CommonMsg.success();
	}
	
	/**
	 * 管理员回复复议
	 * @return
	 */
	@RequestMapping(value="/updateAdminWage/{id}", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg updateAdminWage(@PathVariable(value="id")int id, WageEntity entity, WageFlowEntity wfEntity) {
		entity.setWageId(id);
		entity.setState(2);
		wageService.updateUserWage(entity);
		//流程相关
		wfEntity.setWageId(id);
		wfEntity.setState("2");
		wfEntity.setOperatorNow("admin");
		wfEntity.setCreateTime(new Date());
		wfEntity.setContent("admin:"+entity.getAdminDescript());
		wageFlowService.save(wfEntity);
		return CommonMsg.success();
	}
	
	/**
	 * 查处于复议状态的记录
	 */
	@RequestMapping("/getReConsiderWage/{pn}")
	@ResponseBody
	public CommonMsg getReConsiderWage(@PathVariable(value="pn")int pn) {
		PageHelper.startPage(pn, 5);
		List<WageEntity> wageList = wageService.getReConsiderWage();
		
		PageInfo pageInfo = new PageInfo(wageList, 3);
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 工资结算
	 */
	@RequestMapping("/wageSettlement")
	@ResponseBody
	public CommonMsg wageSettlement(Map<String, Object> map) {
		//当前月份
		Calendar calendar = Calendar.getInstance();
		int currentYear = calendar.get(Calendar.YEAR);
		int currentMonth = calendar.get(Calendar.MONTH);
		calendar.set(currentYear, currentMonth, 0);
		int allDays = calendar.get(Calendar.DAY_OF_MONTH);
		String years = currentYear +"";
		String months = currentMonth + "";
		//首先判断上个月有木有结算
		int count = wageService.checkRecords(years, months);
		if(count > 0){
			return CommonMsg.fail();
		}
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
				if(null != asEntity.getIfLate()  && asEntity.getIfLate()== 1) {
					//奖惩相关
					RewardsAndPunishmendEntity rapEntity = new RewardsAndPunishmendEntity();
					rapEntity.setCreateTime(new Date());
					BigDecimal decimal = new BigDecimal(-100);
					rapEntity.setMoney(decimal);
					rapEntity.setYears(years);
					rapEntity.setMonths(months);
					rapEntity.setReason("迟到或早退");
					rapEntity.setType("惩罚");
					rapEntity.setUserId(user.getUserId());
					rapService.save(rapEntity);
				}else if(asEntity.getIfKg() == 1 || asEntity.getOutWorkTime() == null){
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
				}else if(null != asEntity.getIfJb() && asEntity.getIfJb() == 1){
					//加班
					ovMoney = ovMoney.add(new BigDecimal(50));
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
		
		return CommonMsg.success();
	}
	
}














