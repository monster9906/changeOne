package cn.it.shop.listener;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.it.shop.util.FileUpload;
import cn.it.shop.util.ProductTimerTask;

public class InitDataListener implements ServletContextListener {
	private ApplicationContext context = null;
	private ProductTimerTask productTimerTask = null;
	private FileUpload fileUpload = null; 
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		productTimerTask = (ProductTimerTask) context.getBean("productTimerTask");
		fileUpload = (FileUpload)context.getBean("fileUpload");
		// 把内置对象交给productTimerTask
		productTimerTask.setApplication(event.getServletContext());
		// 设置定时器，每隔一小时自动刷新一下(守护线程)
		new Timer(true).schedule(productTimerTask, 0, 3600000);
		System.out.println("图片名称："+fileUpload.getBankImage());
		event.getServletContext().setAttribute("bankList", fileUpload.getBankImage());
	}

}
