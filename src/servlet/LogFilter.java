package servlet;
//导入必需的 java 库
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

import java.util.*;

/**
 * 过滤器
 * @author liyubin
 *
 */
//实现 Filter 类
//功能：客户端发出一个请求后，服务器响应前，服务端后台显示访问的上下文及serlvet路径
public class LogFilter implements Filter  {
	public void  init(FilterConfig config) throws ServletException {
		// 获取初始化参数
		String site = config.getInitParameter("Site"); 

		// 输出初始化参数
		System.out.println("网站名称: " + site+"  过滤器已启动"); 
	}
	public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {

		HttpServletRequest hsr=(HttpServletRequest)request;
		// 输出站点名称
		System.out.println("上下文及serlvet路径："+hsr.getContextPath()+hsr.getServletPath());

		// 把请求传回过滤链
		chain.doFilter(request,response);
	}
	public void destroy( ){
		/* 在 Filter 实例被 Web 容器从服务移除之前调用 */
	}
}