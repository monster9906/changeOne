package cn.it.shop.dao;




import cn.it.shop.model.Forder;

public interface ForderDao extends BaseDao<Forder>{
	// 更新订单状态
	public void updateStatusByid(int id,int sid);
}
