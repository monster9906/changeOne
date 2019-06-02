	package cn.it.shop.util;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.UUID;


import org.apache.commons.io.FilenameUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import cn.it.shop.model.FileImage;

@Component("fileUpload")
public class FileUploadUtil implements FileUpload  {
	@Value("#{prop.basePath+prop.filePath}")
	private String filePath = "";
	
	@Value("#{prop.basePath+prop.bankPath}")
	private String bankPath = "";
	
	public String[] getBankImage() {
		File file=new File(bankPath);
		return file.list(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.endsWith(".gif")?true:false;
			}
		});
	}
	
	
	// 1.通过文件名获取拓展名
	private String getFileExt(String fileName) {
		return FilenameUtils.getExtension(fileName);
	}
	
	// 2.生成新的文件名
	private String newFileName(String fileName) {
		String fileExt = getFileExt(fileName);
		return UUID.randomUUID().toString()+"."+fileExt;
	}
	
	// 实现文件上传
	@Override
	public String uploadFile(FileImage fileImage) {
		String pic = newFileName(fileImage.getFileFileName());
		try {
			FileUtil.copyFile(fileImage.getFile(), new File(filePath ,pic));
			return pic;
		} catch (IOException e) {	
			throw new RuntimeException(e);
		}finally {
			fileImage.getFile().delete();
		}
	}
}
