package cn.it.shop.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Status;
import cn.it.shop.model.User;

@Controller
@Scope("prototype")
public class ForderAction extends BaseAction<Forder> {
	
	@Override
	public Forder getModel() {
		model = (Forder) session.get("forder");
		return model;
	}
	
	// 实现购物车（订单）和购物项级联入库
	public String save() {
		model.setUser((User)session.get("user"));
		model.setStatus(new Status(1));
		forderService.save(model);
		// 购物车设置为空
		session.put("oldForder", session.remove("forder"));
		return "bank";
	}
}
