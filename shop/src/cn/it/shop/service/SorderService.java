package cn.it.shop.service;



import java.util.List;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;

public interface SorderService extends BaseService<Sorder>{
	// 添加购物项
	public Forder addSorder(Forder forder,Product product);
	
	// 将商品转换成购物项
	public Sorder ProductToSorder(Product product);
	
	// 根据商品id更新购物车
	public Forder updateSorder(Forder forder,Sorder sorder) ;
	
	// 根据商品id查询销售量
	public List<Object> querySale(int number);
}
