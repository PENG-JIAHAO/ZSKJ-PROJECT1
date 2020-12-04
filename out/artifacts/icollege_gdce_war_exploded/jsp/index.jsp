<%@ page pageEncoding="UTF-8"
	import="java.util.*,com.isscollege.gdce.domain.Product"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function judge()
	{
		var pass=<%=(permission.equals("2")) ? 1 : 2%>
		
		if(pass==1)
			{
				window.location.href="${context}/report/index";
		} else {
			$('#modal-container-204152').modal();
		}

	}
	function judge1()
	{
		var pass=<%=(permission.equals("3")||permission.equals("2")||permission.equals("4")) ? 1 : 2%>
		if(pass==1)
			{
				window.location.href="${context}/register/doqualification";
		} else {
			$('#modal-container-204152').modal();
		}

	}
	function warring()
	{
		$('#modal-container-204155').modal();
	}
</script>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<style>
.table tbody
 {
	display: table;
	height: 300px;
	overflow-y: auto;
	text-align: center;
}

.table thead, tbody tr 
{
	display: table;
	width: 100%;
	table-layout: fixed;
}

.table thead
 {
	 width: cacl(100% -1em); 
}
.table thead th 
{
	text-align: center;
	background: #ccc;
}
.pagination-detail{
	display: none;
}
</style>
</head>

<body>
<div class="modal fade" id="modal-container-204155" role="dialog"
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


	<div class="modal fade" id="modal-container-204152" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">请登录再访问，或您没有访问权限</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-right" style="margin-bottom: 0">
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/login.jsp'>登录</a>" : currentUser%>&nbsp;&nbsp;
		<%=currentUser.equals("") ? "<a href='" + context + "/jsp/user/register.jsp'>注册</a>" : ""%>&nbsp;&nbsp;
		<%=currentUser.equals("") ? "" : "<a href='" + context + "/login/logout'>退出</a>" %>&nbsp;&nbsp;
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation" class="active"><a href="<%=context%>">首页</a></li>
					<li role="presentation"><a href="#" onClick="warring()">交易中心</a></li>
					<li role="presentation"><a
						href="<%=request.getContextPath()%>/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a onClick="judge()"
						href="javascript:judge()">报表中心</a></li>
					<li role="presentation">
					<a href="${context}/register/doqualification">会员中心</a></li>
						<!-- <a href="javascript:judge1()">会员中心</a></li> -->
				</ul>
				<h3 class="text-muted">
					<a href="${context}"><img alt="logo" src="${context }/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="carousel slide" id="carousel-536799">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-536799"></li>
						<li data-slide-to="1" data-target="#carousel-536799"></li>
						<li data-slide-to="2" data-target="#carousel-536799"
							class="active"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item">
							<img alt="" src="${context }/imgs/1.jpg" />
							<div class="carousel-caption">
								<h4>统一平台、集中管制</h4>
							</div>
						</div>
						<div class="item">
							<img alt="" src="${context}/imgs/2.png" />
							<div class="carousel-caption">
								<h4>阳光采购、竞价交易</h4>
							</div>
						</div>
						<div class="item active">
							<img alt="" src="${context}/imgs/3.png" />
							<div class="carousel-caption">
								<h4>智能管理，公正验收</h4>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-536799"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-536799"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
	</div>

	<div class="cont" style="margin:30px auto; width:100%" >
		<div id="advertisement" style="border-collapse: collapse;
				border: 0px solid gray; width:1140px; margin:auto;">
				
			<div class="adver" style="border-collapse: collapse;
				border: 0px solid gray; border-right-width: 1px; float: left; width:33%">
			<a href="#"><img src="${context}/imgs/ad/001.PNG" alt="picture" /></a>
			</div>
			
			<div class="adver" style="border-collapse: collapse;
				border: 0px solid gray; border-right-width: 1px; float: left; width:33%">
				<a href="#"><img src="${context}/imgs/ad/002.PNG" alt="picture" /></a>
			</div>
			
			<div class="adver" style="border-collapse: collapse;
				border: 0px solid gray; border-right-width: 1px; float: left; width:33%">			
				<a href="#"><img src="${context}/imgs/ad/003.PNG" alt="picture" /></a>
			</div><br>
		</div><br>
	</div><br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h2><span class="label label-primary">销售信息</span></h2>
			<table class="table table-hover" id="xiaoshou-table">
			</table>
		</div>
	</div>
