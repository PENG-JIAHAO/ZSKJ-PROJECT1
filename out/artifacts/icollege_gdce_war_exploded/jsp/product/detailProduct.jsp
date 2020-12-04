<%@ page pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="refresh" content="30">

<!-- 只有卖方能查看报表中心 -->
<script type="text/javascript">
	function judge()
	{
		var pass=${permission==2?1:2}
		if(pass==1)
			{
				window.location.href="${context }/jsp/report/reportIndex.jsp";
			}
		else
		{
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
	width: 1170px;
}

.footerP {
	background-color: #2B2B2B;
	width: 100%;
	height: 190px;
}

.main {
	margin: auto;
	width:  1170px;
	height: 570px
}

.header {
	margin: auto;
	width:  1170px;
	height: 120px;
}

.box {
	margin: auto;
	padding: 3px 15px 3px 15px;
	width:  1170px;
	height: 160px;
	/*border: 1px solid #848484;*/
}

.locationD {
	margin: 10px auto 0;
	height: 47px;
	width: 1140px;
	border: 1px solid #EAEAEA;
	background: linear-gradient(to bottom, white, #EAEAEA, #E5E5E5);
}

.locationP {
	margin: auto;
	width: 100%;
	height: 47px;
	padding-left: 10px;
	line-height: 47px;
}

.midtitle {
	margin: 20px auto 0;
	height: 47px;
	line-height: 47px;
	width: 1140px;
	padding: 0px 15px 0;
	border: 1px solid #EAEAEA;
	background: linear-gradient(to bottom, white, #EAEAEA, #E5E5E5);
}

.leftbotton {
	display: inline-block;
	width: 1140px;
	padding: 0px 15px 0px;
	margin-left: 0px;
}

.rightbotton {
	display: inline-block;
	float: right;
}

.table{
	width: 100%;
}
</style>

<body>

	<div class="modal fade" id="modal-container-204152" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
						<h4 class="modal-title" id="myModalLabel">
							错误
						</h4>
				</div>
				<div class="modal-body">
							您没有访问权限
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container text-right" style="margin-bottom: 0;">
		<c:if test="${empty currentUser }" var="pages" scope="session">
			<c:redirect url="/jsp/user/login.jsp"></c:redirect>
		</c:if>
		<c:if test="${not pages }">
			<c:out value="${currentUser.name}"></c:out>
		</c:if>
			<a href="${context }/login/logout">注销</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials" style="padding: 30px 30px 30px 0px;">
					<li role="presentation"><a href="${context }">首页</a></li>
					<li role="presentation"><a>交易中心</a></li>
					<li role="presentation"><a
						href="${context }/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a onClick="judge()"
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation"  class="active"><a
						href="${context }/jsp/user/com_qualification.jsp">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="${context }"><img alt="logo" src="${context }/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>


	<div class="main">

		<!-- 这里是中间用来分割区域的图片 -->
		<div class="box">
			<img alt="分割图" src="${context }/imgs/trade/banner004.png"  style="width: 1140px;height: 160px">
		</div>

		<!-- 这里是显示当前的位置 -->
		<div class="locationD">
			<p class="locationP" style="font-family:宋体">
				<span style="color: #1196EE">当前位置：</span>商品详细信息
			</p>
		</div>

		<!-- 这里显示商品信息 -->
		<div class="midtitle">
			<h4 style="margin-top: 15px; ">基本信息</h4>
		</div>

		<div style="width: 1170px;padding: 0px 15px 0px;">
			<table class="table" style="font-family:宋体;width: 100%;">
				<tbody style="width: 100%;">
					<tr style="background-color: white;width: 100%;">
						<td width="30%"><span>数量(万吨):</span>${sessionScope.product.quantity}</td>
						<td width="30%"><span>价格(元/吨):</span>${sessionScope.product.price}</td>
					</tr>
					<tr class="success" style="width: 100%;">
						<td><span>全水分:</span>${sessionScope.product.fullMoisture}</td>
						<td><span>全硫份:</span>${sessionScope.product.fullSulfur}</td>
						<td><span>挥发份:</span>${sessionScope.product.volatiles}</td>
					</tr>
					<tr style="background-color: white;width: 100%;">
						<td><span>低位发热量（kcal/kg）:</span>${sessionScope.product.lowPower}</td>
						<td><span>产地:</span>${sessionScope.product.srcAddress}</td>
						<td><span>运费单价:</span>${sessionScope.product.carriage}</td>
					</tr>
					<tr class="warning" style="width: 100%;">
						<td><span>发货港口:</span>${sessionScope.product.portAddress}</td>
						<td><span>联系方式:</span>${sessionScope.phoneNumber}</td>
						<td><span>发布人:</span>${sessionScope.product.userName}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="leftbotton">
			<script type="text/javascript">
				var productstate;//接受数据库信息
				productstate = ${sessionScope.product.productState};
				var reviewstate;//接受数据库信息
				reviewstate = ${sessionScope.product.reviewState};

				function jump() 
				{
				productstate = ${sessionScope.product.productState};
					if(productstate == 0)
					{
						window.location.href = "${context }/trade/productToContract"
					} else 
					{
						alert("已有人摘牌");
					}

				}

				if (productstate == 0) 
				{
					document.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;已上架</span>");
				} else if (productstate == 1 && reviewstate==2) 
				{
					
					document.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;审核未通过</span>");
				} else if(productstate==1 && reviewstate==0)
				{
					
					document.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;正在审核</span>");
				}
				 else if(productstate==1&& reviewstate==1)
					{

						document.write("<span style='vertical-align:bottom; color:red'>&nbsp;&nbsp;已下架:${sessionScope.product.offProductInfo}</span>");
					}
			</script>
		</div>
		<div style="margin-left: 5px;width: 1140px;padding: 0px 20px 0px "  >
			<h4 ><a href="${context }/product/query"> 返回</a></h4>
		</div>
		<br/>
	</div>




	<!-- 页面底部 -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
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
