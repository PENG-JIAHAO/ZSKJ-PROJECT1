<%@ page pageEncoding="UTF-8"
         import="java.util.*,com.isscollege.gdce.domain.Product"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <style>
        * {
            margin: 0;
            padding: 0;
            -webkit-border-radius: 0 !important;
            -moz-border-radius: 0 !important;
            border-radius: 0 !important;
        }

        body {
            background-color: #ecf0f3;
            padding: 0;
        }

        a:hover {
            text-decoration: none;
            color: whitesmoke;
        }

        a:focus {
            text-decoration: none;
            color: whitesmoke;
        }

        #head {
            width: 100%;
            height: 50px;
            background-color: #5dcec6;
            margin-left: 0px;
        }

        .showcontent {
            background-color: #ffffff;
            width: 100%;
            height: 75vh;
            border-radius: 5px;
            margin-left: 50px;
            overflow: hidden;
            position: relative;
            box-shadow: 2px 5px 10px #909090;
        }

        .showcontent>#content {
            position: absolute;
            transform: scale(1.00);
            width: 100%;
            height: 100%;
        }  /* iframe窗口 */

        .main {
            margin-top: 25px;
        }

        #panel-203847 {
            width: 100%;
            height: 90vh;
            background-color: #2d3e4f;
            font-weight: bold;
            font-size: 15px;
        }  /* 手风琴导航栏样式 */

        .catalog {
            border-radius: 0px;
            height: 50px;
            text-align: left;
            line-height: 50px;
            background-color: #2d3e4f;
            color: whitesmoke;
        }

        .panel-body {
            background-color: #2d3e4f;
            color: whitesmoke;
            text-align: center;
        }

        .click {
            display: inline-block;
            width: 70%;
            text-align: center;
            margin-right: 10px;
        }

        .img-left {
            display: inline-block;
        }

        .img-right {
            display: inline-block;
            float: right;
        }

        .guide {
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: whitesmoke;
        }

        .panel-body:hover {
            color: whitesmoke;
            background-color: #5dcec6;
        }

        .bottom-text {
            text-align: center;
            margin-top: 5vh;
        }

        #loginstatus {
            float: right;
            line-height: 50px;
            font-size: 15px;
        }

        .active {
            color: whitesmoke;
            background-color: #5dcec6;
        }
    </style>

    <script>
        $(function () {
            $(".panel-body").on("click", function () {
                var address = $(this).attr("data-src");
                $("iframe").attr("src", address);
            });
        });

        $(function(){
            var nav=$(".panel-body");
            // $('.panel-body:eq(0)').addClass('active');
            nav.click(function(){
                $(this).addClass('active').siblings().removeClass('active');
            })
        });
        $(function () {
            $("#btn7").trigger('click');
        })

        <%-- SETTING DEFAULT DES FOR "ADMIN" AND CHANG FIRST BUTTON( CSS ) --%>
        <c:if test="${user.getLevel() == 0}">
            $(function () {
                $('#accManage').trigger("click");
                $('#btn0').trigger("click");
            });
            $(function () {
                $("#checkManage").css('opacity','0.2');
                $("#checkManage").removeAttr('href');
            });
        </c:if>
    </script>
</head>
<body>
<c:set var="per" value="${user.getPermission()}"></c:set>

