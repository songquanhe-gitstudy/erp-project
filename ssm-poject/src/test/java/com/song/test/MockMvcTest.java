package com.song.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

/**
-Spring提供的进行虚拟请求的测试类
- 使用Spring测试模块提供的测试请求功能，测试curd请求的正确性
- Spring4测试的时候，需要servlet3.0的支持
- @author song
- */
  @RunWith(SpringJUnit4ClassRunner.class)
  @WebAppConfiguration
  @ContextConfiguration(locations = { "classpath:applicationContext.xml",
      "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
  public class MockMvcTest {
  // 传入Springmvc的ioc
  @Autowired
  WebApplicationContext context;
  // 虚拟mvc请求，获取到处理结果。
  MockMvc mockMvc;
  @Before
  public void initMokcMvc() {
      mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
  }
  
  @Test
  public void testUser() throws Exception {
	  
	  ResultActions result = mockMvc.perform(MockMvcRequestBuilders.get("/add"));
	  System.out.println("---------------------------"+result);
  }
  
  
  @Test
  public void testPage() throws Exception {
      //模拟发送请求并拿到返回值
      MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5"))
      		.andReturn();
      
      //请求成功以后，请求域中会有pageInfo；我们可以取出pageInfo进行验证
      MockHttpServletRequest request = result.getRequest();
      PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
      System.out.println("当前页码："+pi.getPageNum());
      System.out.println("总页码："+pi.getPages());
      System.out.println("总记录数："+pi.getTotal());
      System.out.println("在页面需要连续显示的页码");
      int[] nums = pi.getNavigatepageNums();
      for (int i : nums) {
      	System.out.print(" "+i);
      }
      
      //获取员工数据
     /*当前页码：5
	     总页码：201
	     总记录数：1001
	     在页面需要连续显示的页码
       3 4 5 6 7ID：1==>Name:048f219
       ID：1==>Name:49d9f20
       ID：1==>Name:91a1f21
       ID：1==>Name:f021822
       ID：1==>Name:ce83e23*/
  }

}
