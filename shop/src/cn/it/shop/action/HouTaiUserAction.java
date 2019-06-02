package cn.it.shop.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.it.shop.model.FaceInfo;
import cn.it.shop.util.FaceMatch;
import sun.misc.BASE64Decoder;

@Controller
@Scope("prototype")
public class HouTaiUserAction extends BaseAction<FaceInfo>{
	
	@SuppressWarnings("unchecked")
	public String login() {
		List<FaceInfo> list = userService.houtai_login();
		String sjk_face =null;
		for (FaceInfo faceInfo : list) {
			sjk_face = faceInfo.getFcontent();
		}
		String face = ServletActionContext.getRequest().getParameter("face");
		BASE64Decoder bd = new BASE64Decoder();
		byte[] face1;
		faceMap = new HashMap<>();
		try {
			face1 = bd.decodeBuffer(face);
			// 获得匹配结果
			String Initresult = FaceMatch.match(sjk_face , face1);
			JSONObject myJsonObject = new JSONObject(Initresult);
			String result = myJsonObject.get("result").toString();
			String score = null;
			if(result != null) {
				 JSONObject jo = new JSONObject(result);
				 score = jo.get("score").toString();
				 if(myJsonObject.getString("error_msg") .equalsIgnoreCase("SUCCESS")) {
					 session.put("score", score);
				 }
				 faceMap.put("score", score);
			 }else {
				 faceMap.put("error", myJsonObject.getString("error_msg"));
			 }
			return "jsonMap";
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	
}
