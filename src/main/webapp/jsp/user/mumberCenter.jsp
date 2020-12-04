<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User,
	com.isscollege.gdce.domain.Company"%>
<%@ include file="/jsp/header.jsp"%>
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
		var pass=<%=permission.equals("3") ? 1 : 2%>
		if(pass==1)
			{
				window.location.href="<%=context%>/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}

	} 
	function warring()
	{
		$('#modal-container-204152').modal();
	}
	function onclick1()
	{	
		var pass=<%=((Company)(request.getSession().getAttribute("company"))).getReviewState()==1 ? 1 : 2%>;
		if(pass==1)
			{
				window.location.href="<%=context%>/order/query?page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick2()
	{	
		var pass=<%=((Company)(request.getSession().getAttribute("company"))).getReviewState()==1 ? 1 : 2%>;
		if(pass==1)
			{
				window.location.href="<%=context%>/contract/querylist?a=1";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick3()
	{	
		var pass=<%=((Company)(request.getSession().getAttribute("company"))).getReviewState()==1 ? 1 : 2%>;
		if(pass==1)
			{
				window.location.href="<%=context%>/product/query";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick4()
	{	
		var pass=<%=((Company)(request.getSession().getAttribute("company"))).getReviewState()==1 ? 1 : 2%>;
		if(pass==1)
			{
				window.location.href="<%=context%>/jsp/product/payBond.jsp";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick5()
	{	
		var pass=<%=((Company)(request.getSession().getAttribute("company"))).getReviewState()==1 ? 1 : 2%>;
		if(pass==1)
			{
				window.location.href="<%=context%>/jsp/ad/management.jsp";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick6()
	{	
		var pass=<%=((Company)(request.getSession().getAttribute("company"))).getReviewState()==1 ? 1 : 2%>;
		if(pass==1)
			{
				window.location.href="<%=context%>/logistics/query?state=0&page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick7(companyId)
	{
		window.location.href="<%=context%>/register/doqualification?companyId=" + companyId;
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


	<div class="modal fade" id="modal-container-204152" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">该功能暂未开放,请等待审核结果</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
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
						href="" onClick="warring()">交易中心</a></li>
					<li role="presentation"><a
						href="<%=context%>/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation" class="active">
						<a class="btn btn-primary" onclick="onclick7('${company.getCompanyId()}')">会员中心</a>
					</li>
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
										class="btn btn-default btn-primary" type="button"
										onClick="showReport2()">资质管理</button></a>
							</div>
							<div class="panel-body" align="center">
								<button style="width: 90px; height: 40px" class="btn btn-default"
										type="button" onClick="onclick1()">订单查询</button>
							</div>
							
							<div class="panel-body" align="center">
								<button style="width: 90px; height: 40px" class="btn btn-default "
										type="button" onClick="onclick2()">合同查询</button>
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
								<button style="width: 90px; height: 40px" class="btn btn-default "
										type="button" onClick="onclick5()">广告中心</button>
							</div>
							
							<%
								String per = user.getPermission();
								if (per.indexOf('3') != -1) {
							%>
							<div class="panel-body" align="center">
								<button style="width: 90px; height: 40px"
								class="btn btn-default " type="button" onClick="onclick6()">物流中心</button>
							</div>
							<!-- <div class="panel-body" align="center">
								<a href="<%=context%>/logistics?=query&state=0&page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default " type="button" onClick="showReport1()">物流中心</button></a>
							</div> -->
							<%
								}

								if (per.indexOf('1') != -1 || per.indexOf('2') != -1) {
							%>
							<div class="panel-body" align="center">
									<a href="<%=context%>/logistics/queryorder?page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default " type="button" onClick="showReport1()">物流查询</button></a>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<div class="col-md-10 column">
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


</body>
</html>