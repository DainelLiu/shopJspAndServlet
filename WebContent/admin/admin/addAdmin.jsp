<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加系统用户</title>
</head>
<body>
	
	<form method="post" action="${pageContext.request.contextPath }/AdminServlet">
		<input type="hidden" name="op" value="addAdmin"/>
		<table border="0" align="center" width="700">
			<tr bgcolor="#B4CCCE">
				<td>
					<h3>系统用户增加</h3>
				</td>
				<td>
					<h4>
						<span style="color:red">*</span>
						<span>系统用户名：</span>
						<input type="text" name="username" value="${username }"/>
						${msgUname }
					</h4>
					<h4>
						<span style="color:red">*</span>
						<span>请输入密码：</span>
						<input type="password" name="password" value="${password }"/>
						${msgPwd }
					</h4>
					<h4>
						<span style="color:red">*</span>
						<span>请确认密码：</span>
						<input type="password" name="password1" value="${password1 }"/>
						${msgPwd1 }
						${msgPwd2 }
					</h4>
					<p><input type="submit" value="增加" /></p>
				</td>
			</tr>
		</table>
</body>
</html>