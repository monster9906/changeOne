package cn.it.shop.test;

import java.io.File;
import java.io.FilenameFilter;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Category;
import cn.it.shop.model.FaceInfo;
import cn.it.shop.model.Product;
import cn.it.shop.model.User;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.ProductService;
import cn.it.shop.service.SorderService;
import cn.it.shop.service.UserService;
import cn.it.shop.service.Impl.CategoryServiceImpl;
import cn.it.shop.service.Impl.ForderServiceImpl;
import cn.it.shop.service.Impl.ProductServiceImpl;
import cn.it.shop.service.Impl.SorderServiceImpl;
import cn.it.shop.service.Impl.UserServiceImpl;
import cn.it.shop.util.FileUpload;
import cn.it.shop.util.FileUploadUtil;
import net.sf.json.JSONSerializer;

@ContextConfiguration(locations="classpath:applicationContext-*.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class Jtest {
	@Autowired
	CategoryService categoryService = new CategoryServiceImpl();
	
	@Autowired
	ProductService productService = new ProductServiceImpl();
	
	@Autowired
	UserService userService = new UserServiceImpl();
	
	@Autowired
	ForderService forderService = new ForderServiceImpl();
	
	@Autowired
	SorderService sorderService = new SorderServiceImpl();
	
	@Autowired
	FileUpload util = new FileUploadUtil();
	
	@Test
	public void bank() {
		String[] bankImage = util.getBankImage();
		for (String string : bankImage) {
			System.out.println(string);
		}
	}
	
	@Test
	public void query() {
		List<Product> queryByCondition = productService.queryByCondition("欧版");
		for (Product product : queryByCondition) {
			System.out.println(product.toString());
		}
		
	}
	
	@Test
	public void reg() {
			User user = new User();
			user.setEmail("45646546@qq.com");
			user.setLogin("sd");
			user.setName("lisi");
			user.setPass("123");
			user.setSex("男");
			user.setPhone("312231232131");
			userService.register(user);
	}
	
	@Test
	public void login() {
		User user = new User();
		user.setPass("user");
		user.setLogin("user");
		System.out.println(userService.login(user));
	}
	
	@Test
	public void login2() {
		List<FaceInfo> houtai_login = userService.houtai_login();
		for (FaceInfo faceInfo : houtai_login) {
			System.out.println(faceInfo.getFcontent());
		}
	}
	
	
	
	@Test
	public void login1() {
		List<Object> querySale = sorderService.querySale(5);
		for (Object object : querySale) {
			System.out.println(object);
		}
	}
	
	@Test
	public void Query1() {
		List<Category> query = categoryService.query();
		for (Category category : query) {
			System.out.println(category);
		}
	}
	
	@Test
	public void Query() {
		for (Product product : productService.queryJoinCategory("",1, 5)) {
			System.out.println(product);
			product.getCategory().setAccount(null);
			System.out.println(JSONSerializer.toJSON(product));
		}
	}
	
	@Test
	public void Query2() {
		List<Category> queryJionAccount = categoryService.queryJionAccount("",1,2);
		for (Category category : queryJionAccount) {
			System.out.println(category);
			System.out.println(category.getAccount().toString());
		}
	}
	
	@Test
	public void TestGetCount() {
		System.out.println(categoryService.getCount(""));
	}
	
	@Test
	public void TestDeleteById() {
		categoryService.deleteByIds("1,2,3");
	}
	
	
	
	@Test
	public void qeuryByHot(){
		List<Category> queryByHot = categoryService.queryByHot(true);
		for (Category category : queryByHot) {
			System.out.println(category.toString());
		}
	}
	
	@Test
	public void queryByCid(){
		List<Product> queryByCid = productService.queryByCid(1);
		for (Product product : queryByCid) {
			System.out.println(product.toString());
		}
	}
	
	
	@Test
	public void zz() {
		System.out.println((10*(2-8)+10)/(5-5*2));
	}
}
