<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"%>

<%@ include file="/jsp/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${context }/js/user/regist.js"></script>
<link rel="stylesheet" type="text/css" href="${context }/js/user/regist.css">

<script type="text/javascript">
$(function () {
	var perm = ${currentUser.permission };

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
	
	function validateIsNull(){
		
		var v1=$('#inputQuantity').val();
		var v2=$('#inputLowPower').val();
		var v3=$('#inputPrice').val();
		var v4=$('#inputFullSulfur').val();
		var v5=$('#inputSrcAddress').val();
		var v6=$('#inputCarriage').val();
		var v7=$('#inputVolatiles').val();
		var v8=$('#inputPortAddress').val();
		var v9=$('#inputDryPowder').val();
		var v0=$('#inputFullMoisture').val();
       if(v1==null || v1==""){
    	   $('#modal-container-204155').modal();
 			return false;
		}	
       if(v2==null || v2==""){
    	   $('#modal-container-204156').modal();
			return false;
		}	
       if(v3==null || v3==""){
    	   $('#modal-container-204157').modal();
			return false;
		}	
       if(v4==null || v4==""){
    	   $('#modal-container-204158').modal();
			return false;
		}	
      if(v5==null || v5==""){
    	  $('#modal-container-204159').modal();
			return false;
		}	
      if(v6==null || v6==""){
    	  $('#modal-container-204160').modal();
			return false;
		}	
      if(v7==null || v7==""){
    	  $('#modal-container-204161').modal();
			return false;
      }	
     if(v8==null || v8==""){
    	 $('#modal-container-204162').modal();
			return false;
     }	
     if(v9==null || v9==""){
    	 $('#modal-container-204163').modal();
			return false;
     }	
     if(v0==null || v0==""){
    	 $('#modal-container-204164').modal();
			return false;
     }	
     
     if(rsQuantity && rsLowPower && rsPrice && rsFullSulfur && rsSrcAddress && rsCarriage && rsVolatiles && rsPortAddress && rsDryPowder && rsFullMoisture){
    	 if(v1!=""&& v2!=""&& v3!=""&& v4!=""&& v5!=""&& v6!=""&& v7!=""&& v8!=""&& v9!=""&& v0!=""){
    	    	$('#modal-container-954264').modal();
    	 }
    	 return true;
     }else{
    	 $('#modal-container-204165').modal();
    	 return false;
     }
		    
	}
</script>

<script>
$(function(){
			$("#inputAffirm").click(function(){
				$("#inputPublish").attr('type','submit');
				$("#modal-954264").hide();
				$(".inputClass").prop('readonly',true);
				$('#next').hide();
			})
          })
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
				<div class="modal-body">供应数量是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204156" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">热值是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204157" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">原煤单价是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204158" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">全硫是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204159" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">产地是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204160" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">运费单价是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204161" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">挥发分是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204162" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">发站(发货港口)是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204163" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">空干基灰分是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204164" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">全水分是必填项</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204165" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">请核对信息！</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
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
			<div class="panel-body" style="display: inline-block">
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
						style="width: 90px; height: 40px" class="btn btn-default " id="productselect"
						disabled="true"	type="button" onClick="showReport1()">商品查询</button></a>
			</div>
			<div class="panel-body" style="display: inline-block">
				<a href="${context}/jsp/product/insertProduct.jsp" target="_self"><button
						style="width: 90px; height: 40px" class="btn btn-default btn-primary " id="productsend"
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
	<!-- 点击商品发布页面 -->
		<div class="locationD">
			<p class="btn btn-primary" style="font-family: 宋体">
				<span style="color: black">当前位置：</span>报价信息
			</p>
		</div>

		<div class="container" style="margin-top: 40px;">
			<div class="row">
				<div class="span12">
					<div class="container">
					    <form action="${context }/product/insert" method="post" onSubmit="return validProduct()">
							 <div class="row" style="height: 40px;">
							   <div class="col-md-9" align="right" >
								   <b>供应数量(万吨):</b> 
								   <input class="inputClass" type="text"  name=quantity id="inputQuantity" size="17" style="width: 40%" />
							  <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							   </div>
							   
							   <div class="" class="col-md-9" align="left" >
							       <label class="errorClass" id="inputQuantityError" ></label>
							   </div>
							 </div>
						  							  
							   <div class="row" style="height: 40px;">
							      <div class="col-md-9" align="right">
								     <b>热值(KCal/Kg)≥：</b> 
								     <input class="inputClass" type="text"  name="lowPower" id="inputLowPower" size="17"style="width: 40%">
							  <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							      </div>
							      
							    
							      <div class="" class="col-md-9" align="left" >
							         <label class="errorClass" id="inputLowPowerError" ></label>
							      </div>
							  </div>

							 <div class="row" style="height: 40px;">
							   <div class="col-md-9" align="right" >
								  
								  <b>原煤单价(元/吨)：</b> 
								   <input class="inputClass" type="text" name="price" id="inputPrice" size="17"style="width: 40%">
							     <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							   
							    <div class="" class="col-md-9" align="left" >
							      	 <label class = "errorClass" id="inputPriceError"></label>
							    </div>
							  </div>
							  
							  <div class="row" style="height: 40px;">
							    <div class="col-md-9" align="right">
								     <b>全硫(%)≤:</b> 
								     <input class="inputClass" type="text"  name="fullSulfur" id="inputFullSulfur" size="17"style="width: 40%">
							     <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							  
							    <div  class = "" class="col-md-9" align="left">
							         <label class="errorClass" id ="inputFullSulfurError"></label>
							    </div>
							  </div>

							 <div class="row" style="height: 40px;">
							   <div class="col-md-9" align="right" >
								  <b>产地：</b> 
								   <input class = "inputClass" type="text"  name="srcAddress" id="inputSrcAddress" size="17"style="width: 40%">
							      <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							  
							    <div class ="" class="col-md-9" align="left" >
							      	 <label class="errorClass" id="inputSrcAddressError"></label>
							    </div>
							 </div>
							 
							  <div class="row" style="height: 40px;">
							    <div class="col-md-9" align="right">
								     <b>运费单价(元/吨)：</b> 
								     <input class="inputClass" type="text" name="carriage" id="inputCarriage" size="17"style="width: 40%">
							  <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							    
							    <div class="" class="col-md-9" align="left">
							         <label class="errorClass"  id="inputCarriageError"></label>
							    </div>
							  </div>

							 <div class="row" style="height:40px">
							   <div class="col-md-9" align="right" >
								  <b>挥发份(%)：</b> 
								   <input class="inputClass" type="text"  name="volatiles" id="inputVolatiles" size="17"style="width: 40%">
							    <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							    
							    <div class="" class="col-md-9" align="left" >
							      	 <label class="errorClass" id="inputVolatilesError"></label>
							    </div>
							  </div>
							  
							  <div class="row" style="height:40px">
							    <div class="col-md-9" align="right">
								     <b>发站(发货港口)：</b> 
								     <input class="inputClass" type="text" name="portAddress" id="inputPortAddress" size="17"style="width: 40%">
							      <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							 
							    <div class="" class="col-md-9" align="left">
							         <label class="errorClass" id="inputPortAddressError"></label> 
							    </div>
							  </div>

							 <div class="row" style="height: 40px;">
							   <div class="col-md-9" align="right" >
								  <b>空干基灰分：</b> 
								   <input class="inputClass" type="text"  name="dryPowder" id="inputDryPowder" size="17"style="width: 40%">
							    <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							   
							    <div class="" class="col-md-9" align="left" >
							      	 <label class="errorClass" id="inputDryPowderError"></label>
							    </div>
							  </div>
							  
							<div class="row" style="height: 40px;">
							    <div class="col-md-9" align="right">
								     <b>全水分(%)≤：</b> 
								     <input class="inputClass" type="text"  name="fullMoisture" id="inputFullMoisture" size="17"style="width: 40%">
							   <span style="color:red ;font-size: 20px" title="必填项" >*</span>
							    </div>
							    
							    <div class="" class="col-md-9" align="left">
							         <label class="errorClass" id="inputFullMoistureError"></label>
							    </div>
							  </div>

						
						<br>
						
						<br>
						<div class="row" style="height: 30px">
												
							
							<div class="col-md-4" >
												<div class="container">
													<div class="row clearfix">
													</div>
												</div>

											</div><!-- href="#modal-container-954264" -->
							<div style="position: absolute;left:50%;top:950px">
								<a id="next"
									role="button" class="btn btn-primary"
									onclick="return validateIsNull()">下一步</a>
							</div>
							<div class="col-md-4" style="position: absolute;left:50%;top:950px" >
								<input type="hidden" class="btn btn-primary" value="发布" id="inputPublish" hidden="true" ></input>
							</div>
							  <div  style="position: absolute;left:57%;top:950px">
								<button type="button" class="btn btn-primary"
									onclick="window.location.href ='${context }/jsp/product/insertProduct.jsp'">返回</button>
							 </div>
						  </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- 页面底部 -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12 column">
															<div class="modal fade" id="modal-container-954264"
																role="dialog" aria-labelledby="myModalLabel"
																aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true"></button>
																			<h4 class="modal-title" id="myModalLabel">保证金</h4>
																		</div>
																		<div class="modal-body">是否缴纳保证金？</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-primary"
																				id="inputAffirm" data-dismiss="modal">确认</button>
																			<button type="button" class="btn btn-default"
																				data-dismiss="modal">取消</button>

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

</script>
</body>
</html>