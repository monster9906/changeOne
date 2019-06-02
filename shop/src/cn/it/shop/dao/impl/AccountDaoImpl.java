package cn.it.shop.dao.impl;



import org.springframework.stereotype.Repository;

import cn.it.shop.dao.AccountDao;
import cn.it.shop.model.Account;

@Repository("accountDao")
public class AccountDaoImpl extends BaseDaoImpl<Account> implements AccountDao{
	
	public AccountDaoImpl() {
		super();
	}
}
