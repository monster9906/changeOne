package cn.it.shop.dao;



import java.util.List;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;

public interface SorderDao extends BaseDao<Sorder>{
	// 根据商品id更新购物车
	public Forder updateSorder(Forder forder,Sorder sorder) ;
	
	// 根据商品id查询销售量
	public List<Object> querySale(int number);
}
