package cn.it.shop.action;


import java.io.ByteArrayInputStream;
import java.util.HashSet;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
/**
 *  购物项的添加方法
 * @author soul
 *
 */
@Controller
@Scope("prototype")
public class SorderAction extends BaseAction<Sorder> {
	
	public String showCar() {
		return "showCar";
	}
	
	public String addSorder() {
		// 1.根据product.id获取商品信息
		Product product = productService.get(model.getProduct().getId());
		
		// 2.判断session中是否存在购物车，没有就创建
		if(session.get("forder") == null) {
			// 新建购物车
			session.put("forder", new Forder(new HashSet<Sorder>()));
		}
			
		// 3 将商品信息转化为sorder（购物项），判断重复
		Forder forder = (Forder) session.get("forder");
		forder = sorderService.addSorder(forder, product);
		
		// 4 计算商品总价格 
		forder.setTotal(forderService.cluTotal(forder));
		
		// 5 把新的购物车存到session中
		session.put("forder", forder);
		return "showCar";
	}
	
	public String updateSorder() {
		Forder forder = (Forder) session.get("forder");
		sorderService.updateSorder(forder, model);
		forder.setTotal(forderService.cluTotal(forder));
		inputStream = new ByteArrayInputStream(String.valueOf(forder.getTotal()).getBytes());
		session.put("forder", forder);
		return "stream";
	}
	
	public String querySale() {
		List<Object> jsonList = sorderService.querySale(model.getNumber());
		ActionContext.getContext().getValueStack().push(jsonList);
		return "jsonList";
	}
	
}
