<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User,com.isscollege.gdce.domain.Product"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${context }/js/user/regist.js"></script>
<script type="text/javascript" src="${context }/js/jquery/jquery.min.js"></script>

<script type="text/javascript">
$(function () {
	var perm=${currentUser.permission };
	
	if(perm==2){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("productselect").removeAttribute("disabled");
	}
	
});
	function judge()
	{
		var pass=${permission == 2 ? 1 : 2 }
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
		<c:redirect url="/jsp/user/login.jsp"></c:redirect>
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
								class="btn btn-default" type="button"
								onClick="showReport2()">资质管理</button>
					</a>
				</div>
				<div class="panel-body" style="display: inline-block" >
					<a href="${context }/order/query?page=1" target="_self">
						<button style="width: 90px; height: 40px" class="btn btn-default"
								type="button" onClick="showReport2()">订单查询</button></a>
				</div>
				<div class="panel-body" style="display: inline-block">
					<a href="${context }/contract/querylist?a=1" target="_self">
						<button style="width: 90px; height: 40px" class="btn btn-default "
								type="button" onClick="showReport1()">合同查询</button></a>
				</div>

				<div class="panel-body" style="display: inline-block">
					<a href="${context}/getuserproduct" target="_self"><button
							style="width: 90px; height: 40px" class="btn btn-default btn-primary " id="productselect"
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
									class="btn btn-default " type="button" onClick="showReport1()">物流中心</button></a>
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
					<div class="col-md-10 column">

<style>
.col_style {
	height: 30px;
	width: auto;
	text-align: center;
}

。main_table_style {
	height: 30px;
	width: 100px;
	text-align: center;
}

.table tbody {
	display: block;
	height: 600px;
	overflow-y: scroll;
	text-align: center;
}

.table thead, tbody tr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

.table thead {
	width: cacl(100% -1em);
}

.table thead th {
	text-align: center;
	background: #ccc;
}
#alertBox{
	display: none;
	position: absolute;
	top: 30%;
	width: 100%;
	height: 400px;
	z-index: 99;
}
.boxContent{
	margin: 0 auto;
	padding: 50px 40px 50px;
	width: 400px;
	height:240px;
	border: 1px solid #333333;
	border-radius: 5px;
	background-color: #FFFFFF ;
}
.boxContent input{
	.
	width: 320px;
	height: 32px;
	line-height: 32px;
	color: #999999;
	font-size: 18px;
	outline: none;
	margin: 0 auto;
}

