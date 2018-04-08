<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/admin/js/jquery.js"></script>
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
	<center style="background-color:#fff;width: 60%;border-radius: 4px;margin: 0 auto;padding-bottom: 1px;">
	<h2 style="padding-top: 15px;margin-bottom: 0px;padding-bottom: 15px;">我所有的订单</h2>
	<hr>
	<table width="800" align="center" style="text-align: center;">
		<tr>
			<th>订单号</th>
			<th>下单时间</th>
			<th>订单总金额</th>
			<th>订单状态</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${orders.records  }" var="order" >
			<tr style="height:30px;font-size:15px">
				<td>${order.oid }</td>
				<td>
					<c:forEach items="${ordertimes }" var="items" >
					 <c:if test="${order.oid eq items.oid}">
					 	${items.ordertime }
					 </c:if>
					
					</c:forEach>
				</td>
				<td>${order.money }</td>
				<td>
					<c:if test="${order.state == 0}">订单已取消</c:if>
					<c:if test="${order.state == 1}">待发货</c:if>
					<c:if test="${order.state == 2}">已发货</c:if>
					<c:if test="${order.state == 3}">已完成</c:if>
				</td>
				<td>
					<c:if test="${order.state == 1}"><a href="${pageContext.request.contextPath }/OrderServlet?op=delOrder&oid=${order.oid}&state=0&num=1">取消订单</a></c:if>
					<c:if test="${order.state == 2}"><a href="${pageContext.request.contextPath }/OrderServlet?op=delOrder&oid=${order.oid}&state=3">确定收货</a>，<a href="${pageContext.request.contextPath }/OrderServlet?op=delOrder&oid=${order.oid}&state=0">取消</a></c:if>
				</td>
			</tr>
		</c:forEach>
					<tr>
				<td colspan="5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="2"><div align="left">
									<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
											${orders.totalRecordsNum }</strong> 条记录，当前第<strong>${orders.currentPageNum }</strong>
										页，共 <strong>${orders.totalPageNum }</strong> 页
									</span>
								</div></td>
							<td colspan="3">
								<table width="312" border="0" align="right" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="49">
											<div align="center">
												<span class="STYLE22"> <a
													href="${pageContext.request.contextPath }/OrderServlet?op=myoid&num=1">首页</a>
												</span>
											</div>
										</td>
										<td width="49">
											<div align="center">
												<span class="STYLE22"> <a
													href="${pageContext.request.contextPath }/OrderServlet?op=myoid&num=${orders.prevPageNum}">上一页</a>
												</span>
											</div>
										</td>
										<td width="49"><span class="STYLE22">
												<div align="center">
													<span class="STYLE22"> <a
														href="${pageContext.request.contextPath }/OrderServlet?op=myoid&num=${orders.nextPageNum}">下一页</a>
													</span>
												</div></td>
										<td width="49">
											<div align="center">
												<span class="STYLE22"><a
													href="${pageContext.request.contextPath }/OrderServlet?op=myoid&num=${orders.totalPageNum }">尾页</a></span>
											</div>
										</td>
										<td width="37" class="STYLE22"><div align="center">转到</div>
										</td>
										<td width="22">
											<div align="center">
												<input type="text" name="num" id="num"
													value="${orders.currentPageNum }"
													style="width: 20px; height: 12px; font-size: 12px; border: solid 1px #7aaebd;" />
											</div>
										</td>
										<td width="22" class="STYLE22"><div align="center">页</div>
										</td>
										<td width="35">
											<div align="center">
												<span class="STYLE22"><a style="cursor: pointer;"
													onclick="jump()">跳转</a></span>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</table>
	<p class="cart_p"><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a></p>
	</center>
</div>
<script type="text/javascript">
		$().ready(function(){
			$("#checkbox11").click(function(){
				if($(this).attr("checked")){
					$(":checkbox").attr("checked",true);
				}else{
					$(":checkbox").attr("checked",false);
				}
			})
		})
		function jump() {
			
			var num = document.getElementById("num").value;
			if (!/^[1-9][0-9]*$/.test(num)) {
				alert("请输入正确的页码");
				return;
			}
	
			if (num > ${orders.totalPageNum}) {
				alert("页码超出范围");
				return;
			}
	
			window.location.href = "${pageContext.request.contextPath }/CategoryServlet?op=findAllCategory&num="
					+ num;
	
		}
	</script>
</body>
</html>