package cn.it.shop.service.Impl;



import org.springframework.stereotype.Service;

import cn.it.shop.model.Account;
import cn.it.shop.service.AccountService;

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService{
	
	public AccountServiceImpl() {
		super();
	}
}
