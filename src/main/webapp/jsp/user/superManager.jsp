<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@page import="java.util.List" import="com.isscollege.gdce.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${context }/js/user/regist.js"></script>
<script type="text/javascript">
	function ckAdminForm(){
		var flag=true;
		var loginNames=/^\w{3,20}$/;
		var loginName=$("#loginname").val();
		var userNames=/^[\u4E00-\u9FA5A-Za-z0-9_]{2,20}$/;
		var userName=$("#username").val();
		var emails=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		var email = $("#email").val();
		var tels=/^1\d{10}$/;
		var phoneNumber = $("#phoneNumber").val();
		if($("#loginname").val()==""  ||  $("#password").val()=="" || $("#username").val()=="" || $("#phoneNumber").val()==""  || $("#email").val()=="" ){
			flag=false;
		}
		if(!rsLoginName&&loginNames.test(loginName) && !rsUserName&&userNames.test(userName) && !rsPhoneNumber && !rsEmail && emails.test(email) && tels.test(phoneNumber)&& flag){
			return true;
		}else{
			alert("请填写完整再提交");
			return false;
		}
	}
</script>
<script type="text/javascript">
	function isDelete() {
		var is = confirm("确定删除该管理员？");
		if (is == true) {
			alert("删除成功！");
			return true;
		} else {
			return false;
		}
	}
</script>

<link rel="stylesheet" type="text/css"
	  href="${context }/js/user/regist.css">

<style type="text/css">
	.tab-content {
		display: inline-block;
		width: 100%;
		height: 405px;
		margin-top: 40px;
	}
	.table tr:hover {
		background-color: #f5f5f5;
	}
	table tr:nth-child(2n){background-color:#fcf8e3}
	table tr:nth-child(3n){background-color:#dff0d8}

</style>
<body>
<c:set var="cuser" target="User" value="${sessionScope.currentUser}"></c:set>
<c:if test="${empty cuser || cuser.getLevel() != 0}">
	<c:redirect url="/jsp/review/review.jsp"></c:redirect>
</c:if>
				<div class='tab-content' >
							<div class="row clearfisx" style="width: 100%;margin: 0;" >
								<table class="table" id="Manager-table"></table>
							</div>
						</div>

<br>
<br>
<br>
<c:set var="msgs" value="${requestScope.msg}"/>
<c:if test="${msgs!=null && msgs.equals('成功创建')}">
	<c:out value="<script language='javascript'>alert('管理员添加成功！')</script>"/>
</c:if>

</body>
<script>
	$('#Manager-table').bootstrapTable({
		url: '${context}/register/getdataMUser',
		striped: true,
		sortable: true,
		pagination: true,
		showLoading: true,
		sidePagination: "server",
		sortName: "id",
		sortOrder: "desc",
		pageNumber: 1,
		pageSize: 10,
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
			$('#Manager-table').bootstrapTable('removeAll')//页面改变时清空表数据
		},
		columns: [{
			field: 'id',
			title: 'ID',
			sortable: true,
			order: 'desc',
			valign: 'middle',
			align: 'center'
		}, {
			field: 'name',
			title: '用户名',
			valign: 'middle',
			align: 'center'

		}, {
			field: 'password',
			title: '密码',
			sortable: true,
			valign: 'middle',
			align: 'center'
		},
			{
				field: 'level',
				title: '等级',
				valign: 'middle',
				align: 'center'

			}, {
				field: 'permission',
				title: '权限',
				sortable: true,
				order: 'asc',
				valign: 'middle',
				align: 'center'
			}, {
				field: 'operate',
				title: '操作',
				valign: 'middle',
				align: 'center',
				formatter: function (value, row, index) {
						return '<a onclick="isDelete()" href="${context}/register/deletemanager?id='+row.id+'" >Delete</a>'
				}
			}
		]
	});
</script>
</html>