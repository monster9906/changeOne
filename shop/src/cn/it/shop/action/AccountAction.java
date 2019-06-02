package cn.it.shop.action;

import java.util.ArrayList;

import org.apache.logging.log4j.core.layout.JsonLayout;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import cn.it.shop.model.Account;

@Controller
@Scope("prototype")
public class AccountAction extends BaseAction<Account> {
	
	public String query() {
		josnList = new ArrayList<>();
		josnList = accountService.query();
		return "josnList";
	}
}
