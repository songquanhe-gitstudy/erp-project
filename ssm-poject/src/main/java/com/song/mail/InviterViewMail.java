package com.song.mail;

import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 * 
 * @author Administrator song
 *
 */

public class InviterViewMail {

	private JavaMailSender  javaMailSender;

	public JavaMailSender getJavaMailSender() {
		return javaMailSender;
	}

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	/**
	 * 发送邮件
	 * @param inviterDate 面试时间
	 * @param mail 收件人邮箱
	 * @param name 
	 * @throws MessagingException 
	 */
	public void send(String name, String mail, Date inviterDate) throws MessagingException{

		//邮件信息类
		MimeMessage message=javaMailSender.createMimeMessage();
		//创建邮件助手类
		MimeMessageHelper helper=new MimeMessageHelper(message);
		//发件人
		helper.setFrom("songgegewy@163.com");
		//收件人
		helper.setTo(mail);
		//邮件主题
		helper.setSubject("面试通知！");
		helper.setText(name+"先生，您好！ 我们认真阅读您的简历并邀请您参加面试，面试地址：上海松江共和国。面试时间："+inviterDate.toLocaleString());
		javaMailSender.send(message);
	}
}