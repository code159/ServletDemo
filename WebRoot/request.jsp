<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>requese内置对象</title>
</head>
<body>
<h1>使用 GET 方法读取数据</h1>
<ul>
<li><p><b>站点名:</b>
   <%= request.getParameter("name")%>
</p></li>
<li><p><b>网址:</b>
   <%= request.getParameter("url")%>
</p></li>
</ul>

<h1>使用 POST 方法读取数据</h1>
<%
	//解决中文乱码问题
	request.setCharacterEncoding("utf-8");
	
	String name2=null;
	String url2=null;
	String a="";
	if(request.getMethod().equals("POST")){
		// 解决中文乱码的问题
		name2 = new String((request.getParameter("name2")).getBytes("ISO-8859-1"),"UTF-8");
		url2=request.getParameter("url2");
		
		String[] cbs=request.getParameterValues("cb");
		for(String cb:cbs){
			a+=(cb+" ");
		}		
	}
	
%>
<ul>
<li><p><b>站点名:</b>
   <%=name2%>
</p></li>
<li><p><b>网址:</b>
   <%=url2%>
</p></li>
<li><p><b>类型:</b>
   <%=a%>
</p></li>
</ul>
类型：  
  <%
  		String[] cbs=request.getParameterValues("cb");
		if(cbs!=null){
			for(String s:cbs){
				out.println(s+" ");
			}
		}	
   %>
</body>
</html>