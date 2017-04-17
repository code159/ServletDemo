<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.*" %>
<%
   // 编码，解决中文乱码   
   String str = URLEncoder.encode(request.getParameter("name"),"utf-8");  
   // 设置 name 和 url cookie 
   Cookie name = new Cookie("name",str);
   Cookie url = new Cookie("url",request.getParameter("url"));

   // 设置cookie过期时间为24小时。
   name.setMaxAge(60*60*24); 
   url.setMaxAge(60*60*24); 

   // 在响应头部添加cookie
   response.addCookie( name );
   response.addCookie( url );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>cookie演示</title>
</head>
<body>
	<h1>设置 Cookie</h1>
	<hr/>
	<ul>
	<li><p><b>网站名:</b>
	   <%= request.getParameter("name")%>
	</p></li>
	<li><p><b>网址:</b>
	   <%= request.getParameter("url")%>
	</p></li>
	</ul>
	
	<h1>获取 Cookie</h1>
	<hr/>
	<%
	  Cookie cookie = null;
	  Cookie[] cookies = null;
	  // 获取cookies的数据,是一个数组
	  cookies = request.getCookies();
	  if( cookies != null ){
	     out.println("<h2> 查找 Cookie 名与值</h2>");
	     for (int i = 0; i < cookies.length; i++){
	        cookie = cookies[i];
	       
	        out.print("参数名 : " + cookie.getName());
	        out.print("<br>");
	        out.print("参数值: " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");
	        out.print("------------------------------------<br>");
	     }
	 }else{
	     out.println("<h2>没有发现 Cookie</h2>");
	 }
	%>
	
	<h1>删除 Cookie</h1>
	<hr/>
	<%
	/*
		步骤：
		1、获取一个已经存在的cookie然后存储在Cookie对象中。
		2、将cookie的有效期设置为0。
		3、将这个cookie重新添加进响应头中。
	*/
		cookies=request.getCookies();
		if( cookies != null ){
		     out.println("<h2> 查找 Cookie 名与值</h2>");
		     for (int i = 0; i < cookies.length; i++){
		        cookie = cookies[i];
		       	if(cookie.getName().equals("name")){
		       		cookie.setMaxAge(0);
		       		response.addCookie(cookie);
		       	}
		        
		        out.print("参数名 : " + cookie.getName());
		        out.print("<br>");
		        out.print("参数值: " + URLDecoder.decode(cookie.getValue(), "utf-8") +" <br>");
		        out.print("------------------------------------<br>");
		     }
		 }else{
		     out.println("<h2>没有发现 Cookie</h2>");
		 }
	%>
</body>
</html>