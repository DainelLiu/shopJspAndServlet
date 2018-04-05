<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
	<form method="post" action="${pageContext.request.contextPath }/AddProductServlet" enctype="multipart/form-data">
		<table border="0"  align="center" width="700">
			<tr bgcolor="#B4CCCE">
				<td >
					<h3>基本信息</h3>
				</td>
				<td>
						<h4><span style="color:red">*</span><span >品牌：</span>
							<select name="cid" id="st" onchange="change()">
								<c:forEach items="${categories }" var="category">
									<option value="${category.cid }">${category.cname }</option>
								</c:forEach>	
							</select>
						</h4>
						<h4><span style="color:red">*</span>商品号：</h4><input type="text " name="pid"/>
						<div style="height: 5px"></div>
					</td>
			<tr bgcolor=#B4CCCE>
				<td>
					<h3>库存/规格</h3>
				</td>
				<td>
					<table>
						<tr>
							<td><h4><span style="color:red">*</span>总库存：</h4><input type="text "  name="pnum"/></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr bgcolor="#B4CCCE">
				<td>
					<h3>商品信息：</h3>
				</td>
				<td>
					<table>
						<tr>
							<td><h4><span style="color:red">*</span>商品名：</h4><input type="text " name="pname"/></td>
						</tr>
						<tr>
							<td>
								<h4>商城价:</h4>￥<input type="text " name="estoreprice"/>
			
								<h4>市场价:</h4>￥<input type="text " name="markprice"/>
								<h4>图片区:</h4><input type="file" name="imgurl"/>
								
								<h4>商品描述:</h4><textarea name="description" cols="50" rows="5"></textarea>
								<br>
								<input type="submit" value="增加">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
	</form>
</html>


