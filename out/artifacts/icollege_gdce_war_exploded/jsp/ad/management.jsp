<%@page import="org.apache.commons.lang3.ObjectUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="com.isscollege.gdce.domain.Advertisement"%>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${context}/js/user/regist.js"></script>
<c:set var="reviceState" value="0"></c:set>
<c:set var="companyObj" value="${sessionScope.company}"></c:set>
<c:set var="user1" value="${sessionScope.currentUser}"></c:set>
<c:if test="${not empty companyObj}">
	<c:set var="company" value="${companyObj}"></c:set>
	<c:set var="reviceState" value="${company.getReviewState()}"></c:set>
</c:if>
<script type="text/javascript">
	function goAdvertisementReview(reviewState)
	{
		window.location.href="${context}/ads/queryAdvertisement?reviewState="+ reviewState;
	}
	$(function () {
		let pageState = window.location.search;
		let pageStateString = pageState.substring(1);
		let pageStateArray= pageStateString.split("=");
		if(pageStateArray[0]=='id'|| pageStateString == ''){
			window.location.href="${context}/ads/queryAdvertisement?reviewState=0";
		}
		if(pageStateArray[1]==0 || pageStateString == ''){
			$("#waitReview").addClass("active");
			$("#alreadyReview").removeClass("active");
			$("#noPassReview").removeClass("active");
			$("#cancelReview").removeClass("active");
			$("#unreviewAds").css("display","block");
			$("#reviewedAds").css("display","none");
			$("#havereviewedAds").css("display","none");
			$("#havereviewedAdsnotpass").css("display","none");
		}
		if(pageStateArray[1]==1){
			$("#alreadyReview").addClass("active");
			$("#waitReview").removeClass("active");
			$("#noPassReview").removeClass("active");
			$("#cancelReview").removeClass("active");
			$("#unreviewAds").css("display","none");
			$("#reviewedAds").css("display","block");
			$("#havereviewedAds").css("display","none");
			$("#havereviewedAdsnotpass").css("display","none");
		}
		if(pageStateArray[1]==2){
			$("#noPassReview").addClass("active");
			$("#waitReview").removeClass("active");
			$("#alreadyReview").removeClass("active");
			$("#cancelReview").removeClass("active");
			$("#unreviewAds").css("display","none");
			$("#reviewedAds").css("display","none");
			$("#havereviewedAds").css("display","block");
			$("#havereviewedAdsnotpass").css("display","none");
		}
		if(pageStateArray[1]==3){
			$("#cancelReview").addClass("active");
			$("#waitReview").removeClass("active");
			$("#alreadyReview").removeClass("active");
			$("#noPassReview").removeClass("active");
			$("#unreviewAds").css("display","none");
			$("#reviewedAds").css("display","none");
			$("#havereviewedAds").css("display","none");
			$("#havereviewedAdsnotpass").css("display","block");
		}
	});
	$(function() {
		var unreviewAdvertisements = '${unreviewAdvertisements}';
		var reviewedAds = '${reviewedAdvertisements}';
		var havereviewedAds='${havereviewedAdvertisements}';
		var havereviewedAdsnotpass='${havereviewedAdvertisementsnotpass}'
		// if (unreviewAdvertisements == null || unreviewAdvertisements == "") {
		// 	$('#unreviewAds').collapse('hide');
		// } else {
		// 	$('#unreviewAds').collapse('show');
		// }
		// if (reviewedAds == null || reviewedAds == "") {
		// 	$('#reviewedAds').collapse('hide');
		// } else {
		// 	$('#reviewedAds').collapse('show');
		// }
		// if (havereviewedAds == null || havereviewedAds == "") {
		// 	$('#havereviewedAds').collapse('hide');
		// } else {
		// 	$('#havereviewedAds').collapse('show');
		// }
		// if (havereviewedAdsnotpass == null || havereviewedAdsnotpass == "") {
		// 	$('#havereviewedAdsnotpass').collapse('hide');
		// } else {
		// 	$('#havereviewedAdsnotpass').collapse('show');
		// }
	});

	$(function () {
		var perm="${permission}";
		if(perm==2){
			document.getElementById("productsend").removeAttribute("disabled");
			document.getElementById("productselect").removeAttribute("disabled");
		}

	});
	function judge()
	{
		var pass="${permission == 2 ? 1 : 2}";
		if(pass==1)
		{
			window.location.href= "${context}/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}

	}
	function message(){

		$('#modal-container-404').modal();
	}
	function onclick1()
	{

		var pass=${reviceState};
		if(pass==1)
		{
			window.location.href="${context}/order/query?page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick2()
	{
		var pass="${reviceState}";
		if(pass==1)
		{
			window.location.href="${context}/contract/querylist?a=1";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick3()
	{
		var pass="${reviceState}";
		if(pass==1)
		{
			window.location.href="${context}/product/query";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick4()
	{
		var pass="${reviceState}";
		var perm="${reviceState}";

		if(perm==1){
			document.getElementById("productsend").removeAttribute("disabled");

		}


		if(pass==1)
		{  <!--   商品发布页面insertProduct.jsp-->
			window.location.href="${context}/jsp/product/insertProduct.jsp";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick5()
	{
		var pass="${reviceState}";
		if(pass==1)
		{
			window.location.href="${context}/ads/queryAdvertisement?reviewState=0";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick6()
	{
		var pass="${reviceState}";
		if(pass==1)
		{
			window.location.href="${context}/logistics/query?state=0&page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function onclick7()
	{
		var pass="${reviceState}";
		if(pass==1)
		{
			window.location.href="${context}/logistics/queryorder?page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	}
	function warring()
	{
		$('#modal-container-204153').modal();
	}
	function update() {
		var advertisement=document.getElementById("table table-hover");
	}
</script>
<script src="${context}/js/jquery/jq.js"></script>
<script src="${context}/js/jquery/imgViewer.js"></script>

<script>
	$.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
</script>
<style type="text/css">
	.table {
		text-align: center;
	}
	.table th {
		text-align: center;
	}
	.viewer-item:hover{
		opacity: 0.5;
	}
</style>
<body>
<div class="modal fade" id="modal-container-204153" role="dialog"
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
<c:set var="user" value="${sessionScope.currentUser}"></c:set>
<c:if test="${empty user}">
	<c:redirect url="/jsp/user/login.jsp"></c:redirect>
</c:if>
<c:set var="permission" value="${user.getPermission()}"></c:set>
<c:set var="companyType" ></c:set>
<c:choose>
	<c:when test="${permission == 1}">
		<c:set var="companyType" value="采购方"></c:set>
	</c:when>
	<c:when test="${permission == 2}">
		<c:set var="companyType" value="供应商"></c:set>
	</c:when>
	<c:when test="${permission == 3}">
		<c:set var="companyType" value="物流"></c:set>
	</c:when>
</c:choose>


<div class="modal fade" id="modal-container-404" role="dialog"
	 aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">审核建议</h4>
			</div>
			<div class="modal-body">
				<c:if test="${not empty company.getReviewAdvice()}">
					审核建议：第一次审核通过<br/>
					第二次审核建议：
					<div style="color:red">${company.getReviewAdvice()}</div>
				</c:if>
				<c:if test="${empty company.getReviewAdvice()}">
					审核建议: 无
				</c:if>
			</div>
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
			<div class="modal-body">您没有权限访问</div>
			<div class="modal-footer">
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<div class="container text-right" style="margin-bottom: 0">
	${currentUser.name}&nbsp;&nbsp; <a href="${context}/login/logout">退出</a>
</div>
<div class="container">
	<div class="header clearfix" >
		<nav class="navbar" >
			<ul class="nav nav-pills pull-right socials" style="padding: 30px 0px 30px">
				<li role="presentation"><a href="${context}">首页</a></li>
				<li role="presentation"><a
						href="#" onClick="warring()">交易中心</a></li>
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
				<button style="width: 90px; height: 40px" class="btn btn-default"
						type="button" onClick="onclick1()">订单查询</button>
			</div>
			<div class="panel-body" style="display: inline-block">
				<button style="width: 90px; height: 40px" class="btn btn-default "
						type="button" onClick="onclick2()">合同查询</button>
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
				<button style="width: 90px; height: 40px" class="btn btn-default btn-primary "
						type="button" onClick="onclick5()">广告中心</button>
			</div>

			<c:set var="per" value="${user.getPermission()}"></c:set>
			<c:if test="${per.indexOf('3') != -1}">
				<div class="panel-body"  style="display: inline-block">
					<button style="width: 90px; height: 40px"
							class="btn btn-default " type="button" onClick="onclick6()">物流中心</button>
				</div>
			</c:if>
			<c:if test="${per.indexOf('1') != -1 || per.indexOf('2') != -1}">
				<div class="panel-body" style="display: inline-block">
						<%--							 <a href="${context}/logistics/queryorder?page=1"--%>
						<%--									target="_self">--%>
					<button style="width: 90px; height: 40px"
							class="btn btn-default " type="button" onclick="onclick7()" >物流查询</button>
						<%--	</a>--%>
				</div>
			</c:if>
		</div>
	</div>

	<ul id="myTab" class="nav nav-pills">
		<li id="waitReview" class="active" ><a href="#unreviewAds" data-toggle="tab" onclick="goAdvertisementReview(0)">待审核</a></li>
		<li id="alreadyReview"><a href="#reviewedAds" data-toggle="tab" onclick="goAdvertisementReview(1)">已审核</a></li>
		<li id="noPassReview"><a href="#havereviewedAds" data-toggle="tab" onclick="goAdvertisementReview(2)">未通过</a></li>
		<li id="cancelReview"><a href="#havereviewedAdsnotpass" data-toggle="tab" onclick="goAdvertisementReview(3)">已撤回</a></li>
		<li ><a href="${context}/jsp/ad/ad.jsp?companyid=${currentUser.companyId}">新增</a></li>
	</ul>
	<hr>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="unreviewAds" style="display: none;">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column" style="margin-left:-15px">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
								<tr>
									<th>企业机构代码</th>
									<th>投放时间</th>
									<th>广告内容</th>
									<th>位置</th>
									<th>广告费用</th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${unreviewAdvertisements!=null}">
									<c:set var="i" value="${15 }"/>
									<c:set var="style" value=""/>
									<c:forEach var="advertisement" items="${unreviewAdvertisements}">
										<c:if test="${advertisement.companyId==company.companyId}">
											<c:set var="temp" value="${i%5}"/>
											<c:set var="i" value="${i-1}"/>
											<c:choose>
												<c:when test="${temp==0}">
													<c:set var="style" value="success"/>
												</c:when>
												<c:when test="${temp==1}">
													<c:set var="style" value="error"/>
												</c:when>
												<c:when test="${temp==2}">
													<c:set var="style" value="warning"/>
												</c:when>
												<c:when test="${temp==3}">
													<c:set var="style" value="info"/>
												</c:when>
												<c:when test="${temp==4}">
													<c:set var="style" value="active"/>
												</c:when>
											</c:choose>
											<tr class="${style}">
												<td>${advertisement.companyId}</td>
												<td>${advertisement.endDate}</td>
												<td>
													<img class="viewer-item" style="width: 50px;height: 50px;cursor: pointer;"
														 src="${context}/ads/loadQualificationpicture?path=${ObjectUtils.defaultIfNull(advertisement.getAdsImgPath() ,'')}"/>
												</td>
												<td>
													<c:if test="${advertisement.position==1}">
														一号位
													</c:if>
													<c:if test="${advertisement.position==2}">
														二号位
													</c:if>
													<c:if test="${advertisement.position==3}">
														三号位
													</c:if>
													<c:if test="${advertisement.position==4}">
														四号位
													</c:if>
												</td>
												<td>${advertisement.price}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade in active" id="reviewedAds"  style="display: none;">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column" style="margin-left:-15px">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
								<tr>
									<th>企业机构代码</th>
									<th>投放时间</th>
									<th>广告内容</th>
									<th>位置</th>
									<th>广告费用</th>
									<th>支付操作</th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${reviewedAdvertisements!=null}">
									<c:set var="i" value="${15 }"/>
									<c:set var="style" value=""/>
									<c:forEach var="advertisement" items="${reviewedAdvertisements}">
										<c:if test="${advertisement.companyId==company.companyId}">
											<c:set var="temp" value="${i%5}"/>
											<c:set var="i" value="${i-1}"/>
											<c:choose>
												<c:when test="${temp==0}">
													<c:set var="style" value="success"/>
												</c:when>
												<c:when test="${temp==1}">
													<c:set var="style" value="error"/>
												</c:when>
												<c:when test="${temp==2}">
													<c:set var="style" value="warning"/>
												</c:when>
												<c:when test="${temp==3}">
													<c:set var="style" value="info"/>
												</c:when>
												<c:when test="${temp==4}">
													<c:set var="style" value="active"/>
												</c:when>
											</c:choose>
											<tr class="${style}">
												<td>${advertisement.companyId}</td>
												<td>${advertisement.endDate}</td>
												<td>
													<img class="viewer-item" style="width: 50px;height: 50px;cursor: pointer;"
														 src="${context}/ads/loadQualificationpicture?path=${ObjectUtils.defaultIfNull(advertisement.getAdsImgPath() ,'')}"/>
												</td>
												<td>
													<c:if test="${advertisement.position==1}">
														一号位
													</c:if>
													<c:if test="${advertisement.position==2}">
														二号位
													</c:if>
													<c:if test="${advertisement.position==3}">
														三号位
													</c:if>
													<c:if test="${advertisement.position==4}">
														四号位
													</c:if>
												</td>
												<td>${advertisement.price}</td>
												<td bordercolor="#CCCCCC">
													<div>
														<div align="center">
															<button type="button" class="btn btn-default" data-toggle="modal" data-target="#sureModal"
																	onclick=" ">确认支付</button>
															<button type="button" class="btn btn-default" data-toggle="modal" data-target="#cancelModal"
																	onclick=" ">取消订单</button>
														</div>
														<!-- 确定支付的模态框（Modal） -->
														<div class="modal fade" id="sureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																			&times;
																		</button>
																	</div>
																	<div class="modal-body">
																		此功能暂未开发，敬请期待~
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default" data-dismiss="modal">关闭
																		</button>
																	</div>
																</div><!-- /.modal-content -->
															</div><!-- /.modal -->
														</div>
														<!-- 取消订单的模态框（Modal） -->
														<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																			&times;
																		</button>
																	</div>
																	<div class="modal-body">
																		此功能暂未开发，敬请期待~
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default" data-dismiss="modal">关闭
																		</button>
																	</div>
																</div><!-- /.modal-content -->
															</div><!-- /.modal -->
														</div>
													</div>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade in active" id="havereviewedAds"  style="display: none;">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column" style="margin-left:-15px">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
								<tr>
									<th>企业机构代码</th>
									<th>投放时间</th>
									<th>广告内容</th>
									<th>位置</th>
									<th>广告费用</th>
									<th>二次修改</th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${havereviewedAdvertisements!=null}">
									<c:set var="i" value="${15 }"/>
									<c:set var="style" value=""/>
									<c:forEach var="advertisement" items="${havereviewedAdvertisements}">
										<c:if test="${advertisement.companyId==company.companyId}">
											<c:set var="temp" value="${i%5}"/>
											<c:set var="i" value="${i-1}"/>
											<c:choose>
												<c:when test="${temp==0}">
													<c:set var="style" value="success"/>
												</c:when>
												<c:when test="${temp==1}">
													<c:set var="style" value="error"/>
												</c:when>
												<c:when test="${temp==2}">
													<c:set var="style" value="warning"/>
												</c:when>
												<c:when test="${temp==3}">
													<c:set var="style" value="info"/>
												</c:when>
												<c:when test="${temp==4}">
													<c:set var="style" value="active"/>
												</c:when>
											</c:choose>
											<tr class="${style}">
												<td>${advertisement.companyId}</td>
												<td>${advertisement.endDate}</td>
												<td>
													<img class="viewer-item" style="width: 50px;height: 50px;cursor: pointer;"
														 src="${context}/ads/loadQualificationpicture?path=${ObjectUtils.defaultIfNull(advertisement.getAdsImgPath() ,'')}"/>
												</td>
												<td>
													<c:if test="${advertisement.position==1}">
														一号位
													</c:if>
													<c:if test="${advertisement.position==2}">
														二号位
													</c:if>
													<c:if test="${advertisement.position==3}">
														三号位
													</c:if>
													<c:if test="${advertisement.position==4}">
														四号位
													</c:if>
												</td>
												<td>${advertisement.price}</td>
												<td bordercolor="#CCCCCC">
													<div>
														<div align="center">
															<button type="button" class="btn btn-default"
																	onclick=""><a href="${context}/ads/adUpdate?advertisement=${advertisement.id}">修改</a></button>
														</div>
													</div>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade in active" id="havereviewedAdsnotpass"  style="display: none;">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column" style="margin-left:-15px">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
								<tr>
									<th>企业机构代码</th>
									<th>投放时间</th>
									<th>广告内容</th>
									<th>位置</th>
									<th>广告费用</th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${havereviewedAdvertisementsnotpass!=null}">
									<c:set var="i" value="${15 }"/>
									<c:set var="style" value=""/>
									<c:forEach var="advertisement" items="${havereviewedAdvertisementsnotpass}">
										<c:if test="${advertisement.companyId==company.companyId}">
											<c:set var="temp" value="${i%5}"/>
											<c:set var="i" value="${i-1}"/>
											<c:choose>
												<c:when test="${temp==0}">
													<c:set var="style" value="success"/>
												</c:when>
												<c:when test="${temp==1}">
													<c:set var="style" value="error"/>
												</c:when>
												<c:when test="${temp==2}">
													<c:set var="style" value="warning"/>
												</c:when>
												<c:when test="${temp==3}">
													<c:set var="style" value="info"/>
												</c:when>
												<c:when test="${temp==4}">
													<c:set var="style" value="active"/>
												</c:when>
											</c:choose>
											<tr class="${style}">
												<td>${advertisement.companyId}</td>
												<td>${advertisement.endDate}</td>
												<td>
													<img class="viewer-item" style="width: 50px;height: 50px;cursor: pointer;"
														 src="${context}/ads/loadQualificationpicture?path=${ObjectUtils.defaultIfNull(advertisement.getAdsImgPath() ,'')}"/>
												</td>
												<td>
													<c:if test="${advertisement.position==1}">
														一号位
													</c:if>
													<c:if test="${advertisement.position==2}">
														二号位
													</c:if>
													<c:if test="${advertisement.position==3}">
														三号位
													</c:if>
													<c:if test="${advertisement.position==4}">
														四号位
													</c:if>
												</td>
												<td>${advertisement.price}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>

</div>
</div>
</div>
</div>
</div>



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