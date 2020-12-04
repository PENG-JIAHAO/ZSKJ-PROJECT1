<%@ page pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.isscollege.gdce.domain.*"%>

<meta http-equiv="refresh" content="30">

<!-- 只有卖方能查看报表中心 -->
<script type="text/javascript">
	function judge()
	{
		//获取用户权限
		var pass=${permission.equals("3") ? 1 : 2}
		if(pass==1)
			{
				window.location.href="'${context}'/Report";
		} else {
			$('#modal-container-204152').modal();
		}

	}
</script>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: white;
}

a:link.uplow {
	color: white;
}

.container.text-right {
	background-color: white;
	margin: auto;
	width: 1004px;
	height: 50px;
}

.footerP {
	background-color: #2B2B2B;
	width: 100%;
	height: 190px;
}

.main {
	margin: auto;
	width: 1004px;
	height: 205px
}

.header {
	margin: auto;
	width: 1004px;
	height: 120px;
}

.box {
	margin: auto;
	padding: 3px 5px 3px 5px;
	width: 1004px;
	height: 147px;
	border: 1px solid #848484;
}

.locationD {
	margin: auto;
	margin-top: 10px;
	width: 1004px;
	height: 47px;
	padding: 10px;
	border: 1px solid #EAEAEA;
	background: linear-gradient(to bottom, white, #EAEAEA, #E5E5E5);
}

.locationP {
	margin: auto;
	width: 1004px;
	height: 47px;
}

.midtitle {
	margin: auto;
	margin-top: 20px;
	width: 1004px;
	height: 47px;
	line-height: 47px;
	padding-left: 30px;
	border: 1px solid #EAEAEA;
	background: linear-gradient(to bottom, white, #EAEAEA, #E5E5E5);
	padding-left: 30px;
}

</style>

<body>

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

	<div class="container text-right" style="margin-bottom: 0;">
	
		<c:if test="${ empty user}">
		<a href='" + ${context } + "/jsp/user/login.jsp'>登录</a>
		</c:if>
		<c:if test="${not empty user}">
	                     	${user.name}
		</c:if>&nbsp;&nbsp; 
		<a href="${context }/jsp/user/login.jsp">注销</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a href="${context }">首页</a></li>
					<li role="presentation"><a>交易中心</a></li>
					<li role="presentation"><a
						href="${context}/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a onClick="judge()"
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation"><a
						href="${context}/jsp/user/com_qualification.jsp">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="${context}"><img alt="logo"
						src="${context}/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>


	<div class="main">

		<!-- 这里是中间用来分割区域的图片 -->
		<div class="box">
			<img alt="分割图" src="${context }/imgs/trade/banner004.png">
		</div>

		<!-- 这里是显示当前的位置 -->
		<div class="locationD">
			<p class="locationP" style="font-family: 宋体">
				<span style="color: #1196EE">当前位置：</span>商品详细信息
			</p>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="container"
					style="box-shadow: 5px 5px 20PX #aaa; padding: 1cm 1cm 0.5cm 1cm; width: 1004px;">
					<div id="mainmessage" style="display:">
						<table class="table table-condensed" style="text-align: center">
							<tr>
								<td align="right"><b>供应数量（万吨）：</b> <input type="text"
									style="border: 0px"
									value="${sessionScope.product.quantity}" size="15"
									readonly="readonly"></td>
								<td align="right"><b>热值（KCal/Kg）≥：</b> <input type="text"
									style="border: 0px;"
									value="${sessionScope.product.lowPower}" size="15"
									readonly="readonly"></td>
								<td align="right"><b>原煤单价（元/吨）：</b> <input type="text"
									style="border: 0px;" value="${sessionScope.product.price}"
									size="15" readonly="readonly"></td>
							</tr>

							<tr>
								<td align="right"><b>全硫（%）≤：</b> <input type="text"
									style="border: 0px"
									value="${sessionScope.product.fullSulfur}" size="15"
									readonly="readonly"></td>
								<td align="right"><b>产地：</b> <input type="text"
									style="border: 0px;"
									value="${sessionScope.product.srcAddress}" size="15"
									readonly="readonly"></td>
								<td align="right"><b>运费单价（元/吨）：</b> <input type="text"
									style="border: 0px;"
									value="${sessionScope.product.carriage}" size="15"
									readonly="readonly"></td>
							</tr>

							<tr>
								<td align="right"><b>挥发份（%）：</b> <input type="text"
									style="border: 0px"
									value="${sessionScope.product.volatiles}" size="15"
									readonly="readonly"></td>
								<td align="right"><b>发站（发货港口）：</b> <input type="text"
									style="border: 0px;"
									value="${sessionScope.product.portAddress}" size="15"
									readonly="readonly"></td>
								<td align="right"></td>
							</tr>

							<tr>
								<td align="right"><b>空干基灰分（%）：</b> <input type="text"
									style="border: 0px"
									value="${sessionScope.product.dryPowder}" size="15"
									readonly="readonly"></td>
								<td align="right"><b>全水分（%）≤：</b> <input type="text"
									style="border: 0px;"
									value="${sessionScope.product.fullMoisture}" size="15"
									readonly="readonly"></td>
								<td align="right"></td>
							</tr>
							<tr>
								<td align="right"></td>
								<td align="right"></td>
								<td align="right"></td>
							</tr>
						</table>
						<br>

						<div class="row" style="height : 30px; margin-top : -30px;">
							<div class="col-md-6" style="padding: 0cm 0cm 0cm 8cm;">
   <script type="text/javascript">
				var productstate;//接受数据库信息
				productstate = ${sessionScope.product.productState};
				function jump() 
				{
					if(productstate == 0)
					{
						window.location.href = "${context}/trade/productToContract"
										} else {
											alert("已有人摘牌");
										}
									}
						
				var user=${currentUser.permission};
									if (productstate == 0 && user == 1) {
										document
												.write("<button type='button' class='btn btn-primary' onclick=jump()>摘牌</button>");
									} else if(productstate == 0 && user == 3){
										document
												.write("<button type='button' class='btn btn-primary' disabled='disabled'>摘牌</button>");
										document
												.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;无权限</span>");
									} else if (productstate == 1&& user != 2) {
										document
												.write("<button type='button' class='btn btn-primary' disabled='disabled'>摘牌</button>");
										document
												.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;已有人摘牌</span>");
									} else if(user != 2){
										document
												.write("<button type='button' class='btn btn-primary' disabled='disabled'>摘牌</button>");
										document
												.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;有人正在摘牌</span>");
									}
								</script>
							</div>
							<div class="col-md-6" style="padding: 0cm 0cm 0cm 3cm;">
								<button type="button" class="btn btn-primary"
									onclick="window.location.href ='${context}'">返回</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>

		<!-- 页面底部 -->
		<div class="jumbotron text-center"
			style="margin-bottom: 0; margin-top: 30px">
			<p>
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
