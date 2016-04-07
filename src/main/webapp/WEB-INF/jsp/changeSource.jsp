<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>选择数据采集源</title>
</head>

<body>
	<form:form action="changeSource" method="post"	commandName="hotkeySource">
	     请选择数据采集源：
		<form:select path="sourceCode" items="${dataSourceList}"
			itemValue="sourceCode" itemLabel="sourceName" />
			  
		<td colspan="2"><input type="submit" value="提交" /></td>
	</form:form>

</body>
</html>
