package cn.it.shop.service;



import java.math.BigDecimal;

import cn.it.shop.model.Forder;

public interface ForderService extends BaseService<Forder>{
	// 计算总价格
	public BigDecimal cluTotal(Forder forder);
	
	// 更新订单状态
	public void updateStatusByid(int id,int sid);
}
