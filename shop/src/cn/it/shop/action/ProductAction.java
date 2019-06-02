package cn.it.shop.action;



import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Product;

@Controller
@Scope("prototype")
public class ProductAction extends BaseAction<Product> {

	public String queryJoinCategory(){
		pageMap = new HashMap<>();
		List<Product> queryJoinCategory = productService.queryJoinCategory(model.getName(), page, rows);
		pageMap.put("rows",queryJoinCategory);
		Long total = productService.getCount(model.getName());
		pageMap.put("total", total);
		return "jsonMap";
	}
	
		
	
	public void save(){
		String pic = fileUpload.uploadFile(fileImage);
		model.setPic(pic);
		// 商品信息入库
		productService.save(model);
	}
	
	public void update() {
		System.out.println(model);
		productService.update(model);
	}
	
	public String deleteByIds() {
		productService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public String get() {
		request.put("product", productService.get(model.getId()));
		return "detail";
	}
	
	public String queryByCondition() {
		pageMap.put("products",productService.queryByCondition(model.getName()));
		return "jsonMap";
	}
}
