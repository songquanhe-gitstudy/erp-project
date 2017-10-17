package com.song.controller;

import java.util.ArrayList;
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

import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.song.model.DeptEntity;
import com.song.model.JobPostEntity;
import com.song.model.NewMessageEntity;
import com.song.model.TrainEntity;
import com.song.model.TrainGradeEntity;
import com.song.model.userEntity;
import com.song.service.DeptAndPostSeivice;
import com.song.service.NewMessageService;
import com.song.service.TrainGrageService;
import com.song.service.TrainService;
import com.song.utils.CommonMsg;
import com.song.utils.MessageConstant;
import com.song.utils.TimeStamp;

/**
* create by: song on 2017年9月26日
* 
* 类说明:培训
*/

@Controller
@RequestMapping("/train")
public class TrainController {
	@Autowired
	private TrainService trainSevice;
	@Autowired
	private DeptAndPostSeivice deptAndPpostService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private NewMessageService newMessageService;
	@Autowired
	private TrainGrageService trainGradeService;
	
	/**
	 * 查询所有的培新信息
	 * @return
	 */
	@RequestMapping("/showTrainData/{pn}")
	@ResponseBody
	public CommonMsg showTrainData(@PathVariable(value="pn", required=false)int pn, String findByName ) {
		//每页显示五条记录
		PageHelper.startPage(pn, 5);
			List<TrainEntity> likeLsit = trainSevice.findByName(findByName);
			
			PageInfo pageInfo = new PageInfo(likeLsit, 3);
			return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 增加培训信息
	 */
	@RequestMapping(value="/addTrain", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg addTrain(TrainEntity entity) {
		trainSevice.addTrain(entity);
		
		//员工培训消息记录
		List<userEntity> userLsit = deptAndPpostService.findAllEmpByDid(entity.getDeptId());
		for (userEntity userEntity : userLsit) {
			NewMessageEntity messageEntity = new NewMessageEntity();
			messageEntity.setUserId(userEntity.getUserId());
			messageEntity.setCreateTime(new Date());
			messageEntity.setContent(MessageConstant.traininform);
			messageEntity.setMessageState(MessageConstant.messgevalid);
			messageEntity.setType(MessageConstant.traintype);
			messageEntity.setAppointedtime(entity.getTrainTime());
			messageEntity.setSender("admin");
			newMessageService.save(messageEntity);
		}
			return CommonMsg.success();
	}
	
	/**
	 * 删除培训信息
	 */
	@RequestMapping(value="/delTrain/{id}")
	@ResponseBody
	public CommonMsg delTrain(@PathVariable(value="id")int id) {
		trainSevice.deleteTrainById(id);
		return CommonMsg.success();
	}
	
	/**
	 * 按id查培训
	 */
	@RequestMapping(value="/findById/{id}", method=RequestMethod.GET)
	@ResponseBody
	public CommonMsg findById(@PathVariable(value="id")int id) {
		TrainEntity entity = trainSevice.findById(id);
		return CommonMsg.success().add("list", entity);
	}
	
	/**
	 * 更新培训信息
	 */
	@RequestMapping(value="/updateTrain/{id}", method=RequestMethod.POST)
	@ResponseBody
	public CommonMsg updateTrain(@PathVariable(value="id")int id, TrainEntity entity) {
		entity.setTrainId(id);
		trainSevice.update(entity);
		return CommonMsg.success();
	}
	
	/**
	 * 员工查看自己相关培训信息
	 */
	@RequestMapping(value="/empTrainInfo/{pn}")
	@ResponseBody
	public CommonMsg empTrainInfo(@PathVariable(value="pn")int pn, HttpSession session, 
			String findByName, Map<String, Object> map) {
		PageHelper.startPage(pn, 5);
		List<TrainEntity> allTrainList = new ArrayList<>();
		PageInfo pageInfo = new PageInfo(allTrainList, 3);
		//每页显示三条记录
		userEntity user = (userEntity)session.getAttribute("user");
		
		//根据用户的职位找部门id
		JobPostEntity postEntity = deptAndPpostService.findPostById(user.getParentId());
		//根据部门id找出所有的培训信息
		
		List<TrainEntity> tList = trainService.findByDeptId(postEntity.getParentId());
		
		for (TrainEntity trainEntity : tList) {
			map.put("deptId", postEntity.getParentId());
			map.put("userId", user.getUserId());
			map.put("trainId", trainEntity.getTrainId());
			TrainEntity tEntity = trainService.findWityGrade(map);
			if(tEntity != null) {
				allTrainList.add(tEntity);
			} else {
				allTrainList.add(trainEntity);
			}
		}
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	/**
	 * 显示培训管理人的培训信息并发培训试卷
	 */
	@RequestMapping(value="/empTrainManage/{pn}")
	@ResponseBody
	public CommonMsg empTrainManage(@PathVariable(value="pn")int pn, HttpSession session, String findByName) {
		//每页显示三条记录
		userEntity user = (userEntity)session.getAttribute("user");
		PageHelper.startPage(pn, 5);
		
		List<TrainEntity> trainList = trainService.findByUid(user.getUserId());
		
		PageInfo pageInfo = new PageInfo(trainList, 3);
		return CommonMsg.success().add("pageInfo", pageInfo);
	}
	
	
	/**
	 * 培训消息
	 */
	/*@RequestMapping(value="/empTrainInfoNumber")
	@ResponseBody
	public CommonMsg empTrainInfoNumber(HttpSession session) {
		userEntity user = (userEntity)session.getAttribute("user");
		
		//根据用户的职位找部门id
		JobPostEntity postEntity = deptAndPpostService.findPostById(user.getParentId());
		//根据部门id找出所有的培训信息
		List<TrainEntity> tList = trainService.findByDeptId(postEntity.getParentId());
		return CommonMsg.success().add("trainMessages", tList.size());
	}*/
	
}


















