package cn.it.shop.dao;

import java.util.List;

import cn.it.shop.model.Category;

public interface CategoryDao extends BaseDao<Category>{
	// 查询类别信息，级联管理员(分页查询)
	public List<Category> queryJionAccount(String type,int page,int size);
	
	// 根据关键字查询总记录数
	public Long getCount(String type);
	
	// 根据ids删除类别
	public void deleteByIds(String ids);
	
	// 根据Boolean查询热点于非热点商品
	public List<Category> queryByHot(boolean hot);
}
