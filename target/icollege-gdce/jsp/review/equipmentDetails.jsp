<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="com.isscollege.gdce.domain.Company,
	com.isscollege.gdce.domain.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <script type="text/javascript">
        function onclick2(companyId,state)
        {
            var reviewAdvice = document.getElementById("reviewAdvice").value;
            window.location.href = "${context}/review/changeCom?companyId=" + companyId + "&state="+state+"&reviewAdvice="+reviewAdvice+"&page=${request.page}>";
        }
        function onclick1()
        {
            window.location.href='javascript:history.go(-1)';
        }
        $("#buttonbeasemessage").click(function(){
            $("#beasemessage").slideToggle(1000);
        })
    </script>

    <script src="${context}/js/jquery/imgViewer.js"></script>

    <script>
        $.bindViewer(".viewer-item");//支持绑定到动态生成的元素
    </script>

    <body>
        <c:set var="company" target="${Company }" value="${company}"></c:set>
        <c:set var="clientuser" target="${User }" value="${requestScope.user}"></c:set>

        <div class="container" border="1px" style="width: 890px; height: 1100px ; box-shadow:5px 5px 20px #aaa ">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" >
                    <span style="font-size:14px;color:black; font-family:微软雅黑">设备基础信息</span>
                </a>
                </li>
            </ul>
            <table  class="table table-hover table-condensed" align="center" style="text-align: center">
                <tr>
                    <td width="30%" align="right">序列号:</td>
                    <td align="left">${clientuser.name}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">设备大类编码:</td>
                    <td align="left">${company.companyName}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">设备编码:</td>
                    <td align="left">${company.legalPerson}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">设备组别:</td>
                    <td align="left" >${company.companyAddress}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">组别负责人:</td>
                    <td align="left">${company.phoneNumber}</td>
                </tr>>
                <tr>
                    <td width="30%" align="right">联系电话:</td>
                    <td align="left">${company.companyEmail}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">初始使用时间:</td>
                    <td align="left">${company.companyEmail}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">最近一次使用时间:</td>
                    <td align="left">${company.companyEmail}</td>
                </tr>
            </table>

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" >
                    <span style="font-size:14px;color:black; font-family:微软雅黑">设备使用情况</span>
                </a>
                </li>
            </ul>
            <table  class="table table-hover table-condensed" align="center" style="text-align: center">
                <tr>
                    <td width="30%" align="right">设备在线状态:</td>
                    <td align="left">${clientuser.name}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">设备锁机状态:</td>
                    <td align="left">${company.companyName}</td>
                </tr>
                <tr>
                    <td width="30%" align="right">设备累计使用天数:</td>
                    <td align="left">${company.legalPerson}</td>
                </tr>
            </table>

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" >
                <span style="font-size:14px;color:black; font-family :微软雅黑">使用统计</span>
                </a>
                </li>
            </ul>
            <div id="useMessage">
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
                    <span style="font-size:14px;color:black; font-family :微软雅黑">维护统计</span>
                </a>
                </li>
            </ul>
            <div id="maintainMessage">
                <table width="730px" class="table table-hover table-condensed" align=center style="table-layout: fixed" style="text-align: center">
                    <tr>
                        <td width="200px" align="right">干燥过滤器剩余:</td>
                        <td width="80px" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">Kg</td>
                        <td width="200" align="right">干燥过滤器更换:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">次</td>
                    </tr>
                    <tr>
                        <td width="200" align="right">真空泵剩余:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">Kg</td>
                        <td width="200" align="right">真空泵保养:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">次</td>
                    </tr>
                    <tr>
                        <td width="200" align="right">制冷剂累计补充:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">Kg</td>
                        <td width="200" align="right">累计次数:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">次</td>
                    </tr>
                    <tr>
                        <td width="200px" align="right">压缩机累计:</td>
                        <td width="80px" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">次</td>
                        <td width="200" align="right">时间:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">h</td>
                    </tr>
                    <tr>
                        <td width="150px" align="right">保养功能累计:</td>
                        <td width="80px" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">次</td>
                        <td width="150" align="right">时间:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">h</td>
                        <td width="150" align="right">保养记录:</td>
                        <td width="80" align="left">${company.legalPerson}</td>
                        <td width="10px" align="left">次</td>
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
                <table width="730px" class="table table-hover table-condensed" align=center style="table-layout: fixed" style="text-align: center">
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
            <div style="position:absolute ;left:48% ;top:1000px"><br/>
                <c:choose>
                    <c:when test="${company.reviewState==1}">
                        <button type="button" class="btn btn-default" onclick="d('${company.getCompanyId()}')">确认</button>
                        <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
                    </c:when>
                    <c:when test="${company.reviewState==3||company.reviewState==2}">
                        <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
                    </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-default" onclick="onclick2('${company.getCompanyId() }',1)">解锁</button>
                            <button type="button" class="btn btn-default" onclick="onclick2('${company.getCompanyId() }',2)">锁机</button>
                        </c:otherwise>
                </c:choose>
              <script>
                function d(x){
                  var r=confirm("是否确认");
                  if (r==true){
                    onclick2(x,3);
                  }
                }
              </script>
            </div>
        </div>

        <div style="position:fixed; ;left:1% ;top:0%"><br/>
            <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
        </div>
    </body>
</html>