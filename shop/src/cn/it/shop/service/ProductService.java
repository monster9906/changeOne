package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Product;

public interface ProductService extends BaseService<Product>{
	// 查询商品信息及类别名称
	public List<Product> queryJoinCategory(String name,int page,int size);
	
	// 根据关键字查询总记录数
	public Long getCount(String name);
	
	// 根据id删除商品记录
	public void deleteByIds(String ids);
	
	// 根据热点类别，查询当前类别前四个商品
	public List<Product> queryByCid(int cid);
	
	// 模糊查询商品信息
	public List<Product> queryByCondition(String name);
	
}
