<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP九大内置对象</title>
</head>
<body>
	<h3>out对象</h3>
	<hr/>
	<%
		out.println("this is good!");
		out.println(out.getBufferSize());
		
	%>
	<h3>request对象：HTTP头部请求实例</h3>
	<hr/>
	<table width="100%" border="1" align="center">
		<tr bgcolor="#949494">
			<th>Header Name</th>
			<th>Header Value(s)</th>
		</tr>
		<%
			//request.getHeaderNames()返回name集合
			Enumeration headerNames = request.getHeaderNames();
			while (headerNames.hasMoreElements()) {
				String paramName = (String) headerNames.nextElement();
				out.print("<tr><td>" + paramName + "</td>\n");
				//equest.getHeader()返回name指定的信息头value
				String paramValue = request.getHeader(paramName);
				out.println("<td> " + paramValue + "</td></tr>\n");
			}
		%>
	</table>
	<%
		//\n是不能换行的，得用<br/>
		out.println("请求信息的字符集："+request.getCharacterEncoding()+"<br/>");
		out.println("请求信息的认证方案名："+request.getAuthType()+"<br/>");
		out.println("请求信息的MIME类型："+request.getContentType()+"<br/>");
		out.println("请求信息的上下文路径："+request.getContextPath()+"<br/>");
		out.println("请求信息的HTTP方法："+request.getMethod()+"<br/>");
		out.println("请求信息使用的协议："+request.getProtocol()+"<br/>");
		out.println("请求信息请求的servlet路径："+request.getServletPath()+"<br/>");
	%>
	<h3>response对象：自动刷新实例</h3>
	<hr/>
	<%
		// 设置每隔5秒自动刷新
		response.setIntHeader("Refresh", 5);
		// 获取当前时间
		Calendar calendar = new GregorianCalendar();
		String am_pm;
		int hour = calendar.get(Calendar.HOUR);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		if (calendar.get(Calendar.AM_PM) == 0)
			am_pm = "AM";
		else
			am_pm = "PM";
		String CT = hour + ":" + minute + ":" + second + " " + am_pm;
		out.println("当前时间: " + CT);
		out.println("<br/>");
		out.flush();
		//response.getWriter()是PrintWriter对象，out内置对象是JspWriter对象，输出时默认前者优先输出
		//若要放到后面，则要用out.flush()
		PrintWriter outer=response.getWriter();
		outer.println("<b>这是response.getWriter()获取的PrintWriter对象</b>\n");
		
	%>

</body>
</html>