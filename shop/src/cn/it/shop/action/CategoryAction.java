package cn.it.shop.action;




import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Category;

@Controller
@Scope("prototype")
public class CategoryAction extends BaseAction<Category>{
		
		public String query() {
			josnList = new ArrayList<>();
			josnList = categoryService.query();
			return "josnList";
		}
		
		public String save() {
			categoryService.save(model);
			return ids;
		}
		
		public String queryJoinAccount() {
			pageMap = new HashMap<>();
			// 查询分页数据
			List<Category> categoryList = categoryService.queryJionAccount(model.getType(),page, rows);
			pageMap.put("rows",categoryList);
			// 根据输入参数输出总记录数
			Long total = categoryService.getCount(model.getType());
			pageMap.put("total", total);
			return "jsonMap";
		}
		
		public String deleteByIds() {
			categoryService.deleteByIds(ids);
			inputStream = new ByteArrayInputStream("true".getBytes());
			return "stream";
		}
		
		public void update() {
			System.out.println(model);
			categoryService.update(model);
		}
		
		
		public String goHouTai() {
			return "aindex";
		}
}
