
<%@ page pageEncoding="UTF-8" import="com.isscollege.gdce.domain.User"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<%=context%>/js/user/regist.js"></script>
<script type="text/javascript" src="<%=context%>/js/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="${context }/js/user/login.css">
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

<script type="text/javascript">
	if(window.name != "0"){
		location.reload();
		window.name = "0";
	}else{
		window.name = "";
	}
	$(function(){
		var count = 0;
		$(".right").click(function () {
			count++;
			if (count == $("#banner li").length) {
				count = 0;
			}
			$("#banner li").eq(count).fadeIn().siblings().fadeOut();
			$(".cicle li").eq(count).addClass("seleted").siblings().removeClass("seleted");
			return false;
		});
		$(".left").click(function () {
			count--;
			if (count == -1) {
				count = $("#banner li").length - 1;
			}
			$("#banner li").eq(count).fadeIn().siblings().fadeOut();
			$(".cicle li").eq(count).addClass("seleted").siblings().removeClass("seleted");
			console.log(count);
			return false;
		});
		setInterval(function () {
			count++;
			if (count == $("#banner li").length) {
				count = 0;
			}
			$("#banner li").eq(count).fadeIn().siblings().fadeOut();
			$(".cicle li").eq(count).addClass("seleted").siblings().removeClass("seleted");
		}, 3000)
		$(".register-btn").click(function() {

			window.location.href = '${context}/jsp/user/register.jsp';
		})
	})
</script>

<c:set var="user" target="User" value="${sessionScope.currentUser}"></c:set>
<c:set var="loginState" target="boolean" value="${user != null ? user.isLoginState() : false}"></c:set>

<body>
<div class="gdmtlogo">
	<a href="${context }"><img alt="logo" src="${context }/imgs/ZSKJlogo.png"></a>
</div>
<div class="container">
	<div class="login-banner">
		<ul id='banner'>
			<li class="current"><img src="${context }/imgs/3.png" alt="">

			</li>
			<li><img src="${context }/imgs/1.jpg" alt="">

			</li>
			<li><img src="${context }/imgs/2.png" alt="">

			</li>
		</ul>
	</div>
	<div class="login-box">
		<form action="${context}/login/login" method="post">
			<input type="hidden" name="forward" value="login" />
			<span class="heading">用户登录</span>
			<div class="zhanghao login-public">
				<label for="name">账号:</label>
				<input type="text" placeholder="用户名/手机/邮箱" value="${cookie.username.value}"  id="name" name="name">
				<h5>
					<font color="red">${requestScope.errors.loginname}</font>
				</h5>
			</div>

			<div class="mima login-public">
				<label for="password">密码:</label>
				<input type="password" name="password" id="password" placeholder="请输入密码" value="" >
				<i  class="fa fa-eye-slash" onclick="showhide()" id="eye"></i>
				<script type="text/javascript">
					var eye = document.getElementById("eye");
					var pwd = document.getElementById("password");

					function showhide(){

						if (pwd.type == "password") {
							pwd.type = "text";
							eye.className='fa fa-eye'
						}else {
							pwd.type = "password";
							eye.className='fa fa-eye-slash'
						}
					}
				</script>
				<h5>
					<font color="red">${requestScope.errors.loginpass}</font>
				</h5>
			</div>
			<div style=" width: 350px; margin-top: 50px;">
				验证码:&nbsp;&nbsp;
				<input type="text"
					   style="height: 30px; width: 70px; border: 1px solid #bbb; border-radius: 6px;"
					   name="verifyCode" id="verifyCode" />&nbsp;&nbsp; <img
					id="imgVerifyCode" src="${context}/verifyCode" />&nbsp;&nbsp;
				<a href="javascript:_hyz()">换一张</a>
				<script>
					function _hyz() {
						var img=document.getElementById("imgVerifyCode");
						img.src="${context}/verifyCode?method="+new Date().getTime();
					}
				</script>
			</div>
					 <input type="checkbox"  class="checked" name="rememberMe" id="rememberMe" >
					 <span class="remember">记住用户名</span>

			<div class="operation">
				<button  type="submit" class="login-btn" >登陆</button>
				<div class="register-btn" id="register">注册</div>
			</div>
			<h5>
				<font color="red">${requestScope.errors.verifyCode}</font>
			</h5>
		</form>
	</div>
</div>

<div class="jumbotron text-center" style="margin-bottom: 0">
	<p>
	<h5>
		<a href="" onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
		网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
		地址：北京市昌平区未来科技城 邮编：102209
		电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
		电子邮箱：fuel@powerec.net
	</h5>
	</p>
</div>
</body>
</html>
