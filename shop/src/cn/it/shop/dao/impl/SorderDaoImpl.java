package cn.it.shop.dao.impl;




import java.util.List;

import org.springframework.stereotype.Repository;

import cn.it.shop.dao.SorderDao;
import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;

@Repository("sorderDao")
public class SorderDaoImpl extends BaseDaoImpl<Sorder> implements SorderDao{
	
	@Override
	public Forder updateSorder(Forder forder, Sorder sorder) {
		for(Sorder temp:forder.getSorderSet()) {
			if(temp.getProduct().getId().equals(sorder.getProduct().getId())) {
				temp.setNumber(sorder.getNumber());
			}
		}
		return forder;
	}

	@Override
	public List<Object> querySale(int number) {
		String sql = "SELECT any_value(s.name),sum(number) FROM sorder s INNER JOIN product p on p.id = s.pid GROUP BY s.pid";
		//String hql = "SELECT any_value(s.name),SUM(s.number) FROM Sorder s JOIN s.product GROUP BY s.product.id";
		return getSession().createSQLQuery(sql)
				.setFirstResult(0)
				.setMaxResults(number)
				.list();
	}

	
	
	
}
