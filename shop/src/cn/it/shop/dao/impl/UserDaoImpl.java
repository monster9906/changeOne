package cn.it.shop.dao.impl;



import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.it.shop.dao.UserDao;
import cn.it.shop.model.FaceInfo;
import cn.it.shop.model.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	@Override
	public User login(User user) {
		String hql = "FROM User u WHERE u.login=:login AND u.pass=:pass";
		return (User)getSession().createQuery(hql)
				.setString("login", user.getLogin())
				.setString("pass", user.getPass())
				.uniqueResult();
	}

	@Override
	public List<FaceInfo> houtai_login() {
		String sql = "SELECT * from faceinfo";
		return getSession().createSQLQuery(sql).addEntity(FaceInfo.class).list();
	}

	@Override
	public void register(User user) {
		String sql = "INSERT INTO user(login,name,pass,sex,phone,email) VALUES(?,?,?,?,?,?)";
		getSession().createSQLQuery(sql)
			.setString(0, user.getLogin())
			.setString(1, user.getName())
			.setString(2, user.getPass())
			.setString(3, user.getSex())
			.setString(4, user.getPhone())
			.setString(5, user.getEmail()).executeUpdate();
	}

	@Override
	public List<User> findAll() {
		String hql = "FROM user";
		return getSession().createQuery(hql).list();
	}
	
	
}
