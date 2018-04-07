<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	table{
		border-collapse : collapse
	}
</style>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath }/AdminServlet">
		<input type="hidden" name="op" value="updateAdmin"/>
		<input type="hidden" name="aid" value="<%=request.getParameter("aid")%>">
		<table border="1" align="center" width="700">
			<tr>
				<td>
					<h3>系统用户修改</h3>
				</td>
				<td>
					<h4>
						<span style="color:red">*</span> 
						<span>系统用户名：</span>
						<input type="text" name="username" value="<%=request.getParameter("username")%>" readonly="readonly" />
						${msg }
					</h4>
					<h4>
						<span style="color:red">*</span> 
						<span>请输入密码：</span>
						<input type="password" name="password" value="" />
						${msgPwd }
					</h4>
					<h4>
						<span style="color:red">*</span> 
						<span>请确认密码：</span>
						<input type="password" name="password1" value="" />
						${msgPwd1 }
						${msgPwd2 }
					</h4>
				</td>
			</tr>
			<tr style="text-align: center;">
				<td colspan="2">
					<input type="submit" value="增加" style="width: 200px;height: 30px;" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
