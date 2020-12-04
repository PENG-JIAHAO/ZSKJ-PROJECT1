<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="org.apache.commons.lang3.ObjectUtils"%>
<%@ page pageEncoding="UTF-8"
		import="java.util.*"
		import="com.isscollege.gdce.domain.User"%>
<%@page import="java.util.List"
	    import="com.isscollege.gdce.domain.Company"%>
<%@ include file="/jsp/header.jsp"%>
<script charset="utf-8" type="text/javascript" src="${context}/js/user/regist.js"></script>
<link rel="stylesheet" type="text/css" href="${context}/js/user/regist.css">
<script charset="utf-8" type="text/javascript">

	function judge()
	{
		var pass="${permission == 3 ? 1 : 2}";
		if(pass==1)
			{
				window.location.href="${context}/jsp/report/reportIndex.jsp";
		} else {
			$('#odal-container-204152').modal();
		}
	}
	//检测所有的文本框
	function Cmd(){
		var ipt = document.getElementById("test").getElementsByTagName("input");
		for(var i=0; i < ipt.length; i++){
			 if(ipt[i].value.length == 0){
				ipt[i].focus(); //定位到没有填写的文本框
				document.forms[0].target = "rfFrame";
				return false; //返回false
			}
		}
		if(validateOpenLicensePath()==false){
			document.forms[0].target = "rfFrame";
			return false;
		}else{
		}
	}
  
					    $(function() {
					  
								$("#companyId").blur(function (){
								 var rs=validateCompanyId();
								
								if(!rs){return} 
								var companyId = $("#companyId").val();
					         	$.ajax({
			                 	type:"get",
			                	url:"${context}/register/findcompanyId?companyId="+companyId,
		                      	dataType:"json",
			             		success:function (result){
			         			if(result == true){
							      	$("#msg").html("<font color='red'>企业代码已存在！</font>");
			                 	}else{
					        		$("#msg").html("<font color='green'>可以注册</font>");
						    			}
				                     	}		
				               	});
				                });
						          $("#companyId").focus(function ()
						          {
			                 	   $("#msg").html("");
	                     		  });	
		                   });

	  		 function checkAll(){
	  			if(validateUpLoadFile()&&validateTaxRegisterCodePath()
	  					&&validateCompanyCodePath()&&validateBankAccountCodePath()&&validateLegalPersonCodePath()&&validateBussionLicenseCodePath()&&validateCompanyName()&&validateCompanyId()&&validateAccountantName()&&validateLegalPerson()&&validateLegalPersonId()
	  					&&validateEmail()&&validateCompanyEmail()&&validateCompanyAddress()&&validatePhoneNumber()&&validatePhone()&&validateCompanyProfile()&&validateGoodsAddress()&&
	  					validateCompanyFax()&&validatePostalCode()&&validateRegisterMoney()&&validateOpenLicenseId()&&validateBussionLicense()&&validateTaxRegisterId()
	  					&&validateOpenBank()&&validateBankAccount()&&validateTransportStyle())
	  			{
	  				
	  				return true;
	  			}
	  			else
	  			{
	  				$('#modal-container-204155').modal();
	  				return false;
	  			}
	  			 if(permission.equals("3"))
	  			 {
	  				if(validateUpLoadFile()&&validateTaxRegisterCodePath()
		  					&&validateCompanyCodePath()&&validateBankAccountCodePath()&&validateLegalPersonCodePath()&&validateBussionLicenseCodePath()&&validateCompanyName()&&validateCompanyId()&&validateAccountantName()&&validateLegalPerson()&&validateLegalPersonId()
		  					&&validateEmail()&&validateCompanyEmail()&&validateCompanyAddress()&&validatePhoneNumber()&&validatePhone()&&validateCompanyProfile()&&
		  					validateCompanyFax()&&validatePostalCode()&&validateRegisterMoney()&&validateOpenLicenseId()&&validateBussionLicense()&&validateTaxRegisterId()
		  					&&validateOpenBank()&&validateBankAccount()&&validateTransportStyle()){
		  				
		  					return true;
		  			}
	  			} 
	  			
	  			else
	  			{
	  				alert("请完成表单");
	  				return false;
	  			}
	  		} 
		function warring()
		{
			$('#modal-container-204152').modal();
		}