.boxBtn{
	width:  100%;
	height: 40px;
	margin: 20px auto 0;
	display: flex;
	justify-content: space-between;
}
.boxBtn a{
	margin: 0 auto;
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	font-size: 16px;
	color: #FFFFFF;
	background-color: #0f74a8;
	list-style: none;
	border-radius: 4px;
	text-align: center;
}
</style>
						</head>
						<body>

							<ul id="myTab" class="nav nav-pills" style="margin-left: -15px">
								<li class="active"><a href="#published" data-toggle="tab">已发布</a></li>
								<li><a href="#auditing" data-toggle="tab">待审核</a></li>
								<li><a href="#shelves" data-toggle="tab">已下架</a></li>
								<li><a href="#sss" data-toggle="tab">未通过</a></li>
								<li><a href="#aaa" data-toggle="tab">已撤销</a></li>
							</ul>
							<hr>

							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="published">
									<div class="container">
										<div class="row clearfix">
											<div class="col-md-12 column" style="margin-left:-30px">
												<div class="table-responsive">
													<h2>
														<span class="label label-primary">已发布商品信息</span>
													</h2>
													<table class="table table-hover">
														<thead>

															<tr>
																<th class="col_style">供应数量<br>（万吨）</th>
																<th class="col_style">热值<br>（Kcal）</th>
																<th class="col_style">原煤价格<br>（元/吨）</th>
																<th class="col_style">全硫<br>（≤%）</th>
																<th class="col_style">产地</th>
																<th class="col_style">运费单价<br>（元/吨）</th>
																<th class="col_style">挥发分</th>
																<th class="col_style">发货港口</th>
																<th class="col_style">空干基灰分</th>
																<th class="col_style">全水分<br>（≤%）</th>
																<th class="col_style">查看</th>
																<th class="col_style">修改</th>
																<th class="col_style">下架</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${productUserList }" var="list" varStatus="count">

																<c:if test="${count.current.productState == 0&&count.current.reviewState == 1}">

																	<tr class="success">
																		<td>${list.quantity }</td> 
																		<td>${list.lowPower }</td>
																		<td>${list.price }</td>
																		<td>${list.fullSulfur }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;${list.srcAddress }</td>
																		<td>${list.carriage }</td>
																		<td>&nbsp;&nbsp;&nbsp;${list.volatiles }</td>
																		<td>${list.portAddress }</td>
																		<td>${list.dryPowder }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.fullMoisture }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${context }/product/productId?productId=${list.productId }">查看</a></td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${context }/product/updateProduct?id=${list.id } ">修改</a></td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  data-toggle="modal" data-target="#OffSureModal" onclick="alertShow(${list.id})">
																			下架
																		</a></td>
																		<div class="modal fade" id="OffSureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="height:auto;">
																			<div class="modal-dialog">
																				<div class="modal-content">
																					<div class="modal-header">
																						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																							&times;
																						</button>
																					</div>
																					<form action="${context}/product/updateProductState" method="post"  >
																						<div class="modal-body">
																							<p>确认是否下架？</p>
																							<div class="offShellReasonPart">
																								<input type="hidden" name="id"  id="productIdShow" value="">
																								<textarea type="text" name="OffProductInfo" id="OffProductInfo"  onchange="validateOffProductInfo()"
																								  placeholder='请输入下架原因' style="width: 100%;height: 100%;resize:none;" ></textarea>
																								<p id="OffProductInfoError" style="margin:5px 5px 0"></p>
																							</div>
																						</div>
																						<div class="modal-footer">
																							<button class="btn btn-primary" type="submit"  id="offShellUpdateBtn"  disabled="true">
																								确定
																							</button>
																							<button type="button" class="btn btn-default" data-dismiss="modal" >
																								取消
																							</button>
																						</div>
																					</form>
																				</div><!-- /.modal-content -->
																			</div><!-- /.modal -->
																		</div>
																		<script>
																			function alertShow(id) {
																				window.productId=id;
																				document.getElementById("productIdShow").value = window.productId;
                                                                                var id = "OffProductInfo";
                                                                                // 获取输入框的值 对button显示做优化
                                                                                var value = $("#" + id).val();//获取输入框内容
                                                                                let btnIdDisabledValue = document.getElementById("offShellUpdateBtn");
                                                                                if(value.length==0){
                                                                                    btnIdDisabledValue.disabled = true;
                                                                                }else if (value.length<20){
                                                                                    btnIdDisabledValue.disabled = true;
                                                                                }else {
                                                                                    btnIdDisabledValue.disabled = false;
                                                                                }
																			}
																			function validateOffProductInfo() {
																				var id = "OffProductInfo";
																				var value = $("#" + id).val();//获取输入框内容
																				let btnIdDisabledValue = document.getElementById("offShellUpdateBtn");
																				/*
                                                                                 * 1. 非空校验
                                                                                 */
																				if(value.length==0)
																				{
																					/*
                                                                                     * 获取对应的label
                                                                                     * 添加错误信息
                                                                                     * 显示label
                                                                                     */
																					$("#" + id + "Error").css("display","block");
																					$("#" + id + "Error").css("color","red");
																					$("#" + id + "Error").text("文本不能为空！");
																					showError($("#" + id + "Error"));
																					btnIdDisabledValue.disabled = true;
																				}else if (value.length<20){
																					$("#" + id + "Error").css("display","block");
																					$("#" + id + "Error").css("color","red");
																					$("#" + id + "Error").text("下架原因字数必须大于20！");
																					showError($("#" + id + "Errors"));
																					btnIdDisabledValue.disabled = true;
																				}else {
																					$("#" + id + "Error").css("display","none");
																					btnIdDisabledValue.disabled = false;
																				}
																			}
																		</script>
																	</tr>
															</c:if>
															</c:forEach>
														</tbody>
													</table>
													<div class="col-md-12 column"  id="page">
														<div class="row">
															<div class="col-md-6">
																当前第${productUserListpageinfo.pageNum}页，总共${productUserListpageinfo.pages}页
															</div>

															<div class="col-md-6">
																<nav aria-label="Page navigation">
																	<ul class="pagination">

																		<li><a href="${context}//getuserproduct?param=1">首页</a> </li>

																		<c:if test="${productUserListpageinfo.hasPreviousPage}">
																			<li><a href=""${context}//getuserproduct?param=${productUserListpageinfo.pageNum-1}"" aria-label="Previous">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>

																		<c:forEach items="${productUserListpageinfo.navigatepageNums}" var="pagenum">
																			<c:if test="${pagenum==productUserListpageinfo.pageNum}">
																				<li class="active"><a href="#">${pagenum}</a> </li>
																			</c:if>
																			<c:if test="${pagenum!=productUserListpageinfo.pageNum}">
																				<li><a href="${context}//getuserproduct?param=${pagenum}">${pagenum}</a> </li>
																			</c:if>
																		</c:forEach>
																		<c:if test="${productUserListpageinfo.hasNextPage}">
																			<li><a href=""${context}//getuserproduct?param=${productUserListpageinfo.pageNum+1}"" aria-label="Next">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>
																		<li><a href="${context}//getuserproduct?param=${productUserListpageinfo.pages}">末页</a> </li>
																	</ul>
																</nav>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="auditing">
									<div class="container">
										<div class="row clearfix">
											<div class="col-md-12 column">
												<div class="table-responsive">
													<h2>
														<span class="label label-primary">待审核商品信息</span>
													</h2>
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="col_style">供应数量<br>（万吨）</th>
																<th class="col_style">热值<br>（Kcal）</th>
																<th class="col_style">原煤价格<br>（元/吨）</th>
																<th class="col_style">全硫<br>（≤%）</th>
																<th class="col_style">产地</th>
																<th class="col_style">运费单价<br>（元/吨）</th>
																<th class="col_style">挥发分</th>
																<th class="col_style">发货港口</th>
																<th class="col_style">空干基灰分</th>
																<th class="col_style">全水分<br>（≤%）</th>
																<th class="col_style">查看</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${auditingProductList }" var="list" varStatus="count">
																<c:if test="${count.current.productState == 1 && count.current.reviewState == 0  }">
																	<tr class="success">
																		<td>${list.quantity }</td> 
																		<td>${list.lowPower }</td>
																		<td>${list.price }</td>
																		<td>${list.fullSulfur }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;${list.srcAddress }</td>
																		<td>${list.carriage }</td>
																		<td>&nbsp;&nbsp;&nbsp;${list.volatiles }</td>
																		<td>${list.portAddress }</td>
																		<td>${list.dryPowder }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.fullMoisture }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${context }/product/productId?productId=${list.productId }">查看</a></td>
                                                                </tr>
                                                                </c:if>
                                                              </c:forEach>
														</tbody>
													</table>
													<div class="col-md-12 column"  id="page">
														<div class="row">
															<div class="col-md-6">
																当前第${auditingProductListpageinfo.pageNum}页，总共${auditingProductListpageinfo.pages}页
															</div>

															<div class="col-md-6">
																<nav aria-label="Page navigation">
																	<ul class="pagination">

																		<li><a href="${context}//getuserproduct?param=1">首页</a> </li>

																		<c:if test="${auditingProductListpageinfo.hasPreviousPage}">
																			<li><a href=""${context}//getuserproduct?param=${auditingProductListpageinfo.pageNum-1}"" aria-label="Previous">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>

																		<c:forEach items="${auditingProductListpageinfo.navigatepageNums}" var="pagenum">
																			<c:if test="${pagenum==auditingProductListpageinfo.pageNum}">
																				<li class="active"><a href="#">${pagenum}</a> </li>
																			</c:if>
																			<c:if test="${pagenum!=auditingProductListpageinfo.pageNum}">
																				<li><a href="${context}//getuserproduct?param=${pagenum}">${pagenum}</a> </li>
																			</c:if>
																		</c:forEach>
																		<c:if test="${auditingProductListpageinfo.hasNextPage}">
																			<li><a href=""${context}//getuserproduct?param=${auditingProductListpageinfo.pageNum+1}"" aria-label="Next">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>
																		<li><a href="${context}//getuserproduct?param=${auditingProductListpageinfo.pages}">末页</a> </li>
																	</ul>
																</nav>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="shelves">
									<div class="container">
										<div class="row clearfix">
											<div class="col-md-12 column">
												<div class="table-responsive">
													<h2>
														<span class="label label-primary">已下架商品信息</span>
													</h2>
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="col_style">供应数量<br>（万吨）</th>
																<th class="col_style">热值<br>（Kcal）</th>
																<th class="col_style">原煤价格<br>（元/吨）</th>
																<th class="col_style">全硫<br>（≤%）</th>
																<th class="col_style">产地</th>
																<th class="col_style">运费单价<br>（元/吨）</th>
																<th class="col_style">挥发分</th>
																<th class="col_style">发货港口</th>
																<th class="col_style">空干基灰分</th>
																<th class="col_style">全水分<br>（≤%）</th>
																<th class="col_style">查看</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${underProductList}" var="list" varStatus="count">
															<c:if test="${count.current.productState != 0 && count.current.reviewState ==1  }">
															<tr class="success">
																<td>${list.quantity }</td> 
																<td>${list.lowPower }</td>
																<td>${list.price }</td>
																<td>${list.fullSulfur }</td>
																<td>&nbsp;&nbsp;&nbsp;&nbsp;${list.srcAddress }</td>
																<td>${list.carriage }</td>
																<td>&nbsp;&nbsp;&nbsp;${list.volatiles }</td>
																<td>${list.portAddress }</td>
																<td>${list.dryPowder }</td>
																<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.fullMoisture }</td>
																<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${context }/product/productId?productId=${list.productId }">查看</a></td>
															</tr>
															</c:if>
															</c:forEach>
														</tbody>
													</table>
													<div class="col-md-12 column"  id="page">
														<div class="row">
															<div class="col-md-6">
																当前第${underProductListpageinfo.pageNum}页，总共${underProductListpageinfo.pages}页
															</div>

															<div class="col-md-6">
																<nav aria-label="Page navigation">
																	<ul class="pagination">

																		<li><a href="${context}//getuserproduct?param=1">首页</a> </li>

																		<c:if test="${underProductListpageinfo.hasPreviousPage}">
																			<li><a href=""${context}//getuserproduct?param=${underProductListpageinfo.pageNum-1}"" aria-label="Previous">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>

																		<c:forEach items="${underProductListpageinfo.navigatepageNums}" var="pagenum">
																			<c:if test="${pagenum==underProductListpageinfo.pageNum}">
																				<li class="active"><a href="#">${pagenum}</a> </li>
																			</c:if>
																			<c:if test="${pagenum!=underProductListpageinfo.pageNum}">
																				<li><a href="${context}//getuserproduct?param=${pagenum}">${pagenum}</a> </li>
																			</c:if>
																		</c:forEach>
																		<c:if test="${underProductListpageinfo.hasNextPage}">
																			<li><a href=""${context}//getuserproduct?param=${underProductListpageinfo.pageNum+1}"" aria-label="Next">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>
																		<li><a href="${context}//getuserproduct?param=${underProductListpageinfo.pages}">末页</a> </li>
																	</ul>
																</nav>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="sss">
									<div class="container">
										<div class="row clearfix">
											<div class="col-md-12 column">
												<div class="table-responsive">
													<h2>
														<span class="label label-primary">未通过审核商品信息</span>
													</h2>
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="col_style">供应数量<br>（万吨）</th>
																<th class="col_style">热值<br>（Kcal）</th>
																<th class="col_style">原煤价格<br>（元/吨）</th>
																<th class="col_style">全硫<br>（≤%）</th>
																<th class="col_style">产地</th>
																<th class="col_style">运费单价<br>（元/吨）</th>
																<th class="col_style">挥发分</th>
																<th class="col_style">发货港口</th>
																<th class="col_style">空干基灰分</th>
																<th class="col_style">全水分<br>（≤%）</th>
																<th class="col_style">查看</th>
															</tr>
														</thead>
														<tbody>
															
															<c:forEach items="${notPassProductList }" var="list" varStatus="count">
																<c:if test="${count.current.productState == 1 && count.current.reviewState == 2  }">
																	<tr class="success">
																		<td>${list.quantity }</td> 
																		<td>${list.lowPower }</td>
																		<td>${list.price }</td>
																		<td>${list.fullSulfur }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;${list.srcAddress }</td>
																		<td>${list.carriage }</td>
																		<td>&nbsp;&nbsp;&nbsp;${list.volatiles }</td>
																		<td>${list.portAddress }</td>
																		<td>${list.dryPowder }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.fullMoisture }</td>
																		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${context }/product/productId?productId=${list.productId }">查看</a></td>
																	</tr>
															</c:if>
															</c:forEach>
														</tbody>
													</table>
													<div class="col-md-12 column"  id="page">
														<div class="row">
															<div class="col-md-6">
																当前第${notPassProductListpageinfo.pageNum}页，总共${notPassProductListpageinfo.pages}页
															</div>

															<div class="col-md-6">
																<nav aria-label="Page navigation">
																	<ul class="pagination">

																		<li><a href="${context}//getuserproduct?param=1">首页</a> </li>

																		<c:if test="${notPassProductListpageinfo.hasPreviousPage}">
																			<li><a href=""${context}//getuserproduct?param=${notPassProductListpageinfo.pageNum-1}"" aria-label="Previous">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>

																		<c:forEach items="${notPassProductListpageinfo.navigatepageNums}" var="pagenum">
																			<c:if test="${pagenum==notPassProductListpageinfo.pageNum}">
																				<li class="active"><a href="#">${pagenum}</a> </li>
																			</c:if>
																			<c:if test="${pagenum!=notPassProductListpageinfo.pageNum}">
																				<li><a href="${context}//getuserproduct?param=${pagenum}">${pagenum}</a> </li>
																			</c:if>
																		</c:forEach>
																		<c:if test="${notPassProductListpageinfo.hasNextPage}">
																			<li><a href=""${context}//getuserproduct?param=${notPassProductListpageinfo.pageNum+1}"" aria-label="Next">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>
																		<li><a href="${context}//getuserproduct?param=${notPassProductListpageinfo.pages}">末页</a> </li>
																	</ul>
																</nav>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="aaa">
									<div class="container">
										<div class="row clearfix">
											<div class="col-md-12 column">
												<div class="table-responsive">
													<h2>
														<span class="label label-primary">撤销审核的商品信息</span>
													</h2>
													<table class="table table-hover">
														<thead>
														<tr>
															<th class="col_style">供应数量<br>（万吨）</th>
															<th class="col_style">热值<br>（Kcal）</th>
															<th class="col_style">原煤价格<br>（元/吨）</th>
															<th class="col_style">全硫<br>（≤%）</th>
															<th class="col_style">产地</th>
															<th class="col_style">运费单价<br>（元/吨）</th>
															<th class="col_style">挥发分</th>
															<th class="col_style">发货港口</th>
															<th class="col_style">空干基灰分</th>
															<th class="col_style">全水分<br>（≤%）</th>
															<th class="col_style">查看</th>
														</tr>
														</thead>
														<tbody>

														<c:forEach items="${productUserList }" var="list" varStatus="count">
															<c:if test="${count.current.productState == 0 && count.current.reviewState == 3  }">
																<tr class="success">
																	<td>${list.quantity }</td>
																	<td>${list.lowPower }</td>
																	<td>${list.price }</td>
																	<td>${list.fullSulfur }</td>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;${list.srcAddress }</td>
																	<td>${list.carriage }</td>
																	<td>&nbsp;&nbsp;&nbsp;${list.volatiles }</td>
																	<td>${list.portAddress }</td>
																	<td>${list.dryPowder }</td>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.fullMoisture }</td>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${context }/product/productId?productId=${list.productId }">查看</a></td>
																</tr>
															</c:if>
														</c:forEach>
														</tbody>
													</table>
													<div class="col-md-12 column"  id="page">
														<div class="row">
															<div class="col-md-6">
																当前第${productUserListpageinfo.pageNum}页，总共${productUserListpageinfo.pages}页
															</div>

															<div class="col-md-6">
																<nav aria-label="Page navigation">
																	<ul class="pagination">

																		<li><a href="${context}//getuserproduct?param=1">首页</a> </li>

																		<c:if test="${productUserListpageinfo.hasPreviousPage}">
																			<li><a href=""${context}//getuserproduct?param=${productUserListpageinfo.pageNum-1}"" aria-label="Previous">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>

																		<c:forEach items="${productUserListpageinfo.navigatepageNums}" var="pagenum">
																			<c:if test="${pagenum==productUserListpageinfo.pageNum}">
																				<li class="active"><a href="#">${pagenum}</a> </li>
																			</c:if>
																			<c:if test="${pagenum!=productUserListpageinfo.pageNum}">
																				<li><a href="${context}//getuserproduct?param=${pagenum}">${pagenum}</a> </li>
																			</c:if>
																		</c:forEach>
																		<c:if test="${productUserListpageinfo.hasNextPage}">
																			<li><a href=""${context}//getuserproduct?param=${productUserListpageinfo.pageNum+1}"" aria-label="Next">
																				<span aria-hidden="true">&laquo;</span>
																				</a></li>
																		</c:if>
																		<li><a href="${context}//getuserproduct?param=${productUserListpageinfo.pages}">末页</a> </li>
																	</ul>
																</nav>
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