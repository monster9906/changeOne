package cn.it.shop.dao.impl;




import org.springframework.stereotype.Repository;

import cn.it.shop.dao.ForderDao;
import cn.it.shop.model.Forder;

@Repository("forderDao")
public class ForderDaoImpl extends BaseDaoImpl<Forder> implements ForderDao{


	@Override
	public void updateStatusByid(int id, int sid) {
		String hql = "UPDATE Forder f SET f.status.id =:sid WHERE f.id =: id";
		getSession().createQuery(hql).setInteger("id", id).setInteger("sid", sid).executeUpdate();
	}
	
	
}