</div>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h2>
					<span class="label label-primary">采购信息</span>
				</h2>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>煤种</th>
							<th>低位发热量（Kcal）</th>
							<th>全水分（%）</th>
							<th>全硫份（%）</th>
							<th>挥发份（%）</th>
							<th>价格（元/吨）</th>
							<th>数量（万吨）</th>
							<th>交货方式</th>
							<th>交割地</th>
							<th>发布/截止日期</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>山西煤</td>
							<td>5000</td>
							<td>14</td>
							<td>1.8</td>
							<td>23至28</td>
							<td>--</td>
							<td>5</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-04-06至2016-04-30</td>
						<tr class="success">
							<td>蒙煤</td>
							<td>5000</td>
							<td>17</td>
							<td>0.5</td>
							<td>23至27</td>
							<td>--</td>
							<td>5.04</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-03-01至2016-03-31</td>
						<tr class="error">
							<td>山西煤</td>
							<td>5000</td>
							<td>13</td>
							<td>1.5</td>
							<td>23至27</td>
							<td>--</td>
							<td>5.04</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-03-01至2016-03-31</td>
						<tr class="warning">
							<td>山西煤</td>
							<td>5000</td>
							<td>13</td>
							<td>0.6</td>
							<td>23至27</td>
							<td>--</td>
							<td>5.04</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-03-01至2016-03-31</td>
						<tr class="info">
							<td>蒙煤</td>
							<td>5000</td>
							<td>17</td>
							<td>0.5</td>
							<td>23至27</td>
							<td>--</td>
							<td>5</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-02-16至2016-02-29</td>
						<tr class="success">
							<td>山西煤</td>
							<td>5000</td>
							<td>13</td>
							<td>1.5</td>
							<td>23至27</td>
							<td>--</td>
							<td>5</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-02-16至2016-02-29</td>
						<tr class="warning">
							<td>山西煤</td>
							<td>5000</td>
							<td>13</td>
							<td>1.5</td>
							<td>23至28</td>
							<td>--</td>
							<td>5</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-01-20至2016-01-31</td>
						<tr class="info">
							<td>山西煤</td>
							<td>5000</td>
							<td>12</td>
							<td>1</td>
							<td>23至28</td>
							<td>--</td>
							<td>5</td>
							<td>场地交货</td>
							<td>秦曹两港</td>
							<td>2016-01-05至2016-01-31</td>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div style="height: 120px;">
					<img src="${context}/imgs/1.jpg" width="100%"
						style="float: left; height: 120px" />

				</div>
			</div>
		</div>
	</div>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>
		<h5>
			<a href="" onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
			网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
		</p>
	</div>
</body>
<script>
	$('#xiaoshou-table').bootstrapTable({
		url: '${context}/product/getProductList',
		striped: true,
		sortable: true,
		pagination: true,
		showLoading: true,
		sidePagination: "server",
		sortName: "quantity",
		sortOrder: "desc",
		pageNumber: 1,
		pageSize: 15,
		queryParamsType: 'limit',
		queryParams: function (params) {
			return params;
		},
		rowStyle: function rowStyle(row, index) {
			var classes = ['active', 'success', 'info', 'warning', 'danger'];
			if (index % 2 === 0 && index / 2 < classes.length) {
				return {
					classes: classes[index / 2]
				};
			}
			return {};
		},
		onSort: function (name, order) {

		},
		onLoadSuccess: function (data) {

		},
		onLoadError: function (status) {

		},
		onPageChange: function (number, size) {
			$('#xiaoshou-table').bootstrapTable('removeAll')//页面改变时清空表数据
		},
		columns: [{
			field: 'quantity',
			title: '数量</br>(万吨)',
			sortable: true,
			order: 'desc',
			valign: 'middle',
			align: 'center'
		}, {
			field: 'lowPower',
			title: '热值</br>(KCal/Kg)',
			valign: 'middle',
			align: 'center'

		}, {
			field: 'price',
			title: '单价</br>(元/吨)',
			sortable: true,
			order: 'desc',
			valign: 'middle',
			align: 'center'
		},
			{
				field: 'fullSulfur',
				title: '全硫(%)',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'srcAddress',
				title: '产地',
				sortable: true,
				order: 'asc',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'carriage',
				title: '运费单价</br>(元/吨)',
				valign: 'middle',
				align: 'center'
			},
			{
				field: 'volatiles',
				title: '挥发份(%)',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'fullMoisture',
				title: '发站',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'dryPowder',
				title: '空干基灰分',
				valign: 'middle',
				align: 'center'
			},
			{
				field: 'fullMoisture',
				title: '全水分(%)',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'userName',
				title: '用户名称',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'productState',
				title: '商品状态',
				// sortable: true,
				// order: 'asc',
				valign: 'middle',
				align: 'center',
				formatter: function (value, row, index) {
					//对具体列进行格式化处理
					if(${currentUser!=null}){
						if(value==0){
							console.log("==0")
							return '<a href="${context}/trade/checkDelist?productId='+row.productId+'">查看</a>'
						}
						if(value==1){
							console.log("==1")
							return '<a href="${context}/trade/checkDelist?productId='+row.productId+'">已摘牌</a>'
						}
						if(value==2){
							console.log("==2")
							return '<a href="${context}/trade/checkDelist?productId='+row.productId+'">正在摘牌中</a>'
						}
					}
					return '';
				}
			}
		]
	});
</script>
</html>