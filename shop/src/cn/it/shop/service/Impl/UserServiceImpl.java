package cn.it.shop.service.Impl;



import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.model.FaceInfo;
import cn.it.shop.model.User;
import cn.it.shop.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public List<FaceInfo> houtai_login() {
		return userDao.houtai_login();
	}

	@Override
	public void register(User user) {
		for (User user2 : userDao.findAll()) {
			if(user2.getLogin() != user.getLogin()) {
				userDao.register(user);
				break;
			}else {
				throw new RuntimeException(); 
			}
		}
	}
	
	
}
