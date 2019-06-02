package cn.it.shop.util;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;

/**
 * 用来刷新首页数据
 * @author soul
 *
 */
@Component("productTimerTask")
public class ProductTimerTask  extends TimerTask{
	
	@Resource
	private ProductService productService = null;
	@Resource
	private CategoryService categoryService = null;
	
	private ServletContext application = null;
	
	public ServletContext getApplication() {
		return application;
	}


	public void setApplication(ServletContext application) {
		this.application = application;
	}


	@Override
	public void run() {
		List<List<Product>> bigList = new ArrayList<List<Product>>();
		// 查询热点类别
		for(Category category :categoryService.queryByHot(true)) {
			// 根据热点类别查询商品信息
			bigList.add(productService.queryByCid(category.getId()));
		}
		application.setAttribute("bigList", bigList);
	}

}
