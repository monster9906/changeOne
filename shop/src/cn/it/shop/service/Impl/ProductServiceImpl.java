package cn.it.shop.service.Impl;


import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.model.Product;
import cn.it.shop.service.ProductService;

@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService {

	@Override
	public List<Product> queryJoinCategory(String name, int page, int size) {
		return productDao.queryJoinCategory(name, page, size);
	}

	@Override
	public Long getCount(String name) {
		return (Long) productDao.getCount(name);
	}

	@Override
	public void deleteByIds(String ids) {
		productDao.deleteByIds(ids);
	}

	@Override
	public List<Product> queryByCid(int cid) {
		return productDao.queryByCid(cid);
	}

	@Override
	public List<Product> queryByCondition(String name) {
		return productDao.queryByCondition(name);
	}


}
