<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="org.apache.commons.lang3.ObjectUtils"%>
<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"%>
<%@page import="java.util.List"
	import="com.isscollege.gdce.domain.Company"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/header.jsp"%>

<style>
.col-md-5  a:hover img{filter:alpha(Opacity=70);opacity: 0.7}
.col-md-4  a:hover img{filter:alpha(Opacity=70);opacity: 0.7}
</style>

<script type="text/javascript" src="${context}/js/jquery/imgViewer.js"></script>
<script type="text/javascript">
	$.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
</script>

<%--文件下载链接检测--%>
<script type="text/javascript">
	function testFileUrl(fileurl) {
		$.ajax({
			url: fileurl,
			type: 'get',
			complete: function (response) {
				if (response.status == 204||response.status==500) {
					alert('资质文件不存在');
					return false;
				} else {
					javascript:location.href=fileurl;  //跳转下载
				}
			},
			error:function () {
				console.info("网络出错");
				alert("网络异常:无法连接到服务器!");
			}
		});
	}
</script>

<script type="text/javascript" src="${context}/js/user/regist.js"></script>
	<c:set var="reviceState" value="0"></c:set>
	<c:set var="companyObj" value="${sessionScope.company}"></c:set>
	<c:set var="user1" value="${sessionScope.currentUser}"></c:set>
	<c:if test="${not empty companyObj}">
		<c:set var="company" value="${companyObj}"></c:set>
		<c:set var="reviceState" value="${company.getReviewState()}"></c:set>
	</c:if>
