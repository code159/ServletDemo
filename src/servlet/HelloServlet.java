package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("处理Get请求");
		PrintWriter out = response.getWriter();
		//指定文件格式
		response.setContentType("text/html;charset=utf-8");
		// 如果不指定文件格式的话，下面那些内容将直接作为文本输出
		out.println("<strong>Hello Servlet! Get</strong><br />");
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("处理Post请求");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		out.println("<strong>Hello Servlet! Post</strong><br />");
	}

}
