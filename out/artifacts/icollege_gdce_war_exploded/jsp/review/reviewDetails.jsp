<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="com.isscollege.gdce.domain.Company,
	com.isscollege.gdce.domain.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
function onclick2(companyId,state)
{
	var reviewAdvice = document.getElementById("reviewAdvice").value;
	window.location.href = "${context}/review/changeCom?companyId=" + companyId + "&state="+state+"&reviewAdvice="+reviewAdvice+"&page=${request.page}>";
} 
function onclick1()
{
	window.location.href = "${context}/review/companyReview";
} 
$("#buttonbeasemessage").click(function(){
	$("#beasemessage").slideToggle(1000);	
})

$("#reviewAdvice").validate({
                rules:{
                	reviewAdvice:{
                       required:true,
                       maxlength:18,
                       minlength:6
                       		 }
                },
				messages:{
					reviewAdvice:{
				        required:"审核意见不能为空",
				        maxlength:"审核意见不能超过18位",
				        minlength:"审核意见不能少于6位"
				    }
				               },
                success:function(e){
                    e.html("<span style='font-size: 20px;color: yellowgreen;'>√</span>")
                }
                    })
</script>

<script src="${context}/js/jquery/imgViewer.js"></script>
<script>
    $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
</script>

<%--文件下载链接检测--%>
<script>
    function testFileUrl(fileurl) {
        $.ajax({
            url: fileurl,
            type: 'get',
            complete: function (response) {
                if (response.status == 204||response.status==500) {
                    alert('资质文件不存在');
                } else {
                    javascript:location.href=fileurl;  //跳转下载
                }
            },
            error:function() {
                console.info("网络出错");
                alert("网络异常:无法连接到服务器!");
            }
        });
    }
</script>

<body>
<c:set var="company" target="${Company }" value="${company}"></c:set>
<c:set var="clientuser" target="${User }" value="${requestScope.user}"></c:set>



<%--	<div class="container">--%>
<%--		<div class="header clearfix">--%>
<%--			<nav class="navbar">--%>
<%--				<h3 class="text-muted">--%>
<%--					<img alt="logo" src="${context }/imgs/logo.png">--%>
<%--				</h3>--%>
<%--			</nav>--%>
<%--		</div>--%>
<%--	</div>--%>

<%--	<div class="box" align="center">--%>
<%--		<img alt="分割图" src="${context }/imgs/banner004.png">--%>
<%--	</div>--%>
	<hr/>
<div class="container" border="1px" style="width: 890px; height: 930px ; box-shadow:5px 5px 20px #aaa ">
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" >
<span style="font-size:14px;color:black; font-family:微软雅黑">用户基本信息</span>
 </a>
</ul>
<div id="beasemessage" style="display:" >
<table  class="table table-hover table-condensed" align="center"
		style="text-align: center">
<tr>
    <td width="10%"></td>
    <td width="40%" align="right">用户名称:</td>
    <td align="left">${clientuser.name}</td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td width="40%" align="right">企业名称:</td>
    <td align="left">${company.companyName}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">法人代表:</td>
    <td align="left">${company.legalPerson}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">注册地区:</td>
    <td align="left" >${company.companyAddress}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">注册资金（万元）:</td>
    <td align="left">${company.registerMoney}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">联系人:</td>
    <td align="left">${company.legalPerson}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">联系电话:</td>
    <td align="left">${company.phoneNumber}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">传真:</td>
    <td align="left">${company.companyFax}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">企业邮箱:</td>
    <td align="left">${company.companyEmail}</td>
  </tr>
</table>
</div>
<ul class="nav nav-tabs">
 <li class="active"><a data-toggle="tab" >
 <span style="font-size:14px;color:black; font-family :微软雅黑">相关资质查询</span>  
 </a>
 </li>
