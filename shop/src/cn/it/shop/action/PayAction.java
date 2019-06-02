package cn.it.shop.action;

import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.BackData;
import cn.it.shop.model.Forder;
import cn.it.shop.model.SendData;
import cn.it.shop.model.User;

@Controller
@Scope("prototype")
public class PayAction extends BaseAction<Object> implements ParameterAware{
	private Map<String, String[]> parameter;
	
	@Override
	public void setParameters(Map<String, String[]> parameter) {
		this.parameter = parameter;
	}
	
	@Override
	public Object getModel() {
		if(parameter.get("pd_FrpId") != null) {
			model = new SendData();
		}else {
			model = new BackData();
		}
		return model;
	}



	public String goBank() {
		// 1.补全参数 P2 p3 pd Pa
		SendData  sendData = (SendData)model;
		Forder forder = (Forder)session.get("oldForder");
		User user = (User)session.get("user");
		sendData.setP2_Order(forder.getId().toString());
		//sendData.setP3_Amt(String.valueOf(forder.getTotal()));
		sendData.setP3_Amt("0.01");
		sendData.setPa_MP(user.getEmail() + "," +user.getPhone());
		
		// 2. 对参数进行追加
		// 3. 加密获取签名
		// 4.存到request域中
		payService.saveDataToRequest(request, sendData);
		// 5. 跳转支付页面
		return "pay";
	}
	
	public void backbank() {
		BackData backData = (BackData)model;
		boolean checkBackData = payService.checkBackData(backData);
		if(checkBackData) {
			// 更新订单状态
			forderService.updateStatusByid(Integer.parseInt(backData.getR6_Order()), 2);
			// 发送邮件
			String email = backData.getR8_MP().split(",")[0];
			emailUtil.sendEmail(email, backData.getR6_Order());
			// 发送短信
			String phone = backData.getR8_MP().split(",")[1];
			messageUtil.sendMessage(phone, backData.getR6_Order());
		}
	}

}
