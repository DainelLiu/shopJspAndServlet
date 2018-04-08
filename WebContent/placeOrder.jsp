<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 	<title>订单处理</title>
 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 	<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
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
   table{
		border-collapse : collapse
	}
</style>
 	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.3.min.js"></script>
</head>
<body>
<c:if test="${empty categories }">
		<jsp:forward page="/MainServlet"></jsp:forward>
</c:if>
<div id="templatemo_body_wrapper" style="padding-top:8%">
	<center style="background-color:#fff;width: 50%;border-radius: 4px;margin: 0 auto;padding-bottom: 1px;">
		<h2 style="padding-top: 15px;margin-bottom: 0px;padding-bottom: 15px;">确认订单</h2>
		<hr>
		<form id="myForm" action="${pageContext.request.contextPath }/OrderServlet" method="post" style="padding-bottom: 10px;">
			<input type="hidden" name="uid" value="${user.uid }">
			<input type="hidden" name="op" value="placeOrder"/>
			<div>
				<table style="width: 700px;border-style:1px solid " border="1">
					<tr>
						<td>收件人:</td>
						<td><input type="text" name="recipients" required="required"/></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" name="tel" required="required"></td>
					</tr>
					<tr>
						<td>收件人地址:</td>
						<td><input type="text" name="address" size="80" required="required"/></td>
					</tr>
				</table>
			</div>
			<div style="padding-top: 30px;">
				<table style="width: 700px;text-align: center;" border="1">
					<tr>
						<th><input type="checkbox" id="cb"></th>
						<th>图片</th>
						<th>描述</th>
						<th>数量</th>
						<th>单价</th>
						<th>总价</th>
					</tr>
					<c:forEach items="${ shoppingCar.shoppingItems}" var="item">
						<tr id="tr${item.product.pid}">
							<td><input type="checkbox" class="ids" name="ids" value="${item.product.pid}"></td>
							<td><img src="files/${item.product.imgurl}" width="100" height="100" /></td>
							<td>${item.product.pname}</td>
							<td>${item.snum}</td>
							<td>${item.product.estoreprice}</td>
							<td id="price">${item.snum*item.product.estoreprice}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<input type="hidden" id="qq" name="money"/>
			<h2>总金额:<span class="sumPrice"></span></h2>
			<p class="cart_p"><a href="javascript:commitForm();">去下单</a></p>
			
		</form>
	</center>
</div>	
	<script type="text/javascript">
		
$(function(){
	
	$(".ids").click(function(){
		var price=0;
		$(".ids:checked").each(function(i,obj){
			var id=$(obj).val();
			//console.log(id);
			//console.log($("#tr"+id).find("#price").text());
			price+=parseInt($("#tr"+id).find("#price").text());
		})
		$(".sumPrice").text(price);
		$("#qq").val(price);
	})
	
	$("#cb").click(function(){
		var price=0;
		if($(this).attr("checked")){
			
			$(":checkbox").attr("checked",true);
			$(".ids:checked").each(function(i,obj){
			var id=$(obj).val();
			
			price+=parseInt($("#tr"+id).find("#price").text());
			})
		$(".sumPrice").html(price);
		$("#qq").val(price);
		//alert("price");
		//console.log($("#money").val);
		}else{
			$(":checkbox").attr("checked",false);
			$(".sumPrice").html(0);
		}
	})
	
})
function commitForm(){
	$('#myForm').submit();
}

	</script>
</body>
</html>
