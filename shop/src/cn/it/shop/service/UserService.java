package cn.it.shop.service;


import java.util.List;

import cn.it.shop.model.FaceInfo;
import cn.it.shop.model.User;

public interface UserService extends BaseService<User>{
	
	public User login(User user);
	
	// 人脸登录
	public List<FaceInfo> houtai_login();
	
	// 用户注册
	public void register(User user);
}
