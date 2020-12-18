<%@ page pageEncoding="UTF-8"
	import="java.util.*,com.isscollege.gdce.domain.Product"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function judge()
	{
		var pass=<%=(permission.equals("2")) ? 1 : 2%>
		
		if(pass==1)
			{
				window.location.href="${context}/report/index";
		} else {
			$('#modal-container-204152').modal();
		}

	}
	function judge1()
	{
		var pass=<%=(permission.equals("3")||permission.equals("2")||permission.equals("4")) ? 1 : 2%>
		if(pass==1)
			{
				window.location.href="${context}/register/doqualification";
		} else {
			$('#modal-container-204152').modal();
		}

	}
	function warring()
	{
		$('#modal-container-204155').modal();
	}
</script>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<style>
.table tbody
 {
	display: table;
	height: 300px;
	overflow-y: auto;
	text-align: center;
}

.table thead, tbody tr 
{
	display: table;
	width: 100%;
	table-layout: fixed;
}

.table thead
 {
	 width: cacl(100% -1em); 
}
.table thead th 
{
	text-align: center;
	background: #ccc;
}
.pagination-detail{
	display: none;
}
</style>
</head>

<body>
<div class="modal fade" id="modal-container-204155" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">该功能暂未开放</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="modal-container-204152" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">请登录再访问，或您没有访问权限</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-right" style="margin-bottom: 0">
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/login.jsp'>登录</a>" : currentUser%>&nbsp;&nbsp;
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/register.jsp'>注册</a>" : ""%>&nbsp;&nbsp;
		<%=currentUser.equals("") ? "" : "<a href='" + context + "/login/logout'>退出</a>" %>&nbsp;&nbsp;
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation" class="active"><a href="<%=context%>">首页</a></li>
					<li role="presentation"><a
						href="<%=request.getContextPath()%>/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a>
					</li>
					<li role="presentation">
						<a href="${context}/register/doqualification">会员中心</a>
					</li>
				</ul>
				<h3 class="text-muted">
					<a href="${context}"><img alt="logo" src="${context }/imgs/ZSKJlogo.png"></a>
				</h3>
			</nav>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="carousel slide" id="carousel-536799">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-536799"></li>
						<li data-slide-to="1" data-target="#carousel-536799"></li>
						<li data-slide-to="2" data-target="#carousel-536799"
							class="active"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item">
							<img alt="" src="${context }/imgs/1.jpg" />
							<div class="carousel-caption">
								<h4>统一平台、集中管制</h4>
							</div>
						</div>
						<div class="item">
							<img alt="" src="${context}/imgs/2.png" />
							<div class="carousel-caption">
								<h4>阳光采购、竞价交易</h4>
							</div>
						</div>
						<div class="item active">
							<img alt="" src="${context}/imgs/3.png" />
							<div class="carousel-caption">
								<h4>智能管理，公正验收</h4>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-536799"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-536799"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
	</div>

<%--	<div class="cont" style="margin:30px auto; width:100%" >
		<div id="advertisement" style="border-collapse: collapse;
				border: 0px solid gray; width:1140px; margin:auto;">

			<div class="adver" style="border-collapse: collapse;
				border: 0px solid gray; border-right-width: 1px; float: left; width:33%">
			<a href="#"><img src="${context}/imgs/ad/001.PNG" alt="picture" /></a>
			</div>

			<div class="adver" style="border-collapse: collapse;
				border: 0px solid gray; border-right-width: 1px; float: left; width:33%">
				<a href="#"><img src="${context}/imgs/ad/002.PNG" alt="picture" /></a>
			</div>

			<div class="adver" style="border-collapse: collapse;
				border: 0px solid gray; border-right-width: 1px; float: left; width:33%">
				<a href="#"><img src="${context}/imgs/ad/003.PNG" alt="picture" /></a>
			</div><br>
		</div><br>
	</div><br>--%>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>
		<h5>
			<a href="" onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
			<网站版权归中国国电集团公></网站版权归中国国电集团公>司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
		</p>
	</div>
</body>
</html>