</ul> 
<div id="mainmessage" style="display:">
<table class="table table-hover table-condensed" align="center"
	   style="text-align: center">
  <tr>
    <td width="10%"></td>
    <td align="right" width="35%">营业执照:</td>
      <td align="left">
        <a class="viewer-item" src="${context}/register/loadQualificationImage?path=${company.getOpenLicensePath()}">预览</a>
        <a onclick="testFileUrl('${context}/companyQualificationDown?path=${company.getOpenLicensePath()}')" style="margin-left:10px">下载</a>
      <td align="left"></td>
    </td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">税务登记号:</td>
      <td align="left">
          <a class="viewer-item" src="${context}/register/loadQualificationImage?path=${company.getTaxRegisterCodePath()}">预览</a>
          <a onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getTaxRegisterCodePath()}')" style="margin-left:10px">下载</a>
      <td align="left"></td>
  </td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">组织机构代码证号:</td>
      <td align="left">
          <a class="viewer-item" src="${context}/register/loadQualificationImage?path=${company.getCompanyCodePath()}">预览</a>
          <a onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getCompanyCodePath()}')" style="margin-left:10px">下载</a></td>
      <td align="left"></td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">开户行:</td>
    <td align="left"   width="10%">
        <input type="text" readonly="readonly" style="border:none;width:100px"value="${company.getOpenBank()}"/></td>
    <td align="left"></td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">开户账号:</td>
      <td align="left">
          <a class="viewer-item" src="${context}/register/loadQualificationImage?path=${company.getBankAccountCodePath()}">预览</a>
          <a onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getBankAccountCodePath()}')" style="margin-left:10px">下载</a>
      <td align="left"></td>
      </td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">煤炭经营许可证:</td>
    <td align="left">
        <a class="viewer-item"  src="${context}/register/loadQualificationImage?path=${company.getBussionLicenseCodePath()}">预览</a>
      <a onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getBussionLicenseCodePath()}')" style="margin-left:10px">下载</a>
      <td align="left"></td>
  </td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">法人身份证:</td>
      <td align="left">
          <a class="viewer-item" src="${context}/register/loadQualificationImage?path=${company.getLegalPersonCodePath()}">预览</a>
          <a onclick="testFileUrl('${context}/companyQualificationDown?&path=${company.getLegalPersonCodePath()}')" style="margin-left:10px">下载</a>
      <td align="left"></td>
      </td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">可控煤炭资源:</td>
    <td align="left"   width="10%">${company.getGoodsAddress()}</td>
    <td align="left"></td> 
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">运输保障能力:</td>
    <td align="left"   width="10%" >${company.getTransportStyle()}</td>
    <td align="left"></td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">供应商简介:</td>
    <td align="left" colspan="2"><textarea style="overflow-y:scroll;max-height:120px;min-height:60px;min-width:300px;max-width:350px">${company.getCompanyProfile()}</textarea></td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td align="right"  width="35%">供应商业绩:</td>
    <td align="left"   width="10%">无</td>
    <td align="left"></td>
  </tr>
</table>
</div>
 <ul class="nav nav-tabs">
 <li class="active"><a data-toggle="tab" >
 <span style="font-size:14px;color:black; font-family:微软雅黑">审核</span>  
 </a>
 </li>
</ul>
<from>
<table class="table table-hover table-condensed" align="center"
	   style="text-align: center">
  <tr>
  <td width="10%"></td>
  <td width="35%" align="right">审核意见:</td>
  <td align="left"><input type="text" id="reviewAdvice" name="reviewAdvice" style=" width:200px ; line-height:40px" /></td>
  <td></td>
  </tr>
</table>
</from>
<div  style="position:absolute ;left:48% ;top:920px"><br/>
    <c:choose>
        <c:when test="${company.reviewState==1}">
            <button type="button" class="btn btn-default" onclick="d('${company.getCompanyId()}')">撤销通过</button>
            <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
        </c:when>
      <c:when test="${company.reviewState==3||company.reviewState==2}">
        <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
      </c:when>
        <c:otherwise>
            <button type="button" class="btn btn-default" onclick="onclick2('${company.getCompanyId() }',1)">通过</button>
            <button type="button" class="btn btn-default" onclick="onclick2('${company.getCompanyId() }',2)">驳回</button>

        </c:otherwise>
    </c:choose>
  <script>
    function d(x){
      var r=confirm("是否确认撤销审核通过");
      if (r==true){
        onclick2(x,3);
      }
    }
  </script>
</div>


</div>
<div  style="position:fixed; ;left:1% ;top:0%"><br/>
    <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
</div>

</body>
</html>