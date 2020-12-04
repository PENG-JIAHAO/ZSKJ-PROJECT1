
<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="com.isscollege.gdce.domain.WaybillInfo"%>
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

		ArrayList<WaybillInfo> list = (ArrayList) request.getAttribute("waybillList");
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
				<div class="modal-body">您没有访问权限</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-right" style="margin-bottom: 0">
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/login.jsp'>登录</a>" : currentUser%>&nbsp;&nbsp;
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/register.jsp'>注册</a>" : ""%>&nbsp;&nbsp;
		<a href="<%=context%>/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a href="<%=context%>">首页</a></li>
					<li role="presentation"><a href="">交易中心</a></li>
					<li role="presentation"><a href="../news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
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
		<h2>物流中心</h2>
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
								<a href="<%=context%>/logistics/=query?state=0&page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default btn-primary" type="button"
										onClick="showReport1()">物流中心</button></a>
							</div>
							<%
								}

								if (per.indexOf('1') != -1 || per.indexOf('1') != -1)
								{
							%>
							<div class="panel-body" align="center">
								<a href="<%=context%>/logistics/queryorder?page=1"
									target="_self"><button style="width: 90px; height: 40px"
										class="btn btn-default btn-primary" type="button"
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
										<span class="label label-primary">运单信息</span>
									</h2>
									<div>
										<ul class="nav nav-tabs">
											<li id="tab1" onclick="myclick(1)"><a
												href="<%=context%>/logistics/query?page=1&state=0">待确认</a></li>
											<li id="tab1" class="active" onclick="myclick(2)"><a
												href="<%=context%>/logistics/query?page=1&state=1&state1=2">配送中</a></li>
											<li id="tab1" onclick="myclick(3)"><a
												href="<%=context%>/logistics/query?page=1&state=3">已完成</a></li>
										</ul>
									</div>
									<table class="table table-hover">
										<thead>
											<tr class="info">
												<th>序号</th>
												<th>运单号</th>
												<!-- <th>企业机构代码</th> -->
												<th>创建时间</th>
												<th>结束时间</th>
												<th>订单编号</th>
												<th>运单状态</th>
												<th>操作</th>
											</tr>
										</thead>

										<tbody style="vertical-align: middle;text-align=center">
											<c:choose>
												<c:when test="${hasResult==true }">
													<%
														int i = 0;
													%>
													<c:forEach var="waybillInfo" items="${waybillList }"
														varStatus="loop">
														<tr style="height: 40px">
															<td>${loop.index+1}</td>
															<td>${waybillInfo.waybillId }</td>
															<!--<td>${waybillInfo.waybillCompanyId }</td>  -->
															<td>${waybillInfo.createTime}</td>
															<td>${waybillInfo.endTime}</td>
															<td>${waybillInfo.orderId}</td>

															<td><%=list.get(i).getWaybillState().equals("1") ? "运输中" : "待签收"%></td>
															<%
																i++;
															%>
															<td><a
																href="<%=context %>/logistics/follow?waybillId=${waybillInfo.waybillId}">
																	<button class="btn btn-primary btn-xs">查看</button>
															</a>
																<button class="btn btn-primary btn-xs"
																	data-toggle="modal" data-target="#myModal">新增</button>
																<!-- 模态框（Modal） --> <a
																href="<%=context %>/logistics/changeOrderId?orderId=${waybillInfo.orderId }&changestate=${waybillInfo.waybillState}&
																waybillId=${waybillInfo.waybillId }&page=1&state=1&state1=2">
																	<button class="btn btn-primary btn-xs">修改</button>
															</a>
																<div class="modal fade" id="myModal" tabindex="-1"
																	role="dialog" aria-labelledby="myModalLabel"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<button type="button" class="close"
																					data-dismiss="modal" aria-hidden="true">&times;</button>
																				<h4 class="modal-title" id="myModalLabel">新增物流信息</h4>
																			</div>
																			<div class="modal-body">
																				<form role="form" method="post"
																					action="<%=context %>/logistics/insert?page=${page}&state=1&state1=2">
																					<div class="form-group">
																						<input type="hidden" class="form-control"
																							name="waybillId"
																							value="${waybillInfo.waybillId }"> <label
																							for="exampleInputEmail1">提交人</label> <input
																							type="text" class="form-control"
																							name="submituser" />
																					</div>
																					<div class="form-group">
																						<label for="exampleInputPassword1">地点</label> <input
																							type="text" class="form-control" name="location" />
																					</div>
																					<div class="form-group">
																						<label for="exampleInputEmail1">内容</label> <input
																							type="text" class="form-control" name="content" />
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-default"
																							data-dismiss="modal">关闭</button>
																						<input type="submit" value="提交"
																							class="btn btn-primary"/>
																					</div>
																				</form>
																			</div>

																		</div>
																		<!-- /.modal-content -->
																	</div>
																	<!-- /.modal -->
																</div></td>
														</tr>
													</c:forEach>
													<c:forEach begin="${waybillList.size() }" end="8"
														varStatus="loop">
														<tr style="height: 40px">
															<td colspan="8"></td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="8" style="text-align: center; padding: 100px"><br>无</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>

									<div class="pull-right" style="text-align: center" id="paging">
										<ul class="pagination">
											<li><a>.当前第<span>${page}</span>页
											</a></li>
											<li><a
												href="<%=context%>/logistics/query?state=1&state1=2&page=${page-1>1?page-1:1}">&laquo;</a></li>
											<c:forEach begin="1" end="${totalPages}" varStatus="loop">
												<li><a
													href="<%=context%>/logistics/query?state=1&state1=2&page=${loop.index}">${loop.index}</a>
												</li>
											</c:forEach>
											<li><a
												href="<%=context%>/logistics/query?state=1&state1=2&page=${page+1>totalPages ? totalPages:page+1}">&raquo;</a>
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
