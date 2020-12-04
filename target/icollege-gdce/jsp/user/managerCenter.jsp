<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"
	import="java.util.List,com.isscollege.gdce.domain.News"%>
<%@ include file="/jsp/header.jsp"%>
<script>
		$(function(){
			var pageNumber = '${pageShow}';
			if(pageNumber == null || pageNumber=="")
			{
				$('#myTab a:first').tab('show');	
			}
			else
			{
				if(pageNumber =="news")
				{
					$('#myTab a:last').tab('show');	
				}
				else
				{
					$('#myTab a:first').tab('show');
				}	
			}
		});
		
		function goNewsReview()
		{
			window.location.href("<%=context%>/review/newsReview");
		}
		
		function successReview(newsInfoId)
		{
			window.location.href("<%=context%>/review/newsAuditPass?id="+newsInfoId);
		}
		
		function failReview(newsInfoId)
		{
			window.location.href("<%=context%>/review/newsFailAuditPass?id="
						+ newsInfoId);
	}
</script>
<body>
	<%
		User user = null;
		user = (User) request.getSession().getAttribute("currentUser");
		if (user == null || user.getLevel() == 2 || user.getLevel() == 3 || user.getLevel() == 4)
		{
			response.sendRedirect(request.getContextPath());
			return;
		}
	%>

	<div class="container text-right" style="margin-bottom: 0">
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/login.jsp'>登录</a>" : currentUser%>&nbsp;&nbsp;
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/register.jsp'>注册</a>" : ""%>&nbsp;&nbsp;
		<a href="<%=context%>/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<h3 class="text-muted">
					<img alt="logo" src="<%=context%>/imgs/logo.png">
				</h3>
			</nav>
		</div>
	</div>

	<div class="box" align="center">
		<img alt="分割图" src="<%=context%>/imgs/banner004.png">
	</div>
	<br>
	<br>
	<div align="center" class="locationD">
		<h2>管理员中心</h2>
	</div>
	<br>
	<div class="container" style="display:none">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column">
						<div class="panel panel-default">
							<div class="panel-body" align="center">
								<a href="<%=context%>/review/productReview"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default btn-primary" type="button"
										onClick="showReport2()">审核</button></a>
							</div>
							<div class="panel-body" align="center" style="display:none" >
								<a href="<%=context%>/news/adminPageBean?type=hgzc&currentPage=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default" type="button" onClick="showReport2()">资讯管理</button></a>
							</div>
							<div class="panel-body" align="center">
								<%
									if (user.getLevel() == 0)
									{
								%>
								<a href="<%=context%>/jsp/user/superManager.jsp" target="_self">
									<button style="width: 90px; height: 40px"
										class="btn btn-default" type="button" onClick="showReport1()">二级管理员</button>
								</a>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<div class="col-md-10 column">test</div>
				</div>
			</div>
		</div>
	</div>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 208px">
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