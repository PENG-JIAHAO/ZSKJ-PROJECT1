
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
	<%
		int i = 0;
		String[] orderStateArray = (String[]) request.getAttribute("orderStateArray");
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
															<td><%=orderStateArray[i]%></td>
															<%
																i++;
															%>

															<td><a
																href="<%=context %>/logistics/follow?orderId=${orderInfo.orderId }">
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

									<div class="pull-right" style="text-align: center" id="paging">
										<ul class="pagination">
											<li><a>当前是第<span>${page}</span>页.</a></li>
											<li><a
												href="<%=context%>/logistics/queryorder?page=${page-1>1?page-1:1}">&laquo;</a></li>
											<c:forEach begin="1" end="${totalPages}" varStatus="loop">
												<li><a
													href="<%=context%>/logistics/queryorder?page=${loop.index}">${loop.index}</a>
												</li>
											</c:forEach>
											<li><a
												href="<%=context%>/logistics/queryorder?page=${page+1>totalPages ? totalPages:page+1}">&raquo;</a>
											</li>
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
