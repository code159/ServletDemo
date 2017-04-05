package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//九九乘法表
public class MultiplicationTableServlet extends HttpServlet{
	private String s;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(this.getClass()+" 正在处理Get请求");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		try {
			function2(out);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	String function(int a){
		s="";
    	for(int i=1;i<a+1;i++){
	    	for(int j=1;j<=i;j++){
	    		s+=(i+"*"+j+"="+i*j+"\t");
	    	}
	    	s+="<br/>";
	    }
	    return s;
	}
	void function2(PrintWriter out) throws Exception{
		s="";
		s=function(9);
		out.println(s);
	}

}
