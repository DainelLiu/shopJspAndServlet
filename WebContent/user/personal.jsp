<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
<style>
hr {
	border: 2px solid darkslateblue;
}

#submit,#reset,button {
	background-color: orangered;
	color: white;
}

span {
	color: orangered;
	font-weight: bolder;
}
.cart_p{
	border: 1px solid #0299aa;
    border-radius: 4px;
    text-align: center;
    height: 30px;
    line-height: 30px;
    width: 40%;
   }
</style>
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="templatemo_body_wrapper">
		<center>
			<div>
				<div style="height:138px;width:40%;background-color:transparent;"></div>
				<div style="background-color: #ffffff;width:40%;border-radius: 4px;padding-bottom: 10px;">
					<h1 style="padding-top: 15px;margin-bottom: 0px;padding-bottom: 15px;">个人资料</h1>
					<hr />
					<br />
					<!-- 
						 （仅限修改昵称，密码，邮箱和出生日期）
						 nickname
						 password
						 email
						 birthday
					 -->
					<form action="${pageContext.request.contextPath }/UserServlet" method="post" style="padding-bottom:10px;">
						<input type="hidden" name="uid" value="${user.uid }"/>
						<strong style="font-size:18px;">${user.username }</strong>
						<br /> <br />
						昵&nbsp;&nbsp;&nbsp;&nbsp;称：<input type="text" name="nickname" value="${user.nickname }">
						<br /><br />
						密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" value="${user.password }">
						<br /><br />
						邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" name="email" value="${user.email }">
						<br /> <br />
						出生日期：<input type="text" name="birthday" value="${birthday }">
						<br /><br />
						<%-- 头像： ${user.headicon }
						<br /><br /> --%>
						注册时间： ${user.updatetime }
						<br /><br />
						<%-- <span>请准确填写您的信息，确保货物准确到达</span>
						<br /><br />
						详细地址 <input type="text" style="width: 400px" name="address" value="${address }"><span>*</span>
						<br /><br />
						联系电话 <input type="text" name="tel" value="${tel }"><span>*</span>
						<br /><br />
						 联系QQ&nbsp;&nbsp;&nbsp;<input type="text" name="qq" value="${qq }">
						 <br /><br /> --%>
						<input type="submit" value="保存填写" id="submit">
						<input type="reset" value="撤销重写" id="reset">
					</form>
					<p class="cart_p"><a href="${pageContext.request.contextPath}/index.jsp">返回首页</a></p>
				</div>
			</div>
		</center>
	</div>
</body>
</html>