package cn.it.shop.util;




import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.stereotype.Component;

/**
 *  实现发送短信的功能
 * @author soul
 *
 */
@Component("messageUtil")
public class MessageUtilImpl implements MessageUtil {
	
	/* (non-Javadoc)
	 * @see cn.it.shop.util.MessageUtil#sendMessage(java.lang.String, java.lang.String)
	 */
	@Override
	public void sendMessage(String phone ,String id){
		// 1.创建浏览器对象
		HttpClient client = new HttpClient();
		// 2. 创建请求方式
		PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn/");
		// 3.设置请求参数
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		post.setParameter("Uid", "soul_java");
		post.setParameter("Key", "d41d8cd98f00b204e980");
		post.setParameter("smsMob", phone);
		post.setParameter("smsText", "您的订单"+id+"已经下单成功！");
		try {
			int code = 0;
			code = client.executeMethod(post);
			// 返回状态码
			String res = post.getResponseBodyAsString(); // 获取响应结果
			System.out.println("状态码："+code +"~~~~响应结果："+res);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			post.releaseConnection();// 释放请求
		}
	}
	
}
