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
</script>

<script src="${context}/js/jquery/imgViewer.js"></script>
<script>
    $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
</script>
<body>
<c:set var="company" target="${Company }" value="${company}"></c:set>
<c:set var="clientuser" target="${User }" value="${requestScope.user}"></c:set>

	<hr/>
<div class="container" border="1px" style="width: 890px; height: 800px ; box-shadow:5px 5px 20px #aaa ">
<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" >
<span style="font-size:14px;color:black; font-family:微软雅黑">运营商基本信息</span>
 </a>
</ul>
<div id="beasemessage">
<table  class="table table-hover table-condensed" align="center" style="text-align: center">
<tr>
    <td width="10%"></td>
    <td width="40%" align="right">编号:</td>
    <td align="left">${clientuser.name}</td>
  </tr>
  <tr>
    <td width="10%"></td>
    <td width="40%" align="right">经销商:</td>
    <td align="left">${company.companyName}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">联系人:</td>
    <td align="left">${company.legalPerson}</td>
  </tr>
  <tr>
    <td></td>
    <td width="40%" align="right">地址:</td>
    <td align="left" >${company.companyAddress}</td>
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
    <td width="40%" align="right">邮箱:</td>
    <td align="left">${company.companyEmail}</td>
  </tr>
</table>
</div>
<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" >
    <span style="font-size:14px;color:black; font-family :微软雅黑">使用统计</span>
    </a>
    </li>
</ul> 
<div id="mainmessage">
<table width="730px" class="table table-hover table-condensed" align=center style="table-layout: fixed">
    <tr>
        <td width="80px" align="right">未结算次数:</td>
        <td width="100px" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">次</td>
        <td width="80" align="right">单价:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
        <td width="80" align="right">金额:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
    </tr>
    <tr>
        <td width="80px" align="right">已结算次数:</td>
        <td width="100px" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">次</td>
        <td width="80" align="right">单价:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
        <td width="80" align="right">金额:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
    </tr>
    <tr>
        <td width="80px" align="right">累计:</td>
        <td width="100px" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">次</td>
        <td width="80" align="right">总额:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
    </tr>
</table>
</div>
 <ul class="nav nav-tabs">
 <li class="active"><a data-toggle="tab" >
 <span style="font-size:14px;color:black; font-family:微软雅黑">自动催缴设置</span>
 </a>
 </li>
</ul>
<from>
<table class="table table-hover table-condensed" align="center"
	   style="text-align: center">
    <tr>
        <td width="80px" align="right">是否自动:</td>
        <td width="100px" align="left">${company.legalPerson}</td>
        <td width="80" align="right">设置:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">次</td>
        <td width="80" align="right">金额:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
    </tr>
    <tr>
        <td width="80px" align="right">是否锁机:</td>
        <td width="100px" align="left">${company.legalPerson}</td>
        <td width="80" align="right">设置:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">次</td>
        <td width="80" align="right">金额:</td>
        <td width="100" align="left">${company.legalPerson}</td>
        <td width="10px" align="left">元</td>
    </tr>
</table>
</from>
<div  style="position:absolute ;left:48% ;top:800px"><br/>
    <c:choose>
        <c:when test="${company.reviewState==1}">
            <button type="button" class="btn btn-default" onclick="d('${company.getCompanyId()}')">撤销通过</button>
            <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
        </c:when>
      <c:when test="${company.reviewState==3||company.reviewState==2}">
        <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
      </c:when>
<%--        <c:otherwise>
            <button type="button" class="btn btn-default" onclick="onclick2('${company.getCompanyId() }',1)">解锁</button>
            <button type="button" class="btn btn-default" onclick="onclick2('${company.getCompanyId() }',2)">锁机</button>

        </c:otherwise>--%>
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