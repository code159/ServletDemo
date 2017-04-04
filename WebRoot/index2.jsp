<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" %>
<%@ page import="java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
    This is my JSP page. <br>
    <h1>第一个servlet小例子</h1>
    <hr>
    <a href="servlet/HelloServlet">Get方式请求HelloServlet</a>
    <form action="servlet/HelloServlet" method="post">
    	<input type="submit" value="Post方式请求HelloServlet">
    </form>
    
    <h1>Servlet生命周期</h1>
    <hr>
    <a href="servlet/TestServlet1">Get方式请求TestServlet1</a>
    <!-- HTM注释，客户端可见 -->
    <%-- JSP注释，客户端不可见 --%>
    
    <!-- JSP声明 -->
    <%! 
    	//声明变量
    	String name="李宇彬";
    	String s="";
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
    	//声明方法
    	int add(int x,int y){
    		return x+y;
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
    	void function2(JspWriter out) throws Exception{
    		s="";
    		s=function(9);
    		out.println(s);
    	}
    %>
    <!-- JSP脚本 -->
    <% 
	    //jsp单行注释
	    /*多行注释
	    */
	    out.println("大家好，欢迎大家学习Java Web。来自JSP脚本");
	    out.println(name);
	    out.println("3+2="+add(3,2));
	    //通过html的<br/>标签实现换行
	    out.println("当前日期是："+sdf.format(new Date())+"<br/>");
	    out.println("九九乘法表(脚本方式打印)："+"<br/>");
	    function2(out);
    %>
    <br />
    <!-- JSP表达式 -->
    你好，<%= name %><br />
  10+20=<%= add(10,20) %><br />
    九九乘法表(表达式方式打印)：<br/><%= function(9) %>
  </body>
</html>