</script>

<script src="${context}/js/jquery/imgViewer.js"></script>
<script>
	$.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
</script>
	  			
<body id="test">
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
<div class="modal fade" id="modal-container-204155" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">请完善企业资质信息</div>
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
				<div class="modal-body">该功能暂未开放</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-right" style="margin-bottom: 0%">
	${currentUser.name } &nbsp; &nbsp;
	<a	href="${context}/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
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
		<img --alt="分割图" src="${context}/imgs/banner004.png";>
	</div>
	<div class="locationD" ; align="center" class="col-lg-10 column">
		<h2>会员中心</h2>
		<h3>企业资质信息修改</h3>
	</div>
	<div class="container">
		<div class="row ">
					</div>
					<div class="col-lg-10 column">
						<h4 align="center">${empty msg?'':msg}</h4> 
						<c:set var="company1" value="${sessionScope.company1}"></c:set>
						<c:set var="company" value="${sessionScope.company}"></c:set>
						<c:if test="${not empty company}">
							<form action="${context}/register/addcompany" id="right" method="post" onSubmit="return checkAll()" enctype="multipart/form-data">
						     <div class="container" style="margin-top: 0%;">
								<div class="row">
									<div class="span12" >
										<div class="row" style="height: 30%;">
											<div class="col-lg-3" align="left">
												<p><font size="5">企业基本信息</font></p>
											</div>
										</div>
										<div class="container" id="test"
											style="box-shadow: 5% 5% 20% #ccc; padding:0.5cm 2cm 0.5cm 0cm;">
											<div class="row" style="height: 40%;">
													<div class="col-lg-4 col-md-4 col-xs-4" align="right">
														<font color="red" size="4">*</font><b>企业名称：</b>
														<input type="text" class="inputClass" placeholder="企业名称:(中文)长度3 ~ 20之间！" id = "companyName" 
															name="companyName" value="${company.getCompanyName()}" style="width:70%;">
													</div>
													<div class="col-lg-2 col-md-2 col-xs-2" align="left">
													<label class="errorsClass" id="companyNameError"></label>
													</div>
													<div class="col-lg-4 col-md-4 col-xs-4" align="right">
														<font color="red" size="4">*</font><b>企业类型：</b> 
														<input type="text" class="inputClass"  id = "companyType" name ="companyType"
															value="${companyType}" readonly="readonly" style="width:70%;"/>
													</div>
													<div class="col-lg-2 col-md-2 col-xs-2" align="right">
													</div>
													
											</div>
											
											<span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>企业代码：</b> <input placeholder="企业代码为18位数字!" type="text" class = "inputClass" id = "companyId"
														name = "companyId"  value="${company.getCompanyId()}" >
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												 <label class="errorsClass" id="companyIdError"></label> 
												<span class="msgClass" id="msg"></span>
											    </div>
											
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>财务姓名：</b> <input type="text" class = "inputClass" placeholder="姓名:(中文)长度在2 ~ 10之间！" id = "accountantName"
														name = "accountantName" value="${company.getAccountantName()}" >
												</div>			
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="accountantNameError"></label>
											    </div>
											</div>
											
					                        <span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>法人代表：</b> <input type="text" name = "legalPerson" id = "legalPerson" class="inputClass" placeholder="姓名:(中文)长度在2 ~ 10之间！"
														value="${company.getLegalPerson()}" style="width:70%;">
												</div>
												
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="legalPersonError"></label>
												</div>
												
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>法人身份证：</b> <input type="text" name = "legalPersonId" id = "legalPersonId" class="inputClass" placeholder="身份证:填写正确的格式！"
														value="${company.getLegalPersonId()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="legalPersonIdError"></label>
											    </div>
											</div>
											
					                        <span style="height:8px " class="col-lg-12"></span>
					
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>财务邮箱：</b> <input type="text" name = "email" id = "email" class="inputClass" placeholder="例如:123456@xxx"
														value="${company1.getEmail()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="emailError"></label>
											    </div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>注册地址：</b> <input type="text" name = "companyAddress" id = "companyAddress" class = "inputClass" placeholder="请输入正确注册地址！"
														value="${company.getCompanyAddress()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="companyAddressError"></label>
											    </div>
											</div>
											
					                        <span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>公司邮箱：</b> <input type="text" name = "companyEmail" id = "companyEmail" class = "inputClass" placeholder="例如:123456@xxx"
														value="${company.getCompanyEmail()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="companyEmailError"></label>
											    </div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>联系电话：</b> <input type="text" name = "phoneNumber" id = "phoneNumber" class = "inputClass" placeholder="请输入固话或手机！"
														value="${company.getPhoneNumber()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="phoneNumberError"></label>
											    </div>
											</div>
											
											<span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>传真：</b> <input type="text" class = "inputClass" name = "companyFax" id = "companyFax"  placeholder="输入正确的传真格式！"
														value="${company.getCompanyFax()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="companyFaxError"></label>
											    </div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>邮政编码：</b> <input type="text" name = "postalCode" id = "postalCode" class = "inputClass"  placeholder="请输入6位数字！"
														value="${company.getPostalCode()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="postalCodeError"></label>
											    </div>
											</div>
											
											<span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>注册资金(万)：</b> <input type="text" name = "registerMoney" id = "registerMoney" class = "inputClass"  placeholder="注册资金:小数点最多保留2位！"
														value="${company.getRegisterMoney()}" >
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="registerMoneyError"></label>
											    </div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>营业执照：</b> <input type="text" name = "openLicenseId" id = "openLicenseId" class = "inputClass" placeholder="营业执照为13位数字！"
														value="${company.getOpenLicenseId()}"style=width:70%;>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass" id="openLicenseIdError"></label>
											    </div>
											</div>
											
											<span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>经营许可证：</b> <input type="text" name = "bussionLicense" id = "bussionLicense" class = "inputClass" placeholder="输入15位的经营许可证！"
														value="${company.getBussionLicense()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass"  id="bussionLicenseError"></label>
											    </div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>税务登记号：</b> <input type="text" name = "taxRegisterId" id = "taxRegisterId" class = "inputClass" placeholder="税务登记号为13位数字"
														value="${company.getTaxRegisterId()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												 <label class="errorsClass"  id="taxRegisterIdError"></label>
											    </div>
											</div>
											
											<span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>开户银行：</b> <input type="text" name = "openBank" id = "openBank" class = "inputClass" placeholder="中国银行"
														value="${company.getOpenBank()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												 <label class="errorsClass"  id="openBankError"></label>
											    </div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>银行账户：</b> <input type="text" name = "bankAccount" id = "bankAccount" class = "inputClass" placeholder="银行账户为18位数字"
														value="${company.getBankAccount()}" style="width:70%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass"  id="bankAccountError"></label>
											    </div>
											</div>
											
											<span style="height:8px " class="col-lg-12"></span>
											
											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>财务电话：</b> <input type="text" name = "phone" id = "phone" class= "inputClass" placeholder="财务电话为座机号"
														value="${company1.getPhone()}" style="width 30%;">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">
												<label class="errorsClass"  id="phoneError"></label>
												</div>
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">*</font><b>煤源： </b> <input type="text" name = "goodsAddress" id = "goodsAddress" class = "inputClass" placeholder="煤源字数在1-20之间！"
																										  value="${company.getGoodsAddress()}" style="width:70%;">
												</div>
												<div class="col-lg-2" style="display: inline-block">
													<label class="errorsClass"  id="goodsAddressError"></label>
												</div>
											</div>

											<span style="height:8px " class="col-lg-12"></span>

											<div class="row" style="height: 40%;">
												<div class="col-lg-4 col-md-4 col-xs-4" align="right">
													<font color="red" size="4">&nbsp&nbsp&nbsp&nbsp*</font><b>运输能力：</b> <input type="text" name = "transportStyle" id = "transportStyle" class = "inputClass"  placeholder="运输能力不超过15位"
														value="${company.getTransportStyle()}">
												</div>
												
												<div class="col-lg-2">
												    <label class="errorsClass"  id="transportStyleError"></label>
											    </div>
											</div>
											
											<span style="height:6px " class="col-lg-12"></span>
											
											<div class="row" style="height: 126px">
												<div class="col-lg-10" align="left">
													<font color="red" size="4">&nbsp&nbsp&nbsp&nbsp&nbsp*</font><b>公司简介：</b>
													<textarea name = "companyProfile" id = "companyProfile" class = "inputClass"  placeholder="公司简介不超过300位" style="width:88.3% ; height:100px;vertical-align: middle;position:relative;left: -1px">${company.getCompanyProfile()}</textarea>
												</div>

                                                <div class="col-lg-2">
												    <label class="errorsClass"  id="companyProfileError"></label>
                                                </div>
                                            </div>

											
											
											<div class="row" style="height: 50px;">
												<div class="col-lg-3" align="left">
													<p><font size="5">企业资质信息</font></p>
												</div>
											</div>


											<br/>
											<div class="row" style=" height: 50px; margin-left: -200px" >
											    <div class="col-lg-1 col-md-1 col-xs-1" >
												</div>
												<div class="col-lg-3" align="right" >
															 <font color="red" size="4">*</font><b>营业执照：</b>
													<a href="javascript:void(0);"><img id="image6" class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getOpenLicensePath(),'')}" style="width:50px;height:50px;"/></a>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">								
															 <input name="openLicensePath"  type = "file" class = "inputClass" accept=".png" onchange="changImg(event,'image6')" id = "upLoadFile" style="width  30%;border-style:none" value="${request.getContextPath()}${company.getOpenLicensePath()} ">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="center">	
															 <img class="viewer-item"  style="display:none" height="50" width="50" >
												</div> 
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" >             
												             <label class = "errorsClass" id="upLoadFileError"></label>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2"  >
											    </div>
											</div>
											
											<div class="row" style="height:50px; margin-left: -200px">
											    <div class="col-lg-1 col-md-1 col-xs-1" >
												</div>
												<div class="col-lg-3" align="right">
														     <font color="red" size="4">*</font><b>税务登记证：</b>
													<a href="javascript:void(0);"><img id="image5" class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getTaxRegisterCodePath(),'')}" style="width:50px;height:50px;"/></a>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" > 
														     <input type = "file" class = "inputClass"  style="width 30%;border-style:none" accept=".png" onchange="changImg(event,'image5')" name = "taxRegisterCodePath" id = "taxRegisterCodePath" value="${request.getContextPath()}${company.getTaxRegisterCodePath()}">
												</div>
												 <div class="col-lg-2 col-md-2 col-xs-2" align="center">	
															 <img class="viewer-item" style="display:none"  height="50" width="50" ><!-- <input  onchange="changImg(event,'image1')" name="file"  type="file" class="file"> -->
												</div> 
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" > 			
															 <label class="errorsClass"  id="taxRegisterCodePathError"></label>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2"  >
											    </div>
											</div>
											
											<div class="row" style="height:50px; margin-left: -200px">
											    <div class="col-lg-1 col-md-1 col-xs-1" >
												</div>
												<div class="col-lg-3" align="right">
															 <font color="red" size="4">*</font><b>组织机构代码证：</b>
													<a href="javascript:void(0);"><img class="viewer-item" id="image4" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getCompanyCodePath(), '')}" style="width:50px;height:50px;"/></a>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" > 				
															 <input type = "file" class = "inputClass" style="width 30%;border-style:none" accept=".png" onchange="changImg(event,'image4')" name = "companyCodePath" id = "companyCodePath" value="${company.getCompanyCodePath()}">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="center">	
															 <img class="viewer-item" style="display:none" height="50" width="50" ><!-- <input  onchange="changImg(event,'image1')" name="file"  type="file" class="file"> -->
												</div>	 	
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" > 			
														     <label class="errorsClass"  id="companyCodePathError"></label>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2"  >
											    </div>
											</div>
											
											<div class="row" style="height:50px; margin-left: -200px">
											    <div class="col-lg-1 col-md-1 col-xs-1" >
												</div>
												<div class="col-lg-3" align="right">
															 <font color="red" size="4">*</font><b>开户许可证：</b>
													<a href="javascript:void(0);"><img id="image3"  class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getBankAccountCodePath(), '')}" style="width:50px;height:50px;"/></a>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" >			    
															 <input type = "file" class = "inputClass" style="width 30%;border-style:none" accept=".png" onchange="changImg(event,'image3')" name = "bankAccountCodePath" id = "bankAccountCodePath" value="${request.getContextPath()}${company.getBankAccountCodePath()}">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="center">	
															  <img class="viewer-item" style="display:none" height="50" width="50" ><!-- <input  onchange="changImg(event,'image1')" name="file"  type="file" class="file"> -->
															    </div>	 		
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" >
															  <label class="errorsClass"  id="bankAccountCodePathError"></label>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2"  >
											    </div>
											</div>
											
											<div class="row" style="height: 50px; margin-left: -200px">
											    <div class="col-lg-1 col-md-1 col-xs-1" >
												</div>
												<div class="col-lg-3" align="right">
															 <font color="red" size="4">*</font><b>法人身份证：</b>
													<a href="javascript:void(0);"><img class="viewer-item" id="image2" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getLegalPersonCodePath(), '')}" style="width:50px;height:50px;"/></a>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">			
															 <input type = "file" class = "inputClass" style="width 30%;border-style:none" accept=".png" name = "legalPersonCodePath" onchange="changImg2(event,'image2')" id = "legalPersonCodePath" value="${request.getContextPath()}${company.getLegalPersonCodePath()}">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="center">	
															 <img class="viewer-item" style="display:none"  height="50" width="50" ><!-- <input  onchange="changImg(event,'image1')" name="file"  type="file" class="file"> -->
