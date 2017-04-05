<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>JSP连接数据库</title>
</head>
<body>
	<!--
	JDBC 驱动名及数据库 URL 
	数据库的用户名与密码，需要根据自己的设置
	useUnicode=true&characterEncoding=utf-8 防止中文乱码
	 -->
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8"
		user="root" password="root" />

	<h2>SELECT操作</h2>
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * from person;
	</sql:query>
	<table border="1" width="100%">
		<tr>
			<th>ID</th>
			<th>人名</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.id}" /></td>
				<td><c:out value="${row.name}" /></td>
			</tr>
		</c:forEach>
	</table>

	<!--删除 ID 为 3 的数据-->
	<h2>DELETE操作:id为3</h2>
	<sql:update dataSource="${snapshot}" var="count">
  		DELETE FROM person WHERE Id = ?
  	<sql:param value="${3}" />
	</sql:update>
	
	<!--修改 ID 为4 的名字为 hello-->
	<h2>UPDATE操作：id为4</h2>
	<c:set var="id" value="4"/> 
	<sql:update dataSource="${snapshot}" var="count">
	  	UPDATE person SET name = 'hello' WHERE Id = ?
	 <sql:param value="${id}" />
	</sql:update>
	
</body>
</html>