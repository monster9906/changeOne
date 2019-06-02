package cn.it.shop.util;

import cn.it.shop.model.FileImage;

public interface FileUpload {

	// 实现文件上传
	String uploadFile(FileImage fileImage);
	
	
	// 获取银行图片
	String[] getBankImage();
}