<%--													<img class="viewer-item" id="image2" style="display:none"  height="50" width="50" >--%>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">			
															 <label class="errorsClass"  id="legalPersonCodePathError"></label>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2"  >
											    </div>
											</div>
											
											<div class="row" style="height: 50px; margin-left: -200px">
											    <div class="col-lg-1 col-md-1 col-xs-1" >
												</div>
												<div class="col-lg-3" align="right">
															 <font color="red" size="4">*</font><b>经营许可证：</b>
													<a href="javascript:void(0);"><img id="image1" class="viewer-item" src="${context}/register/loadQualificationImage?path=${ObjectUtils.defaultIfNull(company.getBussionLicenseCodePath(),'')}" style="width:50px;height:50px;"/></a>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left">			    
															 <input type="file" class = "inputClass" style="width 30%;border-style:none" accept=".png" name = "bussionLicenseCodePath" onchange="changImg(event,'image1')" id = "bussionLicenseCodePath" value="${request.getContextPath()}${company.getBussionLicenseCodePath()}">
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="center">	
															 <img class="viewer-item" style="display:none"   height="50" width="50" ><!-- <input  onchange="changImg(event,'image1')" name="file"  type="file" class="file"> -->
												</div> 
											    <div class="col-lg-2 col-md-2 col-xs-2" align="left">
															 <label class="errorsClass"  id="bussionLicenseCodePathError"></label>
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2"  >
											    </div>           
											</div>
			
	  		 <script type="text/javascript">
	  		function changImg(e,name) {
	  	    for (var i = 0; i < e.target.files.length; i++) {
	  	        var file = e.target.files.item(i);
	  	        if (!(/^(\s|\S)+(PNG)+$/i.test(file.type))) { //用正则表达式判断是否是图片类型
					alert("上传文件格式有误");
					e.target.value="";
	  	            continue; //不是图片 就跳出这一次循环
	  	        }
	  	        //实例化FileReader API
	  	        var freader = new FileReader();
	  	        freader.readAsDataURL(file);
	  	        freader.onload = function (e) {
					console.log(e.target.result);
					$("#" + name).attr("src", e.target.result);
					$("#" + name).css({"display": "inline"});
				}
	  	        }
	  	}
	  	function changImg2(e,name) {
		  	    for (var i = 0; i < e.target.files.length; i++) {
		  	        var file = e.target.files.item(i);
		  	        if (!(/^image\/.*$/i.test(file.type))) {
		  	            continue; //不是图片 就跳出这一次循环
		  	        }
		  	        //实例化FileReader API
		  	        var freader = new FileReader();
		  	        freader.readAsDataURL(file);
		  	        freader.onload = function (e) {
		  	            console.log(e.target.result);
		  	            $("#"+ name).attr("src", e.target.result);
		  	          $("#"+ name).css({"display":"inline"});
		  	        }
		  	    }
		  	}
	  	
	  	function changImg3(e,name) {
	  	    for (var i = 0; i < e.target.files.length; i++) {
	  	        var file = e.target.files.item(i);
	  	        if (!(/^image\/.*$/i.test(file.type))) {
	  	            continue; //不是图片 就跳出这一次循环
	  	        }
	  	        //实例化FileReader API
	  	        var freader = new FileReader();
	  	        freader.readAsDataURL(file);
	  	        freader.onload = function (e) {
	  	            console.log(e.target.result);
	  	            $("#"+ name).attr("src", e.target.result);
	  	          $("#"+ name).css({"display":"inline"});
	  	        }
	  	    }
	  	}
	  	
	  	function changImg4(e,name) {
	  	    for (var i = 0; i < e.target.files.length; i++) {
	  	        var file = e.target.files.item(i);
	  	        if (!(/^image\/.*$/i.test(file.type))) {
	  	            continue; //不是图片 就跳出这一次循环
	  	        }
	  	        //实例化FileReader API
	  	        var freader = new FileReader();
	  	        freader.readAsDataURL(file);
	  	        freader.onload = function (e) {
	  	            console.log(e.target.result);
	  	            $("#"+ name).attr("src", e.target.result);
	  	          $("#"+ name).css({"display":"inline"});
	  	        }
	  	    }
	  	}
	  	function changImg5(e,name) {
	  	    for (var i = 0; i < e.target.files.length; i++) {
	  	        var file = e.target.files.item(i);
	  	        if (!(/^image\/.*$/i.test(file.type))) {
	  	            continue; //不是图片 就跳出这一次循环
	  	        }
	  	        //实例化FileReader API
	  	        var freader = new FileReader();
	  	        freader.readAsDataURL(file);
	  	        freader.onload = function (e) {
	  	            console.log(e.target.result);
	  	            $("#"+ name).attr("src", e.target.result);
	  	          $("#"+ name).css({"display":"inline"});
	  	        }
	  	    }
	  	}
	  	function changImg6(e,name) {
	  	    for (var i = 0; i < e.target.files.length; i++) {
	  	        var file = e.target.files.item(i);
	  	        if (!(/^image\/.*$/i.test(file.type))) {
	  	            continue; //不是图片 就跳出这一次循环
	  	        }
	  	        //实例化FileReader API
	  	        var freader = new FileReader();
	  	        freader.readAsDataURL(file);
	  	        freader.onload = function (e) {
	  	            console.log(e.target.result);
	  	            $("#"+ name).attr("src", e.target.result);
	  	          $("#"+ name).css({"display":"inline"});
	  	        }
	  	    }
	  	}
	  		</script>   
	  		                           <span style="height:40px " class="col-lg-12"></span>
	  		                                    <div class="col-lg-2 col-md-2 col-xs-2"></div>
										        <div class="col-lg-2 col-md-2 col-xs-2" align="center" style="box-shadow: 5% 5% 10% #ccc; ">
												 <input type="submit" id="submit"  class="btn btn-primary" />
												</div>
												<div class="col-lg-2 col-md-2 col-xs-2" align="left" style="box-shadow: 5% 5% 20% #ccc; ">
												<button type="button" class="btn btn-primary"
														onclick="window.location.href ='${context}/register/doqualification'">返回</button>
												</div>
								</div>
									</div>
								</div>
							</div> 
						</form>
						<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
						</c:if>
					
					</div>
				</div>
	
	
	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 8%">
		
		<h5>
			<a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
			网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
		
	</div>
	<!-- ------------------------------------ -->
</body>
</html>