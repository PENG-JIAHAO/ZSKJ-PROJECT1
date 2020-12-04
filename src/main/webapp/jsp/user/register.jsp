<%@ page pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/jsp/header.jsp" %>
<script type="text/javascript" src="${context }/js/user/regist.js"></script>
<script type="text/javascript" src="<%=context%>/js/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="${context }/js/user/userregist.css">
<script type="text/javascript" src="${context }/js/jquery/jquery.min.js"></script>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript">

    function warring() {
        $('#modal-container-204152').modal();
    }

    $(function () {
        var count = 0;
        $(".right").click(function () {
            count++;
            if (count == $("#banner li").length) {
                count = 0;
            }
            $("#banner li").eq(count).fadeIn().siblings().fadeOut();
            $(".cicle li").eq(count).addClass("seleted").siblings().removeClass("seleted");
            return false;
        });
        $(".left").click(function () {
            count--;
            if (count == -1) {
                count = $("#banner li").length - 1;
            }
            $("#banner li").eq(count).fadeIn().siblings().fadeOut();
            $(".cicle li").eq(count).addClass("seleted").siblings().removeClass("seleted");
            console.log(count);
            return false;
        });
        setInterval(function () {
            count++;
            if (count == $("#banner li").length) {
                count = 0;
            }
            $("#banner li").eq(count).fadeIn().siblings().fadeOut();
            $(".cicle li").eq(count).addClass("seleted").siblings().removeClass("seleted");
        }, 3000)
        $(".register-btn").click(function () {

            window.location.href = '${context}/jsp/user/register.jsp';
        })
    })
</script>

<body>
<div class="register_head">
    <div class="gdmtlogo">
        <a href="${context }"><img alt="logo" src="${context }/imgs/ZSKJlogo.png"></a>
    </div>
</div>

