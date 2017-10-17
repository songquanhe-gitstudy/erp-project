# erp-project
简介

这个项目是一个简单的人资管理系统，该项目使用的框架是大家熟悉的SSM

使用技术

IOC容器：Spring

Web框架：SpringMVC

ORM框架：Mybatis

安全框架：JSR303校验

数据源：C3P0

邮件发送：javaMail

定时任务：quartz

前端框架：Bootstrap

1、运行环境和所需工具

编译器：Eclipse
项目构建工具：Maven
版本控制工具：git
数据库：Mysql
JDK版本：jdk1.7
Tomcat版本：Tomcat7.x
2、初始化项目

在你的Mysql中，创建一个名称为 erp_project 的数据库，并导入我提供的 erp_project.sql 文件,

进入src/main/resources修改dbconfig.properties配置文件,把数据库登录名和密码，改为你本地的

使用 eclipse 导入项目

登录账户
![登录](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/1.png)
![注册](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/2.png)
管理员账户：admin 密码：123456
游客 ：查看数据库或自己注册
员工 ：查看数据库
功能模块介绍

3.1、游客模块功能
![游客界面](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/10vi.png)
---注册账户-->浏览招聘信息（管理员创建）--》填写公司简历（查看，修改）-->浏览招聘信息-->投递简历-->接收面试邀请信息-->游客确认面试则可以被录用，成为员工

3.2、员工模块功能
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/7emp.png)
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/8emp.png)
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/9emp.png)
--员工登录 -->1，个人信息：相关信息包括个人基本信息（修改）、所在部门职位、相关培训信息、个人薪资、奖惩信息、个人考勤记录； -->2，部门职位：员工可以查看公司所有的部门以及部门下的所有职位信息，并且可以查看某部门职位下的有哪些员工； -->3，培训：涉及某员工的培训，该员工必须能收到关于培训的通知，并且能查看该次培训的相关内容； -->4，奖惩：员工可以查看到与自己相关的奖惩信息，包括奖惩金额，奖惩时间，奖惩原因； -->5，考勤打卡：员工每天上下班必须打卡，生成打卡记录；规定上班天数以及上下班时间，迟到早退则从基本工资中扣除一定的金额(或者自动生成一条惩罚记录，扣除相应的钱数)，迟到早退超过三小时则算旷工，扣除一整天的基本工资（同上）； -->6，薪资：员工可以查看自己薪资信息，若当月薪资还未结算，员工无法查看；若员工对自己的薪资有异议，可以申请复议，由管理员审核，经由管理员审核后薪资如果有出入，生成一条奖励或惩罚记录，下月补发；（薪资务必要记录清晰，钱的多或少记录清楚。）

3.3、管理员模块功能
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/3admin.png)
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/4admin.png)
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/5admin.png)
![](https://github.com/songquanhe-gitstudy/erp-project/blob/master/image/6admin.png)
部门：增、删、改、查； -->可以通过查看某部门，可以查看该部门下的所有职位和员工； -->部门创建要有创建时间； -->若该部门下存在在职员工，不能进行删除； 职位：增、删、改、查；（与部门对应） -->可以通过查看某职位，可以查看该职位下的员工； -->职位创建要有创建时间；并且标明是哪个部门下的职位创建； -->若该职位下存在在职员工，不能进行删除； 员工：增、删、改、查； ---员工新增主要从投递的简历进行录用 ---可以查看员工对应的基本信息、薪资、培训、绩效、部门、职位、考勤； ---对员工进行换岗（用二级联动实现）。 ---员工应该有状态、例如：离职、在职、试用期等 ---员工删除（离职）应有原因说明。

薪资：薪资结算 -->指定管理员结算工资的日期 ---基本薪资+绩效奖金+加班费用+奖惩费用-社保 ---员工薪资复议

考勤：查；

培训：增、删、改、查； ---针对部门或员工（多人培训），及时推送对应的消息 ---（提高）培训考试

招聘：增、删、改、查 ---发布招聘信息（可借鉴各大招聘网站） ---流程：收取简历-->查阅简历-->做标记（是否已阅）-->通知面试、并记录面试时间-->通知安排员工进行面试-->录用(动态的将简历信息取出并存入数据库) 奖惩：增、删、改、查