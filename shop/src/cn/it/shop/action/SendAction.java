package cn.it.shop.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
@Controller
public class SendAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		Object score = ServletActionContext.getRequest().getSession().getAttribute("score");
		if(score != null) {
			return "send"; 
		}else {
			return "login";
		}
	}
	
}
