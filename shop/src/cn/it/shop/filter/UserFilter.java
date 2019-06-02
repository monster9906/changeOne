package cn.it.shop.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/UserFilter")
public class UserFilter implements Filter {

    public UserFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		if(req.getSession().getAttribute("user") == null) {
			String goURL = req.getServletPath();
			String param = req.getQueryString();
			if(param != null) {
				goURL = goURL +"?" + param;
			}
			req.getSession().setAttribute("goURL", goURL);
			req.getSession().setAttribute("error", "非法请求，请登录！");
			res.sendRedirect(req.getContextPath()+"/ulogin.jsp");
		}else {
			chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {}

}
