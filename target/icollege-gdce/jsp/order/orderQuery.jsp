<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(function () {
	var perm = "${currentUser.permission}";
	if(perm==2){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("productselect").removeAttribute("disabled");
	}
	
});
	function judge()
	{
		var pass=${permission=="2"? 1 : 2};
		if(pass==1)
			{
				window.location.href="${context }/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}

	}
</script>
<body>
	<c:if test="${empty currentUser}">
		<c:redirect url="/jsp/user/login.jsp" ></c:redirect>
	</c:if>
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
		${currentUser.name }&nbsp;&nbsp; <a
			href="${context }/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials" style="padding: 30px 0px 30px">
					<li role="presentation"><a href="${context }">首页</a></li>
					<li role="presentation"><a
						href="">交易中心</a></li>
					<li role="presentation"><a
						href="${context }/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a onClick="judge()"
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation" class="active"><a
						href="${context }/register/doqualification">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="${context }"><img alt="logo" src="${context }/imgs/ZSKJlogo.png"></a>
				</h3>
			</nav>
		</div>
	</div>

	<div class="box" ; align="center">
        <img alt="分割图" src="${context }/imgs/banner004.png" style="width: 1140px;height: 160px">
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
					<button style="width: 90px; height: 40px" class="btn btn-default btn-primary"
							type="button" onClick="showReport1()">订单查询</button></a>
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
			</div>
			<div style="display: inline-block;height: auto;width:420px;float: right;position:relative;top: -9px;left: 40px;">
				<form role="form" style=" display: inline-block;"
					  action="${context }/order/queryAppointedOrder?page=1" method="post">
					<!-- 表单提交     -->
					<div class="from-group">
						<input type="text" class="form-control" id="orderNumber"  style="width: 220px;display: inline-block;"
							   name="orderId" placeholder="请输入订单号">
						<button class="btn btn-default" type="submit" style="width: 50px">查询</button>
					</div>
				</form>
				<form role="form" action="${context }/order/query?page=1" style="display: inline-block;" method="post">
					<button class="btn btn-default" type="submit" style="width: 100px">查询全部</button>
				</form>
			</div>
		</div>

		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
						<div style="margin-top: 30px; height: 340px">
							<table class="table" id="orderTable">
								<caption></caption>
								<thead>
									<tr class="info">
										<th>订单号</th>
										<th>创建时间</th>
										<th>交易金额</th>
										<th>订单状态</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${hasResult==true }">
											<c:forEach var="order" items="${orderList }" varStatus="loop">
												<tr>
													<td><a
														href="${context }/order/detail?orderId=${order.orderId }">${order.orderId }</a></td>
													<td>${order.createDate }</td>
													<td>${order.tradePrice }万元</td>
													<c:if test="${order.orderState==0}">
														<td>待付款</td>
													</c:if>
													<c:if test="${order.orderState==1}">
														<td>待发货</td>
													</c:if>
													<c:if test="${order.orderState==2}">
														<td>待收货</td>
													</c:if>
													<c:if test="${order.orderState==3}">
														<td>待验收</td>
													</c:if>
													<c:if test="${order.orderState==4}">
														<td>完成</td>
													</c:if>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr style="height: 50px">
												<td colspan="4" style="text-align: center"><br>没有查询结果</td>
											</tr>
										</c:otherwise>
									</c:choose>

								</tbody>
							</table>
						</div>
						<div style="text-align: center" id="paging">
							<ul class="pagination">
								<li><a
										href="${context}/order/query?page=1">首页</a></li>
								<li id="upli" type="button">
									<a id="up"
									   href="${context}/order/query?page=${page-1>1?page-1:1}">上一页</a></li>
								<c:forEach begin="1" end="${totalPages }" var="i" >
									<!-- 判断当前页 -->
									<c:if test="${page == i }">
										<li class="active"><a href="javascript:void(0);">${i}</a></li>
									</c:if>

									<c:if test="${page != i}">
										<li><a
												href="${context}/order/query?page=${i}">${i}</a></li>
									</c:if>

								</c:forEach>
								<li id="downli" type="button">
									<a id="down"
									   href="${context}/order/query?page=${page+1>totalPages ? totalPages:page+1}">下一页</a>
								</li>
								<li><a
										href="${context}/order/query?page=${totalPages}">尾页</a></li>
							</ul>
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
		<h5>
			<a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
			网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
	</div>
</body>
</html>