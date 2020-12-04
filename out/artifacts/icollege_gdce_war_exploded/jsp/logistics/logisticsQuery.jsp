<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="com.isscollege.gdce.domain.LogisticsInfo"%>
<%@page import="com.isscollege.gdce.domain.Product,com.isscollege.gdce.domain.User"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(function () {
	var perm=${currentUser.permission};
	if(perm==2){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("productselect").removeAttribute("disabled");
	}
	if(perm!=1){
		document.getElementById("confirm").remove();
		document.getElementById("qianshou").innerHTML="";
	}

});
	function judge()
	{
		var pass=${permission.equals("2") ? 1 : 2}
		if(pass==1)
			{
				window.location.href="${context}/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}

	}
</script>
<body>
    <c:if test="${empty currentUser}">
       <c:redirect url="/jsp/user/login.jsp"></c:redirect>
    </c:if>
	<div class="container text-right" style="margin-bottom: 0">
		${currentUser.name}&nbsp;&nbsp; <a href="${context}/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a href="${context}">首页</a></li>
					<li role="presentation"><a
						href="">交易中心</a></li>
					<li role="presentation"><a
						href="${context}/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a onClick="judge()"
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation" class="active"><a
						href="${context}/register/doqualification">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="${context}"><img alt="logo" src="${context}/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>

	<div class="box"  align="center">
		<img alt="分割图" src="${context}/imgs/banner004.png"; style="width: 1140px;height: 160px">
	</div>
	<div class="container">
		<div class="row clearfix" >
			<div class="col-md-12 column" style="margin: 20px 0px 20px -15px">
				<div class="panel-body" style="display: inline-block;">
					<a href="${context}/register/doqualification" target="_self">
						<button style="width: 90px; height: 40px"
								class="btn btn-default " type="button"
								onClick="showReport2()">资质管理</button>
					</a>
				</div>

				<div class="panel-body" style="display: inline-block">
					<a href="${context }/order/query?page=1" target="_self">
						<button style="width: 90px; height: 40px" class="btn btn-default"
								type="button" onClick="showReport1()">订单查询</button></a>
				</div>

				<div class="panel-body" style="display: inline-block">
					<a href="${context }/contract/querylist?a=1" target="_self">
						<button style="width: 90px; height: 40px" class="btn btn-default "
								type="button" onClick="showReport1()">合同查询</button></a>
				</div>

				<div class="panel-body" style="display: inline-block">
					<a href="${context}/getuserproduct" target="_self"><button
							style="width: 90px; height: 40px" class="btn btn-default " id="productselect"
							disabled="true"	type="button" onClick="showReport1()">商品查询</button></a>
				</div>
				<div class="panel-body" style="display: inline-block">
					<a href="${context}/jsp/product/insertProduct.jsp" target="_self"><button
							style="width: 90px; height: 40px" class="btn btn-default " id="productsend"
							disabled="true"	type="button" onClick="showReport1()">商品发布</button></a>
				</div>


				<div class="panel-body" style="display: inline-block">
					<a href="${context }/jsp/ad/management.jsp" target="_self">
						<button style="width: 90px; height: 40px" class="btn btn-default "
								type="button" onClick="showReport1()">广告中心</button></a>
				</div>

				<c:set var="per" value="${user.getPermission()}"></c:set>
				<c:if test="${per.indexOf('3') != -1}">
					<div class="panel-body"  style="display: inline-block">
						<a href="${context }/logistics/query?state=0&page=1"target="_self">
							<button style="width: 90px; height: 40px"
									class="btn btn-default btn-primary " type="button" onClick="showReport1()">物流中心</button></a>
					</div>
				</c:if>
				<c:if test="${per.indexOf('1') != -1 || per.indexOf('2') != -1}">
					<div class="panel-body" style="display: inline-block">
						<a href="${context }/logistics/queryorder?page=1" target="_self">
								<%--							 <a href="${context}/logistics/queryorder?page=1"--%>
								<%--									target="_self">--%>
							<button style="width: 90px; height: 40px"
									class="btn btn-default " type="button" onclick="showReport1()" >物流查询</button></a>
							<%--	</a>--%>
					</div>
				</c:if>
			</div>
		</div>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-10 column">
							<div class="span12 container">
								<div class="row clearfix">
									<div class="col-md-10 column">
										<h2>
											<span class="label label-primary">运单信息</span>
										</h2>
										<table class="table table-hover">
											<thead>
											<tr class="info">
												<th style="text-align: center;" class="col-md-2 column">运单号</th>
												<th style="text-align: center;" class="col-md-2 column">物流公司</th>
												<th style="text-align: center;" class="col-md-1 column">煤种</th>
												<th style="text-align: center;" class="col-md-1 column">数量</th>
												<th style="text-align: center;" class="col-md-2 column">价格</th>
												<th style="text-align: center;" class="col-md-2 column">当前运单状态</th>
												<th id="qianshou" class="col-md-2 column" style="text-align: center;">是否签收</th>
											</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${test2 eq null }">
													<tr>
														<td colspan="6" style="text-align: center"><br>无</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td style="text-align: center;">${waybillId }</td>
														<td style="text-align: center;">${companyName }</td>
														<td style="text-align: center;"></td>
														<td style="text-align: center;">${product.getQuantity()} 万吨</td>
														<td style="text-align: center;">${product.getQuantity() } 元/吨</td>
														<td style="text-align: center;">${waybillState }</td>
														<c:choose>
															<c:when test="${waybillState eq '已签收' }">
																<td style="text-align: center;"><a
																		href="${context}/logistics/updateWaybillState?page=1
												&waybillId=${waybillId}&orderId=${orderId}">
																	<button id="confirm" disabled="disabled" class="btn btn-primary btn-xs">确认签收</button>
																</a></td>
															</c:when>
															<c:otherwise>
																<td style="text-align: center;"><a
																		href="${context}/logistics/updateWaybillState?page=1
												&waybillId=${waybillId}&orderId=${orderId}">
																	<button id="confirm" class="btn btn-primary btn-xs">确认签收</button>
																</a></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:otherwise>
											</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<div class="span12 container">
								<div class="row clearfix">
									<div class="col-md-10 column">
										<h2>
											<span class="label label-primary">物流信息</span>
										</h2>
										<table class="table table-hover">
											<thead>
											<tr class="info">
												<th class="col-md-2 column">时间</th>
												<th class="col-md-2 column">提交人</th>
												<th class="col-md-2 column">到达地点</th>
												<th class="col-md-2 column">备注内容</th>
											</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${test1 eq null }">
													<tr>
														<td colspan="4" style="text-align: center"><br>无</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${logisticsinfo }" var="logisticsinfo">
														<tr>
															<td>${ logisticsinfo.getUpdateDate()}</td>
															<td>${ logisticsinfo.getSubmitUser()}</td>
															<td>${ logisticsinfo.getLocation()}</td>
															<td>${ logisticsinfo.getContent()}</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="span12 container col-md-11">
							</div>
							<div class="span12 container col-md-1">
								<a class="btn btn-primary btn-large"
								   href="javascript:history.back(-1)"> 返回 </a>
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
</body>
</html>