<div class="container">
    <div class="register-banner">

        <ul id='banner'>
            <li class="current changeimg"><img src="${context }/imgs/3.png" alt="">
            </li>
            <li><img src="${context }/imgs/1.jpg" alt="">
            </li>
            <li><img src="${context }/imgs/2.png" alt="">
            </li>
        </ul>
        <div class="register-box">

            <form action="${context }/register/adduser" method="post" name="registForm">
                <input type="hidden" name="forward" value="regist"/>
                <div class="container-fluid">
                    <div class="row">

                        <div class="span12">
                            <div class="row" style="height:40px;">
                                <div class="col-md-4"></div>

                                <div class="col-md-5 judge" align="left">
                                    <p><font size="5">新用户注册</font></p>
                                    <p class="colorred">${alertMessage}</p>
                                </div>
                            </div>
                            <div class="message-box" style="margin-top: 30px">
                                <div class="row" style="height: 50px;">
                                    <div class="col-md-offset-1 col-md-10" align="left">
                                        <b style="width: 1%">用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名：</b>
                                        <input class="inputClass" style="height: 30px;" type="text" name="loginname"
                                               id="loginname" onblur="ajaxsubmit()" value="${requestScope.form.loginname}"/>
                                    </div>
                                    <div class="col-md-offset-1 col-md-10" align="left">
                                        <label class="errorClass errorClass1 inputClass" id="loginnameError">${requestScope.errors.loginname}</label>
                                    </div>
                                </div>
                                <br>

                                <div class="row" style="height: 45px;">
                                    <div class="col-md-offset-1 col-md-10" align="left">
                                        <b >密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</b>
                                        <input class="inputClass" style="height: 30px;" type="password" name="password"
                                               id="loginpass" value="${requestScope.form.loginpass}">
                                        <i class="fa fa-eye-slash" onclick="showhide1()" id="eye1" style="margin-left: -25px"></i>
                                        <script type="text/javascript">
                                            var eye1 = document.getElementById("eye1");
                                            var pwd1 = document.getElementById("loginpass");
                                            function showhide1() {

                                                if (pwd1.type == "password") {
                                                    pwd1.type = "text";
                                                    eye1.className = 'fa fa-eye'
                                                } else {
                                                    pwd1.type = "password";
                                                    eye1.className = 'fa fa-eye-slash'
                                                }
                                            }
                                        </script>
                                    </div>
                                    <div class="col-md-offset-1 col-md-10" align="left">
                                        <label class="errorClass errorClass1 inputClass" id="loginpassError">${requestScope.errors.loginpass }</label>
                                    </div>
                                </div>
                                <br>

                                <div class="row" style="height: 50px;">
                                    <div class="col-md-offset-1 col-md-10" align="left">
                                        <b>确&nbsp;认&nbsp;密&nbsp;码：</b> <input class="inputClass" style="height: 30px;"
                                                                              type="password" name="password1"
                                                                              id="reloginpass"
                                                                              value="${requestScope.form.reloginpass}">
                                        <i class="fa fa-eye-slash" onclick="hideShowPsw()" id="eye2" style="margin-left: -25px"></i>
                                        <script type="text/javascript">
                                            var eye2 = document.getElementById("eye2");
                                            var pwd2 = document.getElementById("reloginpass");

                                            function hideShowPsw() {

                                                if (pwd2.type == "password") {
                                                    pwd2.type = "text";
                                                    eye2.className = 'fa fa-eye'
                                                } else {
                                                    pwd2.type = "password";
                                                    eye2.className = 'fa fa-eye-slash'
                                                }
                                            }
                                        </script>
                                    </div>
                                    <div class="col-md-offset-1 col-md-10" align="left">
                                        <label class="errorClass errorClass1 inputClass"
                                               id="reloginpassError">${requestScope.errors.reloginpass}</label>
                                    </div>
                                </div>
                                <br>

                                <div class="row" style="height: 50px;">
                                    <div class="col-md-offset-1 col-md-10" align="left" >
                                        <b>&nbsp;&nbsp;&nbsp;验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码：</b> <input
                                            class="v-code" style="height: 30px;" type="test" name="verifyCode"
                                            id="verifyCode" value="${requestScope.form.verifyCode }"/>
                                        <img id="imgVerifyCode"
                                             style="width: 20%; height:30px;"
                                             src="<c:url value='/verifyCode'/>"/>
                                        <a id="another" style="width: 50%;height: 30px;margin-left: 3%" href="javascript:_hyz()">换一张</a>
                                    </div>

                                    <div class="col-md-offset-3 col-md-5" align="left">
                                        <label class="errorClass"
                                               id="verifyCodeError">${requestScope.errors.verifyCode}</label>
                                    </div>
                                    <div class=" col-md-3 col-md-offset-6" align="left" id="divVerifyCode"
                                         style="width: 250px;">

                                    </div>
                                    <br>
                                </div>

                                    <br>
                                    <div class="row" style="height: 50px;">
                                        <div class="col-md-offset-3 col-md-8" >
                                            <input style="margin-right: 10%" name="submit" type="submit" id="submit" value="确定" class="btn btn-primary">
                                            <input type="reset" name="rest" value="重置" class="btn btn-primary">
                                        </div>
                                    </div>
                                    <div class="col-md-offset-4 col-md-8" align="left">
                                        <c:if test="${empty currentUser }" var="recurrentUser">
                                            <c:out value="已有账号？"/>
                                            <a href='${context }/jsp/user/login.jsp'>立即登录</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${not recurrentUser }">
                                            <c:out value="${currentUser }"/>&nbsp;&nbsp;
                                        </c:if>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>




    <script type="text/javascript">
        function check() {
            var name = $("#loginname").val();
            var pass = $("#loginpass").val();
            value2 = /^[a-zA-Z0-9_-]{3,20}$/;
            value1 = /^[\w_-]{3,20}$/;
            if (value2.test(name) && value1.test(pass)) {
                $("#sumit").attr("disabled", false);
            } else {
                $("#sumit").attr("disabled", true);
            }
        }
        function check1() {
            var pass = $("#loginpass").val();
            var pass1 = $("#reloginpass").val();
            value2 = /^[a-zA-Z0-9_-]{3,20}$/;
            value1 = /^[\w_-]{3,20}$/;
            if (value2.test(name) && value1.test(pass) && pass == pass1) {
                $("#sumit").attr("disabled", false);
            } else {
                $("#sumit").attr("disabled", true);
            }
        }
        /* 用户名的校验 */
        $("#loginname").blur(function () {
            check ();
/*            var name = $("#loginname").val();
            value2 = /^[a-zA-Z0-9_-]{3,20}$/;
            if (value2.test(name)) {
                $("#sumit").attr("disabled", false);
            } else {
                $("#sumit").attr("disabled", true);
            }*/
        });

        /* 密码的校验 */
        $("#loginpass").blur(function () {
            check();
        });
        /* 确认密码的校验  */
        $("#reloginpass").blur(function () {
            check1();
        });
    </script>
</div>

<div class="jumbotron text-center" style="margin-bottom: 0">
    <p>
    <h5>
        <a href="" onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br> <br>
        网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
        地址：北京市昌平区未来科技城 邮编：102209
        电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
        电子邮箱：fuel@powerec.net
    </h5>
    </p>
</div>

</body>
</html>
