<%@ page pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>

<script type="text/javascript">
	$(document)
			.on(
					"change",
					"select",
					function() {
						if ($("#orderId").val() != ""
								&& $("#selectstartingplace").val() != ""
								&& $("#selectdestination").val() != "") {
							$
									.ajax({
										url : "${context }/order/queryprice",
										data : {
											"orderId" : $("#orderId").val(),
											"startingplace" : $(
													"#selectstartingplace")
													.val(),
											"destination" : $(
													"#selectdestination").val()
										},//给服务器的参数
										type : "POST",
										dataType : "json",
										async : true,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
										cache : false,
										error : function() {
											$('#modal-container-204155').modal();
											$("#quedin").attr("disabled",true);
										},
										success : function(result) {
											$("#price").html(result);
										}
									});
						} else {
							$("#price").html(0.00);
						}
					})

	$(function() {
		var id = $("#error").text();
	})
	function warring() {
		$('#modal-container-204152').modal();
		$("#quedin").attr("disabled",true);

	}
</script>
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
				<div class="modal-body">选择的地址组不存在，请重新输入！</div>
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

				<div class="modal-body">您没有访问权限</div>

				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>

			</div>
		</div>
	</div>
	<div id="error" style="font-size: 20px;" hidden="hidden">${error }</div>

	<div class="container text-right" style="margin-bottom: 0">
		<c:choose>
			<c:when test="${currentUser eq '' }">
				<a href="${context }/jsp/login.jsp">登录</a>
			</c:when>
			<c:otherwise>
				${currentUser.name }&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
		<a href="${context }/login/logout">注销</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a
						href="${context }">首页</a></li>
					<li role="presentation"><a href="#" onClick="warring()">交易中心</a></li>
					<li role="presentation"><a
						href="${context }/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
					<li role="presentation"><a
						href="${context }/jsp/report/reportIndex.jsp">报表中心</a></li>
					<li role="presentation" class="active"><a
						href="${context }/jsp/user/com_qualification.jsp">会员中心</a></li>
				</ul>
				<h3 class="text-muted">
					<a href="${context }"><img alt="logo"
						src="${context }/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>

	<div align="center">
		<form class="form-horizontal"
			action="${context }/order/createWayBill"
			?companyName=${companyName } method="post" name="waybillproduce">
			<div class="form-group">
				<label class="col-xs-4 control-label"> 订单编号： </label> <input
					style="height: 24px; margin-top: 6px" class="col-xs-2 " type="text" readonly="readonly"
				id="orderId" name="orderId" value="${orderId }">
			</div>
			<div class="form-group">
				<label class="col-xs-4 control-label">
					物&nbsp;&nbsp;流&nbsp;&nbsp;商： </label>
				<div align="left" style="margin: 0.6% 0 0 0;">
					<select id="companyName" name="companyName" onchange="x()">
						<option></option>
						<c:if test="${!empty companylist }">
							<c:forEach var="company" items="${companylist}">
								<option>${company.companyName}</option>
							</c:forEach>
						</c:if>
					</select>
					<script>
						function x() {
							var myselect=document.getElementById("companyName");
							var index=myselect.selectedIndex;
							if(myselect.options[index].text!=="")
								$("#quedin").attr("disabled",false);
						else $("#quedin").attr("disabled",true);
						}
					</script>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-4 control-label"> 发货地址： </label>
				<div align="left" style="margin: 0.6% 0 0 0;">
					<select id="selectstartingplace" name="startingplace" onchange="x()">
						<option></option>
						<option>秦皇岛</option>
						<option>天津</option>
					</select>

				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-4 control-label"> 收货地址： </label>
				<div align="left" style="margin: 0.6% 0 0 0;">
					<select id="selectdestination" name="destination" onchange="x()">
						<option></option>
						<option>广州</option>
						<option>福州</option>
						<option>宁波</option>
						<option>上海</option>
						<option>张家港</option>
						<option>镇江</option>
					</select>
					<script>
						function x() {
							var myselect1=document.getElementById("companyName");
							var myselect2=document.getElementById("selectstartingplace");
							var myselect3=document.getElementById("selectdestination");
							var index1=myselect1.selectedIndex;
							var index2=myselect2.selectedIndex;
							var index3=myselect3.selectedIndex;
							if(myselect1.options[index1].text!==""&&myselect2.options[index2].text!==""&&myselect3.options[index3].text!==""){
								$("#quedin").attr("disabled",false);
							}else $("#quedin").attr("disabled",true);
						}
					</script>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-4 control-label"> 运输方式： </label>
				<div class="col-xs-6">
					<p class="form-control-static text-left" id="way">海运</p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-4 control-label">
					总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价： </label>
				<div align="left" style="margin: 0.6% 0 0 0;">
					<p id="price">0.00</p>
				</div>
			</div>

			<div>
				<button style="margin-left: -37%" class="btn btn-info" type="submit" id="quedin" disabled="disabled">确定</button>
				&nbsp;&nbsp;&nbsp;&nbsp; <a href="${context }/jsp/order/cancel.jsp" target="_self">
					<button class="btn btn-info" type="button">取消</button>
				</a>

			</div>
		</form>

	</div>
</body>
<div class="jumbotron text-center" style="margin: 14% 0 0 0;">
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
</html>