<%@page import="com.isscollege.gdce.domain.Contract" %>
<%@ page pageEncoding="UTF-8" import="java.util.*"
         import="com.isscollege.gdce.domain.User" %>
<%@ include file="/jsp/header.jsp" %>
<script type="text/javascript">

    $(function () {
        var perm =${permission};

        if (perm == 2) {
            document.getElementById("productsend").removeAttribute("disabled");
            document.getElementById("productselect").removeAttribute("disabled");
        }

    });

    function judge() {
        var pass =${permission=="2"? 1 : 2};
        if (pass == 1) {
            window.location.href = "${context}/jsp/report/reportIndex.jsp";
        } else {
            $('#modal-container-204152').modal();
        }

    }
</script>
<body>
<c:if test="${empty currentUser}">
    <c:redirect url="/jsp/user/login.jsp"></c:redirect>
</c:if>

<div class="modal fade" id="modal-container-204152" role="dialog"
     aria-hidden="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" aria-hidden="true" type="button"
                        data-dismiss="modal">×
                </button>
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
    ${username}&nbsp;&nbsp; <a href="${context}/login/logout">退出</a>
</div>
<div class="container">
    <div class="header clearfix">
        <nav class="navbar">
            <ul class="nav nav-pills pull-right socials">
                <li role="presentation"><a href="${context}">首页</a></li>
                <li role="presentation"><a href="">交易中心</a></li>
                <li role="presentation"><a
                        href="${context}/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
                <li role="presentation"><a onClick="judge()"
                                           href="javascript:judge()">报表中心</a></li>
                <li role="presentation" class="active"><a
                        href="${context}/register/doqualification">会员中心</a></li>
            </ul>
            <h3 class="text-muted">
                <a href="${context}"><img alt="logo"
                                          src="${context}/imgs/logo.png"></a>
            </h3>
        </nav>
    </div>
</div>

<div class="box" ; align="center">
    <img alt="分割图" src="${context}/imgs/banner004.png" style="width: 1140px;height: 160px" ;>
</div>

