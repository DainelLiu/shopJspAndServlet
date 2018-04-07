<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style type="text/css">
	hr {
		border: 2px solid darkslateblue;
	}
	.cart_p{
		border: 1px solid #0299aa;
	    border-radius: 4px;
	    text-align: center;
	    height: 30px;
	    line-height: 30px;
	    width: 40%;
	    margin-top:8px;
   }
</style>
</head>
<body>
<div id="templatemo_body_wrapper" style="padding-top:8%">
	<center style="background-color:#fff;width: 50%;border-radius: 4px;margin: 0 auto;padding-bottom: 1px;">
	<h2 style="padding-top: 15px;margin-bottom: 0px;padding-bottom: 15px;">我所有的订单</h2>
	<hr>
	<table width="700" align="center" style="text-align: center;">
		<tr>
			<th>订单号</th>
			<th>下单时间</th>
			<th>订单总金额</th>
			<th>订单状态</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${orders }" var="order" >
			<tr style="height:30px;font-size:15px">
				<td>${order.oid }</td>
				<td>${order.ordertime }</td>
				<td>${order.money }</td>
				<td>
					<c:if test="${order.state == 0}">订单已取消</c:if>
					<c:if test="${order.state == 1}">待发货</c:if>
					<c:if test="${order.state == 2}">已发货</c:if>
					<c:if test="${order.state == 3}">已完成</c:if>
				</td>
				<td>
					<c:if test="${order.state == 1}"><a href="${pageContext.request.contextPath }/OrderServlet?op=delOrder&oid=${order.oid}&state=0">取消订单</a></c:if>
					<c:if test="${order.state == 2}"><a href="${pageContext.request.contextPath }/OrderServlet?op=delOrder&oid=${order.oid}&state=3">确定收货</a>，<a href="${pageContext.request.contextPath }/OrderServlet?op=delOrder&oid=${order.oid}&state=0">取消</a></c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<p class="cart_p"><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a></p>
	</center>
</div>
</body>
</html>