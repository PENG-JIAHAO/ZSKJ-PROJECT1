<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"%>
<%@ page import="com.isscollege.gdce.domain.Order"%>
<%@ page import="com.isscollege.gdce.domain.Product"%>
<%@ page import="com.isscollege.gdce.domain.Company"%>

<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
a {
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function () {
	var perm = "${currentUser.permission}";
	if(perm==2){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("productselect").removeAttribute("disabled");
	}
	
});

function judge() {
	var perm =${currentUser.permission};
	if (perm==2) {
		window.location.href = "${context}/jsp/report/reportIndex.jsp";
	} else {
		$('#modal-container-204152').modal();
	}
}
	
	function up()
	{

		var commit =document.getElementById("photoCover").value;
		var index = commit.lastIndexOf(".");
		var ext = commit.substr(index);
		if(commit === "")
		{
			alert("回执单不能为空！！");
			return false;
		}
		if (ext!==".jpg"&& ext!==".png"){
			alert("格式不匹配，请重新上传")
			return false
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
					<a href="${context }"><img alt="logo" src="${context }/imgs/logo.png"></a>
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
						<div class="col-md-12 column">
							<div class="panel panel-warning">
								<div class="panel-heading">
									<h3 class="panel-title" style="display: inline">订单编号：${order.orderId }
										&nbsp;&nbsp;&nbsp;&nbsp; 订单状态：${orderState }</h3>
									<a style="float: right" id="back">返回</a>
								</div>
							</div>
							<c:if test="${currentUser.permission eq '1' }">
								<c:if test="${orderState=='待付款'}">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title" style="display: inline">
												上传银行回执 <a style="float: right" data-toggle="collapse"
														  data-parent="#accordion" href="#collapseThree"> <strong>^</strong>
											</a>
											</h3>
										</div>
										<div id="collapseThree" class="panel-collapse collapse in">
											<div class="panel-body">
												<form
														action="${context }/order/uploadImg?orderId=${order.orderId }"
														enctype="multipart/form-data" method="post">
													<div class="form-group">
														<label for="inputfile">上传回执单</label> <input id="lefile"
																									name="filename" type="file" style="display: none"
																									accept="image/*">
														<div class="input-append">
															<input id="photoCover" name="photo" class="input-large"
																   type="text" style="height: 30px;"> <a
																class="btn btn-primary btn-sm"
																onclick="$('input[id=lefile]').click();">选择图片</a>
														</div>
														<p class="help-block">请选择图片类型文件</p>
													</div>
													<button id="idp" type="submit" class="btn btn-default"
															onclick="return up()">提交</button>
												</form>
											</div>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${currentUser.permission eq '2' }">
								<c:if test="${orderState=='待发货'}">
									<div class="panel panel-info">
										<div class="panel-heading">
											<form
													action="${context }/order/getLogisticName?orderId=${order.orderId }"
													method="post">
												<h3 class="panel-title" style="display: inline">物流：</h3>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button class="btn btn-info btn-sm" type="submit">发起物流</button>
											</form>
										</div>
									</div>
								</c:if>

							</c:if>
							<c:if test="${currentUser.permission eq '2' }">
								<c:if test="${orderState=='待收货'}">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title" style="display: inline">发布物流信息：</h3>
											<a href="${context}/logistics/follow?orderId=${order.orderId}&&waybillId=${waybillId}">
												<button class="btn btn-primary btn-xs">查看物流</button>
											</a>
										</div>
									</div>
								</c:if>

							</c:if>
							<c:if test="${!empty result}">
								<script type="text/javascript" language="javascript">
									<%-- alert("上传回执单成功");
                                    alert(<%=result%>); --%>
									window.location.href = "${context }/order/detail?orderId=${order.orderId}";
								</script>
							</c:if>
							<div class="panel panel-success">
								<div class="panel-heading">
									<h3 class="panel-title">
										订单信息 <a style="float: right" data-toggle="collapse"
												data-parent="#accordion" href="#collapseTwo"> <strong>^</strong>
									</a>
									</h3>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse in">
									<div class="panel-body"
										 style="border-bottom: dashed 1px #DCDCDC">
										<strong>买家信息：</strong><br /> 企业名称 :${buyer.companyName }&nbsp;&nbsp;&nbsp;&nbsp;
										联系方式 : ${buyer.phoneNumber }&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
									<div class="panel-body"
										 style="border-bottom: dashed 1px #DCDCDC">
										<strong>卖家信息：</strong><br /> 企业名称 : ${seller.companyName }
										&nbsp;&nbsp;&nbsp;&nbsp; 联系方式 : ${seller.phoneNumber }&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
									<div class="panel-body">
										<strong>商品信息：</strong><br /> 商品编号 :${product.productId }
										&nbsp;&nbsp;&nbsp;&nbsp; 产地：${product.srcAddress }<br />
										价格:${product.price }万元/吨 &nbsp;&nbsp;&nbsp;&nbsp;数量:
										${product.quantity }吨&nbsp;&nbsp;&nbsp;&nbsp;<br> 交易金额:
										${order.tradePrice }万元&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;
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
		<h5>
			<a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
			网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input[id=lefile]').change(function() {
				$('#photoCover').val($(this).val());
			});
			$("#back").click(function() {
				window.history.back();
			});
		});
		
		
	</script>
</body>
</html>