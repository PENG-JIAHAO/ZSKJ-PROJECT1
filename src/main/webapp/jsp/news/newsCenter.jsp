<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.isscollege.gdce.domain.News"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta charset="UTF-8">
<title>资讯中心</title>
	<script type="text/javascript">
		function judge()
		{
			var pass = ${permission==2?1:2}
			if(pass==1)
				{
					window.location.href="${context}/report/index";
				}
			else
			{
				$('#modal-container-204152').modal();
			}
		}
		function warring()
		{
			$('#modal-container-204152').modal();
		}

		//获得新闻信息（待修改）
		function info(productId) {
			$('#NewsTable').bootstrapTable('destroy');
			$('#NewsTable').bootstrapTable({
				url: '${context}/review/getdatarecord?productId='+productId,
				striped: true,
				sortable: true,
				pagination: true,
				showLoading: true,
				sidePagination: "server",
				sortName: "RecordId",
				sortOrder: "desc",
				pageNumber: 1,
				pageSize: 7,
				pageList:[7,14],
				queryParamsType: 'limit',
				queryParams: function (params) {
					return params;
				},
				onSort: function (name, order) {

				},
				onLoadSuccess: function (data) {

				},
				onLoadError: function (status) {

				},
				columns: [{
					field:'recordID',
					title:'记录编号',
					sortable:true,
					order:'asc',
					valign:'middle',
					align:'center'
				},{
					field:'userName',
					title:'操作账户',
					sortable:true,
					order:'asc',
					valign:'middle',
					align:'center'
				},{
					field:'operateType',
					title:'操作类型',
					sortable:true,
					order:'asc',
					valign:'middle',
					align:'center'
				},{
					field:'createDate',
					title:'时间',
					sortable:true,
					order:'asc',
					valign:'middle',
					align:'center'
				},{
					field:'comment',
					title:'意见',
					sortable:true,
					order:'asc',
					valign:'middle',
					align:'center'
				},]
			})
		}

	</script>

	<style type="text/css">
			a {
			text-decoration: none;
			}

			a:hover {
			text-decoration: underline;
				cursor: pointer;
			}

			#father {
			border-collapse: collapse;
			border: 0px solid red;
			height: auto;
			}

			#guide {
			border-collapse: collapse;
			border: 1px solid blue;
			margin: 0 auto;
			width: 995px;
			height: 62px;
			}

		.top {
			border-collapse: collapse;
			border: 1px solid yellow;
			width: 50%;
			height: 100%;
			float: left;
		}

		#top {
			border-collapse: collapse;
			text-align: center;
			padding-top: 17px;
			width: 493px;
			height: 45px;
		}

		#picture {
			border-collapse: collapse;
			border: 1px solid black;
			margin: 0 auto;
			width: 995px;
			height: auto;
		}

		#layout {
			border-collapse: collapse;
			border: 0px solid blue;
			margin: 0 auto;
			width: 995px;
			height:550px;
		}

		.littleTitle {
			border-collapse: collapse;
			border: 0px solid black;
			float: left;
			width: 25%;
			text-align: center;
		}

		#special {
			border-collapse: collapse;
			border: 0px solid black;
			float: left;
			width: 240px;
		}

		.four {
			width: 995px;
			height: 40px ;
			text-align: center;
			background-image:none;
			margin: auto;
		}
		.info1{
		    text-align: center;
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
				
				<div class="modal-body">该功能暂未开放</div>
				
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
				
			</div>
		</div>
	</div>

	<div class="container text-right" style="margin-bottom: 0">
		<c:choose>
	        <c:when test="${!empty username}">${username }</c:when>
	        <c:otherwise >
	        <a href="${context}/jsp/user/login.jsp">登录</a>&nbsp;&nbsp;
	        <a href="${context}/jsp/user/register.jsp">注册</a>
	        </c:otherwise>
	    </c:choose>&nbsp;&nbsp;
	    <a href="${context}/login/logout">退出</a>
	</div>
	<div id="father">
		<div class="container">
			
			<div class="header clearfix">
				<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a
						href="${context}">首页</a></li>
					<li role="presentation" class="active"><a
						href="${context}/news/findPageBean?type=hgzc&&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a
						href="${context}/jsp/user/com_qualification.jsp">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="${context}"><img alt="logo" src="${context}/imgs/logo.png"></a>
				</h3>
				</nav>
			</div>

			<div id="picture">
				<img src="${context}/imgs/news/banner004.png"
					alt="banner004" />
			</div>

			<div id="layout">
				<!--咨询类型 -->
				<div class="four">
					<nav class="navbar">
					<ul class="nav nav-pills pull-left socials">
                        <c:set var="type" value ="${type}"/>
						<li id="hgzc" class="${active1}" role="presentation" onclick="info(hgzc)"><a>宏观政策</a></li>
						<li class="${active2}"   role="presentation" onclick="info(scfx)"><a>市场分析</a></li>
						<li class="${active3}" role="presentation" onclick="info(dlhy)"><a>电力行业</a></li>
						<li class="${active4}" role="presentation" onclick="info(mtjg)"><a>煤炭价格</a></li>
					</ul>
					</nav>
				</div>
				<!--咨询内容表格 -->
				<div>
					<table class="table" id="NewsTable"></table>
				</div>
			</div>
		</div>
	</div>

				<div class="jumbotron text-center" style="margin-bottom: 0" >
					<p>
					<h5>
						<a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br>
						<br> 网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
						地址：北京市昌平区未来科技城 邮编：102209
						电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
						电子邮箱：fuel@powerec.net
					</h5>
					</p>
				</div>




				<div id="contact"></div>

			<h4></h4>

</body>
</html>
