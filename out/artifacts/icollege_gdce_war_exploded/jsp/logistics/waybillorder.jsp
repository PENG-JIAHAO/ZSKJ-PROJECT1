<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="com.isscollege.gdce.domain.WaybillInfo,com.isscollege.gdce.domain.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${context}/js/user/regist.js"></script>
<c:set var="reviceState" value="0"></c:set>
<c:set var="companyObj" value="${sessionScope.company}"></c:set>
<c:set var="user1" value="${sessionScope.currentUser}"></c:set>
<c:if test="${not empty companyObj}">
	<c:set var="company" value="${companyObj}"></c:set>
	<c:set var="reviceState" value="${company.getReviewState()}"></c:set>
</c:if>
<script type="text/javascript">
	$(function () {
		var perm="${permission}";
		if(perm==2){
			document.getElementById("productsend").removeAttribute("disabled");
			document.getElementById("productselect").removeAttribute("disabled");
		}
		ban_atcion(${page},${totalPages});
	});
	//当特定条件下，不允许点击上下翻页功能
	function ban_atcion(page,tpage){

		if(page==1){

			$("#up").attr("href","javascript:void(0);");
			$("#upli").attr("class","btn disabled");
		}
		if(page==tpage){

			$("#down").attr("href","javascript:void(0);");
			$("#downli").attr("class","btn disabled");
		}
	}
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

</script>
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
			<div class="modal-body">您没有访问权限</div>
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
				<button style="width: 90px; height: 40px" class="btn btn-default "
						type="button" onClick="onclick5()">广告中心</button>
			</div>

			<c:set var="per" value="${user.getPermission()}"></c:set>
			<c:if test="${per.indexOf('3') != -1}">
				<div class="panel-body"  style="display: inline-block">
					<button style="width: 90px; height: 40px"
							class="btn btn-default btn-primary " type="button" onClick="onclick6()">物流中心</button>
				</div>
			</c:if>
			<c:if test="${per.indexOf('1') != -1 || per.indexOf('2') != -1}">
				<div class="panel-body" style="display: inline-block">
						<%--							 <a href="${context}/logistics/queryorder?page=1"--%>
						<%--									target="_self">--%>
					<button style="width: 90px; height: 40px"
							class="btn btn-default btn-primary" type="button" onclick="onclick7()" >物流查询</button>
						<%--	</a>--%>
				</div>
			</c:if>
						</div>
					</div>

					<div class="col-md-12 column" style="margin-left: -30px;">
						<div class="container">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<h2>
										<span class="label label-primary">订单信息</span>
									</h2>
									<table class="table table-hover">
										<thead>
											<tr class="info">
												<th>序号</th>
												<th>订单号</th>
												<th>交易金额</th>
												<th>创建时间</th>
												<th>结束时间</th>
												<th>订单状态</th>
												<th>操作</th>
											</tr>
										</thead>

										<tbody>
											<c:choose>
												<c:when test="${hasResult==true }">
													<c:forEach var="orderInfo" items="${orderList }"
														varStatus="loop">
														<tr style="height: 40px">
															<td>${loop.index+1}</td>
															<td>${orderInfo.orderId }</td>
															<td>${orderInfo.tradePrice }</td>
															<td>${orderInfo.createDate}</td>
															<td>${orderInfo.endDate}</td>
															<c:set var="i" value="${i+1}"></c:set>
															<td>${orderStateArray[i-1]}</td>
															<td><a
																href="${context}/logistics/follow?orderId=${orderInfo.orderId}&&waybillId=${waybillId}">
																	<button class="btn btn-primary btn-xs">查看物流</button>
															</a></td>

														</tr>
													</c:forEach>
													<c:forEach begin="${orderList.size() }" end="8"
														varStatus="loop">
														<tr style="height: 40px">
															<td colspan="8"></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="8"  style="text-align: center;padding:100px"><br>无</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>

									</table>

									<div style="text-align: center" id="paging">
										<ul class="pagination">
											<li><a
											 href="${context}/logistics/queryorder?page=1">首页</a></li>
											<li id="upli" type="button"><a id="up"
												href="${context}/logistics/queryorder?page=${page-1>1?page-1:1}">上一页</a></li>
											<c:forEach begin="1" end="${totalPages }" var="i" varStatus="loop">
												<!-- 判断当前页 -->
												<c:if test="${page == i }">
													<li class="active"><a href="javascript:void(0);">${i}</a></li>
												</c:if>

												<c:if test="${page != i}">
													<li><a
															href="${context}/logistics/queryorder?page=${i}">${i}</a></li>
												</c:if>

											</c:forEach>
											<li id="downli" type="button"><a id="down"
												href="${context}/logistics/queryorder?page=${page+1>totalPages ? totalPages:page+1}">下一页</a>
											</li>
											<li><a
											href="${context}/logistics/queryorder?page=${totalPages}">尾页</a></li>
										</ul>
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