<%--<br>--%>
<%--<br>--%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="row clearfix" >
                    <div class="col-md-12 column" style="margin: 20px 0px 20px 0px">
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
                                <button style="width: 90px; height: 40px" class="btn btn-default btn-primary "
                                        type="button" onClick="showReport1()">合同查询</button></a>
                        </div>

                        <div class="panel-body" style="display: inline-block">
                            <a href="${context}/getuserproduct" target="_self"><button
                                    style="width: 90px; height: 40px" class="btn btn-default " id="productselect"
                                    disabled="true"	type="button" onClick="showReport1()">商品查询</button></a>
                        </div>
                        <div class="panel-body" style="display: inline-block">
                            <a href="${context}/jsp/product/insertProduct.jsp" target="_self"><button
                                    style="width: 90px; height: 40px" class="btn btn-default  " id="productsend"
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
                <div class="col-md-10 column">
                    <div
                            style="background-color: #D9EDF7; margin-left: 40px; margin-right: 140px; margin-top: 8px; margin-bottom: 100px; height: 45px; padding: 10px">

                        <ul class="nav nav-tabs">

                            <li class="active"><a href="${context}/jsp/contract/contractEnsure.jsp">待签</a></li>
                            <li class="none"><a href="${context}/jsp/contract/bothSigned.jsp">历史</a></li>
                            <form role="form"
                                  action="${context }/contract/queryAppointedContract"
                                  method="post">
                                <li>
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="number" class="form-horizontal;" id="contractNumber" name="contractId"
                                           placeholder="请输入合同编号">
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;

                                    <button class="btn btn-default" type="submit">查询</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </li>
                            </form>
                        </ul>
                    </div>
                    <form id="myForm" action="${context}/contract/ensurelist"
                          method="post" onsubmit="return sumbit_sure()">

                        <c:choose>
                            <c:when test="${hasResult==true }">
                                <c:set var="count"></c:set>
                                <c:forEach var="contract" items="${contracts}" varStatus="i">
                                    <c:if test="${contract.buyerContractState eq false}">
                                        ${count+1 }q
                                        <div style="border: 1px solid #E0E0E0; margin-left: 40px; margin-right: 140px; margin-top: 30px">
                                            <div style="background-color: #D9EDF7; height: 45px; padding: 10px">
                                                <p id="ctrId">合同编号：${contract.contractId}</p>
                                            </div>
                                            <div style="padding-left: 20px">
                                                <p>买方公司编号：${contract.buyerCompanyId}</p>
                                                <p>卖方公司编号：${contract.sellerCompanyId}</p>
                                                <p>商品编号：${contract.productId}</p>
                                                <p>创建时间：${contract.createDate}</p>
                                                <p>结束时间：${contract.endDate}</p>
                                                <p style="text-align: right">
                                                    买方合同状态： 买方未签 &nbsp;&nbsp;&nbsp;&nbsp; 卖方合同状态：卖方已签
                                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                                    <script>
                                                        function myRegister() {
                                                            document.getElementById(
                                                                "myForm").submit1();
                                                        }

                                                        function submit1_sure() {
                                                            var gnl = confirm("恭喜合同已签订成功！是否跳转订单页面？");
                                                            if (gnl == true) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }
                                                        }
                                                    </script>
                                                    <c:if test="${companyID eq contract.buyerCompanyId }">
                                                    <input type="hidden" name="ensureId" id="ensureId"
                                                           value=${i.index }>
                                                    <input type="submit" name="submit1" id="submit1" value="签订合同">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </c:if>
                                            </div>
                                        </div>
                                    </c:if>

                                </c:forEach>
                                <c:forEach var="contract" items="${contracts}" varStatus="con">

                                    <c:if test="${contract.sellerContractState eq false }">
                                        <c:set var="count" value="${count+1}"></c:set>
                                        <div
                                                style="border: 1px solid #E0E0E0; margin-left: 40px; margin-right: 140px; margin-top: 30px">
                                            <div
                                                    style="background-color: #D9EDF7; height: 45px; padding: 10px">
                                                <p id="ctrId2">合同编号：${contract.contractId}</p>
                                            </div>
                                            <div style="padding-left: 20px">
                                                <p style="padding-top: 8px">
                                                    买方公司编号：${contract.buyerCompanyId}</p>
                                                <p>卖方公司编号：${contract.sellerCompanyId}</p>
                                                <p>商品编号：${contract.productId}</p>
                                                <p>创建时间：${contract.createDate}</p>
                                                <p>结束时间：${contract.endDate}</p>
                                                <p style="text-align: right">
                                                    买方合同状态： 买方已签 &nbsp;&nbsp;&nbsp;&nbsp; 卖方合同状态：卖方未签
                                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                                    <script>
                                                        function myRegister() {
                                                            document.getElementById(
                                                                "myForm").submit2();
                                                        }

                                                        function submit2_sure() {
                                                            var gnl = confirm("恭喜合同已签订成功！是否跳转订单页面？");
                                                            if (gnl == true) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }
                                                        }
                                                    </script>

                                                    <input type="hidden" name="productid"
                                                           value="${contract.productId}"/>
                                                    <c:if test="${companyID eq contract.sellerCompanyId}">
                                                    <input type="hidden" name="ensureId" id="ensureId"
                                                           value="${con.index}">
                                                    <input type="submit" name="submit2" id="submit2" value="签订合同">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;

                                                        <fmt:formatDate value="${contract.endDate}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/>

                                                    </c:if>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>


                                <c:if test="${count eq 0 }">
                                    <div style="height: 300px; padding-left: 50px">暂无未签定的合同</div>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <div style="height: 300px; padding-left: 50px">暂无未签定的合同</div>
                            </c:otherwise>
                        </c:choose>
                    </form>
                    <form action="${context}/contract/ensurelist" method="post"
                          onsubmit="return sumbit_sure()">
                        <c:set var="count"></c:set>
                    </form>
                    <div style="height: 200px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
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
</body>
</html>