<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>spark运算结果前台显示</title>
</head>
<body>
	<a href="servlet/SparkWordCountServlet">显示wordcount结果（Java Api读取文件）</a>
	
	<h2>Post表单提交到spark.jsp</h2>
	<form action="servlet/SparkWordCountServlet" method="POST">
	数据: <input type="text" name="content">
	<input type="submit" value="提交" />
	</form>
</body>
</html>