<div class="container-fluid">
    <div class="row clearfix" id="head">
        <div class="col-md-12 column .col-md-offset-4" id="header">
            <div>
                <a href="${context}/login/logout"><img src="${context}/imgs/ZSKJlogo.png" alt="logo" height="50px"></a>
                <div id="loginstatus">
                    <img src="${context }/imgs/loginstatus.png" alt="logo" height="30px">&nbsp;你好！
                    ${currentUser.equals("") ? "<a href='" + context  + "/jsp/user/login.jsp'>登录</a>" : currentUser.name}&nbsp;&nbsp;
                    <a href="${context}/login/logout">退出</a>&nbsp;&nbsp;&nbsp;
                </div>
            </div>
        </div>
    </div>

    <div class="row clearfix main">
        <div class="col-md-2 column">
            <div class="panel-group" id="panel-203847">
                <div class="catalog">
                    <img src="${context }/imgs/catalog.png" alt="" height="30px">
                    <span>目录</span>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #212525; color: whitesmoke;">

                        <div class="img-left"><img src="${context }/imgs/check.png" alt="" height="30px"></div>
                        <a class="panel-title click" data-toggle="collapse" data-parent="#panel-203847"
                           href="#panel-element-122542" id="checkManage">账户浏览
                            <div class="img-right"><img src="${context }/imgs/down.png" alt="" height="20px"></div>
                        </a>
                    </div>
                    <div id="panel-element-122542" class="panel-collapse in">
                    <%--管理员权限判定--%>
                        <c:if test="${per.indexOf('5')!=-1}">
                            <div id="btn7" class="panel-body" data-src="${context}/review/newsReview">
                                <a href="#" class="guide">资讯审核</a>
                            </div>
                        </c:if>

                        <c:if test="${per.indexOf('6')!=-1}">
                        <div id="btn7" class="panel-body" data-src="${context}/review/manufacturers">
                            <a href="#" class="guide">经销商</a>
                        </div>
                        </c:if>

                        <c:if test="${per.indexOf('7')!=-1}">
                            <div id="btn7" class="panel-body" data-src="${context}/review/operators">
                                <a href="#" class="guide">设备使用商</a>
                            </div>
                        </c:if>

                        <c:if test="${per.indexOf('8')!=-1}">
                            <div id="btn7" class="panel-body" data-src="${context}/review/advertisementReview">
                                <a href="#" class="guide">产品管理</a>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #212525; color: whitesmoke;">
                        <div class="img-left"><img src="${context }/imgs/account.png" alt="" height="30px"></div>
                        <a class="panel-title collapsed click" data-toggle="collapse" data-parent="#panel-203847"
                           href="#panel-element-622685" id = "accManage">账户管理
                            <div class="img-right"><img src="${context }/imgs/down.png" alt="" height="20px"></div>
                        </a>
                    </div>

                    <div id="panel-element-622685" class="panel-collapse collapse">
                        <c:if test="${per.indexOf('0')!=-1}">
                            <div  id = "btn0" class="panel-body" data-src="${context }/register/querymanager?currentPage=1">
                                <a href="#" class="guide" >账户管理</a>
                            </div>
                            <div class="panel-body" data-src="${context}/jsp/user/superManagerAdd.jsp">
                                <a href="#" class="guide">新增管理员</a>
                            </div>
                        </c:if>
                        <c:if test="${per.indexOf('6')!=-1}">
                            <div  id = "btn0" class="panel-body" data-src="${context }/review/manufacturersManage">
                                <a href="#" class="guide" >运营商管理</a>
                            </div>
                        </c:if>

                        <c:if test="${per.indexOf('7')!=-1}">
                            <div  id = "btn0" class="panel-body" data-src="${context }/review/operatorManage">
                                <a href="#" class="guide" >设备使用商管理</a>
                            </div>
                        </c:if>
                    </div>


                </div>

                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #212525; color: whitesmoke;">
                        <div class="img-left"><img src="${context }/imgs/jurisdiction.png" alt="" height="30px"></div>
                        <a class="panel-title collapsed click" data-toggle="collapse" data-parent="#panel-203847"
                           href="#panel-element-12315">权限管理
                            <div class="img-right"><img src="${context }/imgs/down.png" alt="" height="20px"></div>
                        </a>
                    </div>
                    <div id="panel-element-12315" class="panel-collapse collapse">
                        <div class="panel-body" data-src="">
                            <a href="#" class="guide">待定</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9 column">
            <div class="showcontent">
                <iframe src="" id="content" frameborder="0"></iframe>
            </div>

            <div class="bottom-text">
                <p>
                <h5>
                    <a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
                    网站版权归中盛（东莞）科技公司所有 京ICP备 ******** |京公网安备********号<br>
                    地址：******** 邮编：********
                    电话：******8（非工作时间：********）、******** 传真： ********<br>
                    电子邮箱：********
                </h5>
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>

