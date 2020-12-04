
<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page
	import="com.isscollege.gdce.domain.WaybillInfo,com.isscollege.gdce.domain.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(function () {
	var perm=<%=permission%>;
	
	if(perm==2){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("productselect").removeAttribute("disabled");
	}
	
});
	function judge()
	{
		var pass=<%=permission.equals("2") ? 1 : 2%>
		if(pass==1)
			{
				window.location.href="<%=context%>/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}

	}
</script>
<body>
	<%
		User user = null;
		user = (User) request.getSession().getAttribute("currentUser");
		if (user == null)
		{
			response.sendRedirect(request.getContextPath() + "/jsp/user/login.jsp");
			return;
		}
	%>


	<div class="container text-right" style="margin-bottom: 0">
		<%=currentUser%>&nbsp;&nbsp; <a
			href="<%=context%>/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a href="<%=context%>">首页</a></li>
					<li role="presentation"><a
						href="">交易中心</a></li>
					<li role="presentation"><a
						href="<%=context%>/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a onClick="judge()"
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation" class="active"><a
						href="<%=context%>/register/doqualification">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="<%=context%>"><img alt="logo" src="<%=context%>/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>

	<div class="box" ; align="center">
		<img alt="分割图" src="<%=context%>/imgs/banner004.png";>
	</div>
	<div class="locationD" ; align="center">
		<h2>会员中心</h2>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column">
						<div class="panel panel-default">
							<div class="panel-body" align="center">
								<a href="<%=context%>/register/doqualification"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default" type="button" onClick="showReport2()">资质管理</button></a>
							</div>
							<div class="panel-body" align="center">
								<a href="<%=context%>/order/query?page=1" target="_self"><button
										style="width: 90px; height: 40px" class="btn btn-default"
										type="button" onClick="showReport2()">订单查询</button></a>
							</div>
							<div class="panel-body" align="center">
								<a href="<%=context%>/contract/querylist" target="_self"><button
										style="width: 90px; height: 40px" class="btn btn-default "
										type="button" onClick="showReport1()">合同查询</button></a>
							</div>
							<div class="panel-body" align="center">
								<a href="<%=context%>/jsp/product/managing.jsp" target="_self"><button
										style="width: 90px; height: 40px" class="btn btn-default " id="productselect"
									 disabled="true"	type="button" onClick="showReport1()">商品查询</button></a>
							</div>
							<div class="panel-body" align="center">
								<a href="<%=context%>/jsp/product/insertProduct.jsp" target="_self"><button
										style="width: 90px; height: 40px" class="btn btn-default " id="productsend"
									 disabled="true"	type="button" onClick="showReport1()">商品发布</button></a>
							</div>
							<div class="panel-body" align="center">
								<a href="<%=context%>/jsp/ad/management.jsp" target="_self"><button
										style="width: 90px; height: 40px" class="btn btn-default "
										type="button" onClick="showReport1()">广告中心</button></a>
							</div>
							<%
								String per = user.getPermission();
								if (per.indexOf('3') != -1)
								{
							%>
							<div class="panel-body" align="center">
								<a href="<%=context%>/logistics/query?state=0&page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default  btn-primary" type="button"
										onClick="showReport1()">物流中心</button></a>
							</div>
							<%
								}

								if (per.indexOf('1') != -1 || per.indexOf('2') != -1)
								{
							%>
							<div class="panel-body" align="center">
								<a href="<%=context%>/logistics/queryorder?page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default  btn-primary" type="button"
										onClick="showReport1()">物流查询</button></a>
							</div>
							<%
								}
							%>
						</div>
					</div>

					<div class="col-md-10 column">
						<div class="container">
							<div class="row clearfix">
								<div class="col-md-10 column">
									<h2>
										<span class="label label-primary">运单管理</span>
									</h2>
									<br>
									<div class="btn-toolbar" role="toolbar">

										<div class="btn-group">
											<a href="<%=context%>/logistics/query?page=1&state=0"><button
													type="button" class="btn btn-primary">待确认</button></a>

										</div>
										<div class="btn-group">
											<a
												href="<%=context%>/logistics/query?page=1&state=1&state1=2"><button
													type="button" class="btn btn-primary">配送中</button></a>

										</div>
										<div class="btn-group">
											<a href="<%=context%>/logistics/query?page=1&state=3"><button
													type="button" class="btn btn-primary">已完成</button></a>

										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 8px">
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
	</div>
	</div>
	</div>

</body>
</html>
