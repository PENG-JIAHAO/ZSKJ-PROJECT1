<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/jsp/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="${context }/js/user/regist.js"></script>
<link rel="stylesheet" type="text/css" href="${context }/js/user/regist.css">
<body>
	<c:set var="cuser"  target="User" value="${sessionScope.currentUser}"></c:set>
	<c:if test="${empty cuser || cuser.getLevel() != 0}">
   		<c:redirect url="/jsp/review/review.jsp"></c:redirect>
    </c:if>
	
	<div class="container text-right" style="margin-bottom: 0">
		<c:if test="${empty currentUser }" var="reLogin">
			<a href='${context }/jsp/user/login.jsp'>登录</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${not reLogin}">
			<c:out value="${currentUser }"></c:out>&nbsp;&nbsp;
		</c:if>
		<c:if test="${empty currentUser}" var="reRegister">
			<a href='${context }/jsp/user/register.jsp'>注册</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${not reRegister }">
			<c:out value=""></c:out>&nbsp;&nbsp;
		</c:if>
		<a href="${context }/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
			<h3 class="text-muted">
				<img alt="logo" src="${context }/imgs/logo.png">
			</h3>
			</nav>
		</div>
	</div>

	<div class="box" ; align="center">
		<img alt="分割图" src="${context }/imgs/banner004.png";>
	</div>
	<h3 align="center">二级管理员添加</h3>
	<div class="container" >
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column">
						<div class="panel panel-default">
							<div class="panel-body" align="center">
								<a href="${context }/review/productReview"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default " type="button" onClick="showReport2()">审核</button></a>
							</div>
							<div class="panel-body" align="center" >
								<a href="${context }/news/queryNews?type=hgzc&page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default" type="button" onClick="showReport2()">资讯管理</button></a>
							</div>
							<div class="panel-body" align="center">
								
								<c:if test="${cuser.getLevel() == 0 }"></c:if>								
								<a href="${context }/jsp/user/superManager.jsp" target="_self">
									<button style="width: 90px; height: 40px"
										class="btn btn-default btn-primary" type="button"
										onClick="showReport1()">二级管理员</button>
								</a>
								
							</div>
						</div>
					</div>
					<div class="col-md-10 column" align="center">
						<form action="${context }/register"
							method="post">
						  <table align="center"
								style="border-collapse: separate; border-spacing: 0px 10px;">
                            <tr>
                              <td width="108"><input type="hidden" name="forward" value="addmanager"></td>
                            </tr>
                            <tr>
                              <td>用户名：</td>
                              <td width="168"><input name="name" type="text" class="inputClass" id="loginname" value="${requestScope.form.loginname}"></td>
                              <td class="tdError">
         						 <label class="errorClass" id="loginpassError">${requestScope.form.loginname}</label></td>
                            </tr>
                            <tr>
                              <td>密码：</td>
                              <td><input type="text" name="password" id="loginpass" class="inputClass" value="${requestScope.form.loginpass}"></td>
                               <td class="tdError">
          <label class="errorClass" id="loginpassError">${requestScope.errors.loginpass }</label>
        </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><input type="checkbox" name="permission2" value="1">
                              权限1：审核
                                <input type="checkbox" name="permission" value="5">
                                权限2：资讯</td>
                            </tr>
                            <tr>
                              <td align="right"><input name="submit" type="submit" value="创建"></td>
                            </tr>
                            <tr>
                              <td><a href="${context}/jsp/user/superManager.jsp">返回</a></td>
                            </tr>
                          </table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 280px">
		<p>
		<h5>
			<a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
			网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
		</p>
	</div>
</body>
</html>