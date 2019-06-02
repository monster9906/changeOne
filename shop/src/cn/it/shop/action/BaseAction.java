package cn.it.shop.action;

import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.RuntimeErrorException;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.it.shop.model.Category;
import cn.it.shop.model.FileImage;
import cn.it.shop.service.AccountService;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.PayService;
import cn.it.shop.service.ProductService;
import cn.it.shop.service.SorderService;
import cn.it.shop.service.UserService;
import cn.it.shop.util.FileUpload;
import cn.it.shop.util.MessageUtil;
import cn.it.shop.util.EmailUtil;

@Controller
@Scope("prototype")
public class BaseAction<T> extends ActionSupport implements RequestAware,SessionAware,ApplicationAware,ModelDriven<T>{
	protected T model;
	
	protected Integer page ;
	
	protected Integer rows;
	
	protected Map pageMap;
	
	protected Map faceMap;
	
	protected FileImage fileImage;
	
	protected List<T> josnList = null;
	
	// 要删除类别及商品的id
	protected String ids;
	
	protected InputStream inputStream;
	
	public Map getPageMap() {
		return pageMap;
	}
	
	public Map getFaceMap() {
		return faceMap;
	}
	
	public List<T> getJosnList() {
		return josnList;
	}


	@Resource
	protected CategoryService categoryService;
	
	@Resource
	protected AccountService accountService;
	
	@Resource
	protected ProductService productService;
	
	@Resource
	protected ForderService forderService;
	
	@Resource
	protected SorderService sorderService;
	
	@Resource
	protected UserService userService;
	
	@Resource
	protected PayService payService;
	
	@Resource
	protected FileUpload fileUpload;
	
	@Resource
	protected EmailUtil emailUtil;
	
	@Resource
	protected MessageUtil messageUtil;
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public FileImage getFileImage() {
		return fileImage;
	}

	public void setFileImage(FileImage fileImage) {
		this.fileImage = fileImage;
	}

	@Override
	public T getModel() {
		ParameterizedType tpye = (ParameterizedType) this.getClass().getGenericSuperclass();
		Class clazz = (Class) tpye.getActualTypeArguments()[0];
		try {
			model = (T) clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
		return model;
	}
	
	
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}
	
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	
}
