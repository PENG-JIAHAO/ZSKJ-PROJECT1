<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@page import="java.util.List" import="com.isscollege.gdce.domain.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${context }/js/user/regist.js"></script>
<script type="text/javascript">
    function ckAdminForm(){
        var flag=true;
        var loginNames=/^\w{3,20}$/;
        var loginName=$("#loginname").val();
        var userNames=/^[\u4E00-\u9FA5A-Za-z0-9_]{2,20}$/;
        var userName=$("#username").val();
        var emails=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;/* 邮箱验证 */
        var email = $("#email").val();
        var tels=/^1\d{10}$/;/* 电话号码验证 */
        var phoneNumber = $("#phoneNumber").val();
        if($("#loginname").val()==""  ||  $("#password").val()=="" || $("#username").val()=="" || $("#phoneNumber").val()==""  || $("#email").val()=="" ){
            flag=false;
        }
        if(!rsLoginName&&loginNames.test(loginName) && !rsUserName&&userNames.test(userName) && !rsPhoneNumber && !rsEmail && emails.test(email) && tels.test(phoneNumber)&& flag){
            return true;
        }else{
            alert("请填写完整再提交");
            return false;
        }
    }
</script>
<!-- 确认是否删除管理员 -->
<script type="text/javascript">
    function isDelete(){
        var is = confirm("确定删除该管理员？");
        if(is == true){
            alert("删除成功！");
            return true;
        }else{
            return false;
        }
    }
</script>

<link rel="stylesheet" type="text/css"
      href="${context }/js/user/regist.css">

<style type="text/css">
    .STYLE5 {
        font-size:130%;
        font-weight: bold;
    }
    .child2 {
        position: relative;
        width: 945px;
        height: 360px;
        border: 2px solid #bce8f1;
        margin-top: 50px;
        margin-left: 70px;
        border-collapse: separate;
        border-spacing: 0px 10px;
        padding-left: 100px;
    }
    /*DISABLE PADDING*/
    .child2 tr td {
       /* padding-left: 50px;*/
    }
    .child2-button {
        position: absolute;
        /*left: 50%;*/
        margin-left: 31%;
        bottom: 10px;
    }
</style>
<body>
<c:set var="cuser" target="User" value="${sessionScope.currentUser}"></c:set>
<c:if test="${empty cuser || cuser.getLevel() != 0}">
    <c:redirect url="/jsp/review/review.jsp"></c:redirect>
</c:if>
                <div class='tab-content'  >
                            <div class="row clearfisx" style="width:945px; margin:0;">
                    <div class='tab-pane' id='add'>
                        <form action="${context }/register/addmanager"
                              method="post" onsubmit="return ckAdminForm()">
                            <table class="child2" >
                                <tr>
                                    <td><input type="hidden" name="forward"
                                               value="addmanager"></td>
                                </tr>
                                <tr>
                                    <td >用户名:</td>
                                    <td><input name="name" placeholder="输入用户名" type="text" class="inputClass"
                                               id="loginname" onBlur="ajaxsubmit()"></td>
                                    <td class="tdError"><label class="errorClass"
                                                               id="loginnameError">${requestScope.errors.loginname}</label>
                                    </td>
                                    <td align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                                    <td align="center"><input name="email" placeholder="输入邮箱" type="text"
                                                                     id="email" class="inputClass" onBlur="ajaxemail()"></td>

                                   <td class="tdError"> <label
                                            class="errorClassTwo" id="emailError" >${requestScope.errors.email}</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                    <td><input class="inputClass" placeholder="输入密码" type="password"
                                               name="password" id="password" oncopy="return false" onpaste="return false"
                                    ></td>
                                    <td class="tdError"><label class="errorClass"
                                                               id="passwordError">${requestScope.errors.password }</label>
                                    </td>
                                    <td>部&nbsp;&nbsp;&nbsp;&nbsp;门：</td>
                                    <td align="center"><label> <select
                                            name="department" id="department" class="inputClass" style = "font-weight: 400">
                                        <option value="燃料管理部" selected>燃料管理部</option>
                                        <option value="监察部">监察部</option>
                                        <option value="信息管理部">信息管理部</option>
                                    </select>
                                    </label></td>
                                </tr>

                                <tr>
                                    <td>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                                    <td> <input name="username" placeholder="输入真实姓名" type="text"
                                                       id="username" class="inputClass" onBlur="ajaxusername()"></td>
                                    <td class="tdError"> <label class="errorClass" id="usernameError" >${requestScope.errors.username}</label>
                                    </td>
                                    <td>角&nbsp;&nbsp;&nbsp;&nbsp;色：</td>
                                    <td align="center"><label> <select name="permission"
                                                                       id="permission" class="inputClass" style = "font-weight: 400">
                                        <option value="4" selected>资讯编辑管理员</option>
                                        <option value="5">资讯审核管理员</option>
                                        <option value="6">注册审核管理员</option>
                                        <option value="7">交易审核管理员</option>
                                        <option value="8">广告审核管理员</option>
                                    </select>
                                    </label></td>
                                </tr>

                                <tr>
                                <td>手机号：</td>
                                <td align="center"> <input name="phoneNumber" placeholder="输入常用手机号" type="text" id="phoneNumber"
                                                                  class="inputClass" onBlur="ajaxuphoneNumber()"></td>
                                <td class="tdError"> <label
                                        class="errorClass" id="phoneNumberError" >${requestScope.errors.phoneNumber}</label>
                                </td>
                                </tr>

                                <tr>
                                    <td align="center" class="child2-button" ><label>
                                        <input name="submit" id = "btnSubmit"
                                            type="submit" name="Submit" value="提交" style="background-color: #40E0D0;
                                            border:1.5px solid; border-radius:20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input name="reset" id = "btnReset" type="reset" id="reRset" value="返回" style="background-color: #40E0D0;
                                            border:1.5px solid; border-radius:20px ">
                                    </label></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <%-- TRY TO MODIFY CSS WHEN MOUSE HOVER--%>
            <script>
                $("#btnSubmit").hover(function(){
                    $("#btnSubmit").css("background-color","black");
                    $("#btnSubmit").css("color","white");
                },function(){
                    $("#btnSubmit").css("background-color","#40E0D0");
                    $("#btnSubmit").css("color","black");
                });
                $("#btnReset").hover(function(){
                    $("#btnReset").css("background-color","black");
                    $("#btnReset").css("color","white");
                },function(){
                    $("#btnReset").css("background-color","#40E0D0");
                    $("#btnReset").css("color","black");
                });
            </script>
<br>
<br>
<br>
<c:set var="msgs" value="${requestScope.msg}"/>
<c:if test="${msgs!=null && msgs.equals('成功创建')}">
    <c:out value="<script language='javascript'>alert('管理员添加成功！')</script>"/>
</c:if>

</body>
</html>