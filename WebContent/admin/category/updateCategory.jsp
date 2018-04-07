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
	<form method="post" action="${pageContext.request.contextPath }/CategoryServlet">
		<input type="hidden" name="op" value="updateCategory"/>
		<input type="hidden" name="cid" value="<%=request.getParameter("cid")%>">
		<table border="1" align="center" width="700">
			<tr>
				<td>
					<h3>分类修改</h3>
				</td>
				<td>
					<h4>
						<span style="color:red">*</span> 
						<span>分类类名：</span>
						<input type="text" name="cname" value="<%=request.getParameter("cname")%>" />
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
