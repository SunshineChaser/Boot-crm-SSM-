<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登录页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" type="text/css" media="all" />

</head>
<body>

	<!-- main -->
	<div class="main-w3layouts wrapper">
		<div class="main-agileinfo">
			<div class="agileits-top">
				<font color="red"> <%--提示信息 --%> <span id="message">${msg}</span>
				</font>
				<form action="${pageContext.request.contextPath}/login.action" method="post">
					<input class="text" type="text" name="usercode" placeholder="usercode"
						required=""> <input class="text" type="password"
						name="password" placeholder="密码" required="">
					<div class="wthree-text">
						<ul>
							<li><label class="anim"> <input type="checkbox"
									class="checkbox" required=""> <span> 记住 ?</span>
							</label></li>
							<li><a href="#">忘记密码 ?</a></li>
						</ul>
						<div class="clear"></div>
					</div>
					<input type="submit" value="登录">
				</form>
				<p>
					创建一个账号? <a href="#"> 立即登录!</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>

