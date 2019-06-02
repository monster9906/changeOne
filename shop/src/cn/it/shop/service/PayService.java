package cn.it.shop.service;

import java.util.Map;

import cn.it.shop.model.BackData;
import cn.it.shop.model.SendData;

public interface PayService {

	/**
	 * 把加密后的信息存储到requestMap中
	 * @param request
	 * @param sendData
	 * @return
	 */
	Map<String, Object> saveDataToRequest(Map<String, Object> request, SendData sendData);
	
	// 对返回来的数据进行加密,并且和传过来的密文进行比较,如果OK则说明数据没有被篡改
	boolean checkBackData(BackData backData);
}