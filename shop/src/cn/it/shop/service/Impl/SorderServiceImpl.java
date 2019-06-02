package cn.it.shop.service.Impl;




import java.util.List;

import org.springframework.stereotype.Service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.SorderService;

@Service("sorderService")
public class SorderServiceImpl extends BaseServiceImpl<Sorder> implements SorderService{

	@Override
	public Forder addSorder(Forder forder, Product product) {
		Sorder sorder = ProductToSorder(product);
		boolean isHave = false;
		// 判断购物项是否重复，重复数量增加
		for (Sorder old : forder.getSorderSet()) {
			if(old.getProduct().getId().equals(sorder.getProduct().getId())) {
				// 数量增加
				old.setNumber(old.getNumber()+sorder.getNumber());
				isHave = true ;
				break;
			}
		}
		
		if(isHave == false) { // 新增购物项
			// 建立购物项与购物车的关系
			sorder.setForder(forder);
			
			forder.getSorderSet().add(sorder);
		}
		return forder;
	}

	@Override
	public Sorder ProductToSorder(Product product) {
		Sorder sorder = new Sorder();
		sorder.setName(product.getName());
		sorder.setNumber(1);
		sorder.setPrice(product.getPrice());
		sorder.setProduct(product);
		return sorder;
	}

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
		return sorderDao.querySale(number);
	}

	
	
	
}
