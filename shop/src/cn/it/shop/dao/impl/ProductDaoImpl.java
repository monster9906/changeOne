package cn.it.shop.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import cn.it.shop.dao.ProductDao;
import cn.it.shop.model.Product;

@Repository("productDao")
@SuppressWarnings("unchecked")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao {

	@Override
	public List<Product> queryJoinCategory(String name, int page, int size) {
		String hql = "FROM Product p LEFT JOIN FETCH p.category where p.name LIKE :name";
		return getSession().createQuery(hql)
				.setString("name","%"+ name +"%")
				.setFirstResult((page-1)*size)
				.setMaxResults(size*page)
				.list();
	}

	@Override
	public Long getCount(String name) {
		String hql = "SELECT COUNT(p) FROM Product p where p.name LIKE :name";
		return (Long) getSession().createQuery(hql).setString("name", "%"+name+"%").uniqueResult();
	}

	@Override
	public void deleteByIds(String ids) {
		String hql = "DELETE FROM Product where id in ("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<Product> queryByCid(int cid) {
		String hql = "FROM Product p JOIN FETCH p.category where p.commend = true AND p.open = true AND p.category.id =:cid ORDER BY p.date DESC";
		return getSession().createQuery(hql).setInteger("cid", cid).setFirstResult(0).setMaxResults(4).list();
	}

	@Override
	public List<Product> queryByCondition(String name) {
		String hql = "FROM Product p LEFT JOIN FETCH p.category where p.name LIKE :name";
		return getSession().createQuery(hql)
				.setString("name","%"+ name +"%")
				.list();
	}


}
