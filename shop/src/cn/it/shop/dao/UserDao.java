package cn.it.shop.dao;


import java.util.List;

import cn.it.shop.model.FaceInfo;
import cn.it.shop.model.User;

public interface UserDao extends BaseDao<User>{
	
	public User login(User user);
	
	public List<FaceInfo> houtai_login();
	
	public void register(User user);
	
	public List<User> findAll();
}
