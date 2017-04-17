<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SessionPage1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h1>session内置对象</h1>
    <%
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
    	Date date=new Date(session.getCreationTime());
    	session.setAttribute("username", "liyubin");
    	session.setAttribute("password", "123456");
    %>
    创建时间：<%=sdf.format(date) %><br/>
    会话ID：<%=session.getId() %><br>
    用户名：<%=session.getAttribute("username") %><br/>
    <a href="SessionPage2.jsp" target="_blank">跳转到SessionPage2.jsp</a>
    <%
    	//销毁会话
    	session.invalidate();
     %>
  </body>
</html>
