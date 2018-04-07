<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			table{
				border-collapse : collapse;
			}
		</style>
	</head>
	<body>
	<form method="post" action="${pageContext.request.contextPath }/AddProductServlet" enctype="multipart/form-data">
		<table border="1" align="center" width="700">
			<tr>
				<td>
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
						<h4><span style="color:red">*</span>商品号：<input type="text " name="pid"/></h4>
						<div style="height: 5px"></div>
					</td>
			<tr>
				<td>
					<h3>库存/规格</h3>
				</td>
				<td>
					<table>
						<tr>
							<td><h4><span style="color:red">*</span>总库存：<input type="text "  name="pnum"/></h4></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<h3>商品信息：</h3>
				</td>
				<td>
					<table>
						<tr>
							<td><h4><span style="color:red">*</span>商品名：<input type="text " name="pname"/></h4></td>
						</tr>
						<tr>
							<td>
								<h4>商城价:￥<input type="text " name="estoreprice"/></h4>
			
								<h4>市场价:￥<input type="text " name="markprice"/></h4>
								<h4>图片区:<input type="file" name="imgurl"/></h4>
								
								<h4>商品描述:</h4><textarea name="description" cols="50" rows="5"></textarea>
								<br>
								
							</td>
						</tr>
					</table>
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