<script type="text/javascript">
$(function () {
	var perm="${user1.permission}";
	//如果是卖家开发开放功能
	if(perm==2){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("productselect").removeAttribute("disabled");
		document.getElementById("querylist").removeAttribute("disabled")
		document.getElementById("queryagreement").removeAttribute("disabled")
	}
	//如果是卖家开放以下功能
	if(perm==1){
		document.getElementById("querylist").removeAttribute("disabled")
		document.getElementById("queryagreement").removeAttribute("disabled")
	}
	
});
	function judge()
	{
		var pass="${permission == 2 ? 1 : 2}";
		if(pass==1)
			{
				window.location.href= "${context}/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}

	}
	function message(){
		$('#modal-container-404').modal();
	}
	function onclick1()
	{	
		
		var pass=${reviceState};
		if(pass==1)
			{
				window.location.href="${context}/order/query?page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick2()
	{	
		var pass="${reviceState}";
		if(pass==1)
			{
				window.location.href="${context}/contract/querylist?a=1";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick3()
	{	
		var pass="${reviceState}";
		if(pass==1)
			{
				window.location.href="${context}/product/query";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick4()
	{	
		var pass="${reviceState}";
		var perm="${reviceState}";
	
	if(perm==1){
		document.getElementById("productsend").removeAttribute("disabled");
		document.getElementById("querylist").removeAttribute("disabled")
		document.getElementById("queryagreement").removeAttribute("disabled")
	}
	if(pass==1)
	{  <!--   商品发布页面insertProduct.jsp-->
		window.location.href="${context}/jsp/product/insertProduct.jsp";
	} else {
		$('#modal-container-204152').modal();
	}
	}
	function onclick5()
	{	
		var pass="${reviceState}";
		if(pass==1)
			{
				window.location.href="${context}/ads/queryAdvertisement?reviewState=0";
		} else {
			$('#modal-container-204152').modal();
		}
	} 
	function onclick6()
	{	
		var pass="${reviceState}";
		if(pass==1)
			{
				window.location.href="${context}/logistics/query?state=0&page=1";
		} else {
			$('#modal-container-204152').modal();
		}
	}
function onclick7()
{
	var pass="${reviceState}";
	if(pass==1)
	{
		window.location.href="${context}/logistics/queryorder?page=1";
	} else {
		$('#modal-container-204152').modal();
	}
}
function warring()
	{
		$('#modal-container-204153').modal();
	}

</script>

<body>
	<div class="modal fade" id="modal-container-204153" role="dialog"
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
	<c:set var="user" value="${sessionScope.currentUser}"></c:set>
	<c:if test="${empty user}">
		<c:redirect url="/jsp/user/login.jsp"></c:redirect>
	</c:if>
	<c:set var="permission" value="${user.getPermission()}"></c:set>
	<c:set var="companyType" ></c:set>
	<c:choose>
	    <c:when test="${permission == 1}">
       		<c:set var="companyType" value="采购方"></c:set>
   		</c:when>
   		<c:when test="${permission == 2}">
       		<c:set var="companyType" value="供应商"></c:set>
   		</c:when>
   		<c:when test="${permission == 3}">
       		<c:set var="companyType" value="物流"></c:set>
   		</c:when>
	</c:choose>

	<div class="modal fade" id="modal-container-404" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">审核建议</h4>
				</div>
				<div class="modal-body">
					<c:choose>
						<c:when test="${company.getReviewState()eq 0}">
							当前无审核信息
						</c:when>
						<c:when test="${not empty company.getReviewAdvice()}">
							审核建议：${company.getReviewAdvice()}
						</c:when>
						<c:otherwise>
							审核建议: 无
						</c:otherwise>
					</c:choose>
				</div>
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
		<img alt="分割图" src="${context}/imgs/banner004.png" style="width: 1140px;height: 160px">
	</div>
	<div class="container">
		<div class="row clearfix" >
			<div class="col-md-12 column" style="margin: 20px 0px 20px -15px">
				<div class="panel-body" style="display: inline-block;">
					<a href="${context}/register/doqualification" target="_self">
						<button style="width: 90px; height: 40px"
						  class="btn btn-default btn-primary" type="button"
						  onClick="showReport2()">资质管理</button>
					</a>
				</div>
				<div class="panel-body" style="display: inline-block">
					<button style="width: 90px; height: 40px" class="btn btn-default" disabled="true" id="querylist"
							type="button" onClick="onclick1()">订单查询</button>
				</div>
				<div class="panel-body" style="display: inline-block">
					<button style="width: 90px; height: 40px" class="btn btn-default "  disabled="true" id="queryagreement"
							type="button" onClick="onclick2()">合同查询</button>
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
					<button style="width: 90px; height: 40px" class="btn btn-default "
							type="button" onClick="onclick5()">广告中心</button>
				</div>

				<c:set var="per" value="${user.getPermission()}"></c:set>
				<c:if test="${per.indexOf('3') != -1}">
					<div class="panel-body"  style="display: inline-block">
						<button style="width: 90px; height: 40px"
								class="btn btn-default " type="button" onClick="onclick6()">物流中心</button>
					</div>
				</c:if>
				<c:if test="${per.indexOf('1') != -1 || per.indexOf('2') != -1}">
					<div class="panel-body" style="display: inline-block">
							<%--							 <a href="${context}/logistics/queryorder?page=1"--%>
							<%--									target="_self">--%>
						<button style="width: 90px; height: 40px"
								class="btn btn-default " type="button" onclick="onclick7()" >物流查询</button>
							<%--	</a>--%>
					</div>
				</c:if>
				<div class="row clearfix"  style="display: inline-block;float: right;padding-top: 10px;">
					<div >
						<c:set var="objectCompany1" value="${sessionScope.company1}"></c:set>
						<c:if test="${not empty  companyObj}">
							<c:set var="company" value="${companyObj}"></c:set>
							<c:set var="company1" value="${objectCompany1}"></c:set>
							<tr>
								<td></td>
								<td align="right">审核状况:</td>
								<td align="left">
									<c:choose>
										<c:when test="${reviceState == 0}">
											<c:out value="待审核"></c:out>
										</c:when>
										<c:when test="${reviceState == 1}">
											<c:out value="已审核"></c:out>
										</c:when>
										<c:when test="${reviceState == 3}">
											<c:out value="审核已撤销"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="审核未通过"></c:out>
										</c:otherwise>
									</c:choose>
									<div class="row" style="height: 50px;">
										<div class="col-md-3"  float="left">
											<a class="btn btn-primary" onclick="message()" >审核信息</a>
										</div>
									</div>
								</td>
							</tr>
						</c:if>
					</div>
				</div>
			</div>
			<div class="container-fluid" style="margin-top: 110px;">
				<div class="rowBorder" style="box-shadow: 3px 10px 20px #ccc; padding:0.5cm 0.5cm 0.5cm 0.5cm;">
					<div class="span12">
						<div class="rowTitle" style="height: 30px;margin-bottom: 20px">
							<div class="col-md-3" align="left" style="height:100%;">
								<p><font size="5" >企业基本信息：</font></p>
							</div>
						</div>
						<div class="container" style="width: 100%;">
							<div class="row" style="height: 36px;">
								<div class="col-md-5" align="right">
									<b>企业名称：</b><input type="text" name = "companyName" id = "companyName"
										value="${company.getCompanyName()}" size="15" style="width: 70%;"
										readonly="readonly">
								</div>
								<div class="col-md-6" align="right">
									<b>企业类型：</b> <input type="text"
										value="${companyType}" size="15" style="width: 60%;"
										readonly="readonly"/>
								</div>
							</div>

							<div class="row" style="height: 36px;">
								<div class="col-md-5" align="right">
									<b>法人代表：</b> <input type="text" id = "legalPerson"
										value="${ObjectUtils.defaultIfNull(company.getLegalPerson(), '')}" size="15" style="width: 70%;"
										readonly="readonly"/>
								</div>

								<div class="col-md-6" align="right">
									<b>法人身份证：</b><input type="text" id = "legalPersonId"
										value="${ObjectUtils.defaultIfNull(company.getLegalPersonId(), '')}" size="15" style="width: 60%;" readonly="readonly"/>
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>组织机构代码：</b> <input type="text" id = "companyId"
										value="${ObjectUtils.defaultIfNull(company.getCompanyId(), '')}" size="15"
										style="width: 70%;" readonly="readonly">
								</div>

								<div class="col-md-6" align="right">
									<b>财务姓名：</b><input type="text" id = "accountantName"
										value="${ObjectUtils.defaultIfNull(company.getAccountantName(), '')}" size="15"
										style="width: 60%;" readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>财务邮箱：</b> <input type="text" id = "email"
										value="${ObjectUtils.defaultIfNull(company1.getEmail(), '')}"  size="15"
										style="width: 70%;" readonly="readonly">
								</div>
								<div class="col-md-6" align="right">
									<b>公司注册地址：</b> <input type="text" id = "companyAddress"
										value="${ObjectUtils.defaultIfNull(company.getCompanyAddress(), '')}" size="15"
										style="width: 60%;" readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>公司邮箱：</b> <input type="text" id = "companyEmail"
										value="${ObjectUtils.defaultIfNull(company.getCompanyEmail(), '')}" size="15"
										style="width: 70%;" readonly="readonly">
								</div>
								<div class="col-md-6" align="right">
									<b>联系电话：</b> <input type="text" id = "phoneNumber"
										value="${ObjectUtils.defaultIfNull(company.getPhoneNumber(), '')}" size="15"
										style="width: 60%;" readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>传真：</b> <input type="text" id = "companyFax"
										value="${ObjectUtils.defaultIfNull(company.getCompanyFax(), '')}" size="15"
										style="width: 70%;" readonly="readonly">
								</div>
								<div class="col-md-6" align="right">
									<b>邮政编码：</b> <input type="text" id = "postalCode"
										value="${ObjectUtils.defaultIfNull(company.getPostalCode(), '')}" size="15"
										style="width: 60%;" readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>注册资金：</b> <input type="text" id = "registerMoney"
										value="${ObjectUtils.defaultIfNull(company.getRegisterMoney(), '')}万元" size="15"
										style="width: 70%;" readonly="readonly">
								</div>

								<div class="col-md-6" align="right">
									<b>营业执照：</b> <input type="text" id = "openLicenseId"
										value="${ObjectUtils.defaultIfNull(company.getOpenLicenseId(), '')}" size="15"
										style="width: 60%;" readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>经营许可证：</b>  <input type="text" id = "bussionLicense"
										value="${ObjectUtils.defaultIfNull(company.getBussionLicense(), '')}" size="15"
										style="width: 70%;" readonly="readonly">
								</div>
								<div class="col-md-6" align="right">
									<b>税务登记号：</b><input type="text" id = "taxRegisterId"
										value="${ObjectUtils.defaultIfNull(company.getTaxRegisterId(), '')}" size="15"
										style="width: 60%;" readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>开户银行：</b> <input type="text" id = "openBank"
										value="${ObjectUtils.defaultIfNull(company.getOpenBank(), '')}" size="15"
										style="width: 70%;" readonly="readonly">
								</div>
								<div class="col-md-6" align="right">
									<b>银行账户：</b>  <input type="text" id = "bankAccount"
										value="${ObjectUtils.defaultIfNull(company.getBankAccount(), '')}" size="15"
										value="$" size="15"
										style="width: 60%;"readonly="readonly">
								</div>
							</div>

							<div class="row" style="height:  36px;">
								<div class="col-md-5" align="right">
									<b>财务电话：</b> <input type="text" id = "phone"
										value="${ObjectUtils.defaultIfNull(company1.getPhone(), '')}"  size="15"
										style="width: 70%;" readonly="readonly">
								</div>
								<div class="col-md-6" align="right"  >
									<b>煤源存放地：</b> <input type="text" id = "goodsAddress"
														 value="${ObjectUtils.defaultIfNull(company.getGoodsAddress(), '')}" size="15"
														 style="width: 60%;" readonly="readonly">
								</div>
							</div>


							<div class="row" style="height: 36px;">
								<div class="col-md-5" align="right">
									<b>运输保障能力：</b> <input type="text" id = "transportStyle"
										value="${ObjectUtils.defaultIfNull(company.getTransportStyle(), '')}" ssize="15" style="width: 70%;"readonly="readonly">
								</div>
							</div>

							<div class="row" style="height: 126px;">
								<div class="col-md-12" align="left" style="padding-left: 70px">
									<b>公司简介：</b>
									<textarea name = "companyProfile" id = "companyProfile"  readonly="readonly" style="width: 83.8%;height:100px;vertical-align: middle;">${company.getCompanyProfile()}</textarea>
								</div>
							</div>

							<div class="row" style="height: 50px;">
								<div class="col-md-3" align="left">
								<p><font size="5">企业资质信息：</font></p>
								</div>
							</div>
							<br/>
							<div class="row" style="height: 60px;">
								<div class="col-md-5" align="right">
									<b>营业执照：</b>
									<a href="javascript:void(0);"><img class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getOpenLicensePath(),'')}" style="width:50px;height:50px;"/></a>
									<input class="btn btn-default" type="button" value="下载" style="height: 50px" onclick="testFileUrl('${context}/companyQualificationDown?path=${company.getOpenLicensePath()}')">
								</div>

								<div class="col-md-4" align="right">
									<b>税务登记证：</b>
									<a href="javascript:void(0);"><img class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getTaxRegisterCodePath(),'')}" style="width:50px;height:50px;"/></a>
									<input class="btn btn-default" type="button" value="下载" style="height: 50px" onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getTaxRegisterCodePath()}')">
								</div>
							</div>

							<div class="row" style="height: 60px;">
								<div class="col-md-5" align="right">
									<b>组织机构代码证：</b>
									<a href="javascript:void(0);"><img class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getCompanyCodePath(), '')}" style="width:50px;height:50px;"/></a>
									<input class="btn btn-default" type="button" value="下载" style="height: 50px" onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getCompanyCodePath()}')">
								</div>
								<div class="col-md-4" align="right">
									<b>开户许可证：</b>
									<a href="javascript:void(0);"><img class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getBankAccountCodePath(), '')}" style="width:50px;height:50px;"/></a>
									<input class="btn btn-default" type="button" value="下载" style="height: 50px" onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getBankAccountCodePath()}')">
								</div>
							</div>

							<div class="row" style="height: 60px;margin-bottom: 30px;" >
								<div class="col-md-5" align="right">
									<b>法人身份证：</b>
									<a href="javascript:void(0);"><img class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getLegalPersonCodePath(), '')}" style="width:50px;height:50px;"/></a>
									<input class="btn btn-default" type="button" value="下载" style="height: 50px" onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getLegalPersonCodePath()}')">
								</div>

								<div class="col-md-4" align="right">
									<b>经营许可证：</b>
									<a href="javascript:void(0);"><img class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getBussionLicenseCodePath(),'')}" style="width:50px;height:50px;"/></a>
									<input class="btn btn-default" type="button" value="下载" style="height: 50px" onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getBussionLicenseCodePath()}')">
								</div>
							</div>

							<div class="row" style="height: 50px;">
								<div class="col-md-12" align="center">
									<c:choose>
										<c:when test="${empty companyObj.companyId}">
											<a href="${context}/jsp/user/com_qualification_update.jsp" class="btn btn-primary">完善信息</a>
										</c:when>
										<c:otherwise>
											<a href="${context}/jsp/user/com_qualification_update.jsp" class="btn btn-primary">修改信息</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:set var="realPath" value="this.getServletContext().getRealPath(company.getOpenLicensePath())"></c:set>
		</div>
	</div>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 34px">
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