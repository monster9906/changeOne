package cn.it.shop.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component("emailUtil")
public class EmailUtilImpl implements EmailUtil {
	/* (non-Javadoc)
	 * @see cn.it.shop.util.MessageUtil#sendEmail(java.lang.String, java.lang.String)
	 */
	@Override
	public void sendEmail(String email,String id) {
		Properties prop = new Properties();
		Session session = null;
		Message message = null;
		Transport transport = null;
		prop.setProperty("mail.transport.protocol", "smtp");
		// 创建session
		session = Session.getDefaultInstance(prop);
		// 设置debug格式
		session.setDebug(true);
		// 创建一封邮件对象
		message = new MimeMessage(session);
		try {
			// 写信
			message.setSubject("订单支付成功邮件");
			// 正文
			message.setContent("订单"+id+"已经支付成功！！","text/html;charset=utf-8");
			// 发件人地址
			message.setFrom(new InternetAddress("18874434527@sina.cn") );
			//通过sesion获取邮件传输对象
			transport = session.getTransport();
			// 连接到邮件服务器
			transport.connect("smtp.sina.cn","18874434527","fhl123fhl");
			// 设置发送的邮件和发送地址
			transport.sendMessage(message,new Address[]{new InternetAddress(email)});
		} catch (MessagingException e) {
			throw new RuntimeException();
		}finally {
			try {
				transport.close();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}
	
}
