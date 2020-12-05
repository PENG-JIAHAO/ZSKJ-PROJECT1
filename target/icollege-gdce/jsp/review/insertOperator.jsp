<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
		
		var v1=$('#inputOperatorName').val();
		var v2=$('#inputOperatorId').val();
		var v3=$('#inputContacter').val();
		var v4=$('#inputTelephone').val();
		var v5=$('#inputAddress').val();
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
				<div class="modal-body">运营商是必填项</div>
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
				<div class="modal-body">运营编号是必填项</div>>
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
				<div class="modal-body">联系人是必填项</div>
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
				<div class="modal-body">电话是必填项</div>
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
				<div class="modal-body">地址是必填项</div>
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
<%--	<c:if test="${empty currentUser}">
		<c:redirect url="/jsp/user/login.jsp"></c:redirect>
	</c:if>--%>
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

<!-- 点击新增运营商页面 -->
<div class="tabs-contents">
	<div class="tab-content" style="margin-top: 10px;">
			<div class="row">
				<form action="${context}/product/insert" method="post" onSubmit="return validProduct()">
					<div class="row" style="height: 40px;">
					   <div class="col-md-9" align="right" >
						   <b>运营商（统一简称）:</b>
						   <input class="inputClass" type="text"  name=operatorName id="inputOperatorName" size="17" style="width: 40%" />
					  <span style="color:red ;font-size: 20px" title="必填项" >*</span>
					   </div>
					   <div class="" class="col-md-9" align="left" >
						   <label class="errorClass" id="inputOperatorNameError" ></label>
					   </div>
					 </div>

					<div class="row" style="height: 40px;">
						  <div class="col-md-9" align="right">
							 <b>运营编号：</b>
							 <input class="inputClass" type="text"  name="operatorId" id="inputOperatorId" size="17"style="width: 40%">
					  <span style="color:red ;font-size: 20px" title="必填项" >*</span>
						  </div>
						  <div class="" class="col-md-9" align="left" >
							 <label class="errorClass" id="inputOperatorIdError" ></label>
						  </div>
					  </div>

					<div class="row" style="height: 40px;">
					   <div class="col-md-9" align="right" >
						  <b>联系人：</b>
						   <input class="inputClass" type="text" name="contacter" id="inputContacter" size="17"style="width: 40%">
						 <span style="color:red ;font-size: 20px" title="必填项" >*</span>
						</div>
						<div class="" class="col-md-9" align="left" >
							 <label class = "errorClass" id="inputContacterError"></label>
						</div>
					  </div>

					<div class="row" style="height: 40px;">
						<div class="col-md-9" align="right">
							 <b>电话:</b>
							 <input class="inputClass" type="text"  name="telephone" id="inputTelephone" size="17"style="width: 40%">
						 <span style="color:red ;font-size: 20px" title="必填项" >*</span>
						</div>
						<div  class = "" class="col-md-9" align="left">
							 <label class="errorClass" id ="inputTelephoneError"></label>
						</div>
					  </div>

					<div class="row" style="height: 40px;">
					   <div class="col-md-9" align="right" >
						  <b>地址：</b>
						   <input class = "inputClass" type="text"  name="address" id="inputAddress" size="17"style="width: 40%">
						  <span style="color:red ;font-size: 20px" title="必填项" >*</span>
						</div>
						<div class ="" class="col-md-9" align="left" >
							 <label class="errorClass" id="inputAddressError"></label>
						</div>
					 </div>

					<%--
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
					  </div>--%>

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

<!-- 点击下一步后 -->
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

</body>
</html>