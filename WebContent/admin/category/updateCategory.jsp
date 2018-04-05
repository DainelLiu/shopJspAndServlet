<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath }/CategoryServlet">
		<input type="hidden" name="op" value="updateCategory"/>
		<input type="hidden" name="cid" value="<%=request.getParameter("cid")%>">
		<table border="0" align="center" width="700">
			<tr bgcolor="#B4CCCE">
				<td>
					<h3>分类修改</h3>
				</td>
				<td>
					<h4>
						<span style="color:red">*</span> 
						<span>分类类名：</span>
						<input type="text" name="cname" value="<%=request.getParameter("cname")%>" />
						<input type="submit" value="修改" />
					</h4>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
