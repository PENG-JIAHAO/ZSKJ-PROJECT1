<%@ page pageEncoding="UTF-8" isELIgnored="false" import="com.isscollege.gdce.domain.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    
<!-- 现 -->
	<!-- 全局寄存工程根目录 -->
	<c:set var="context" value="${pageContext.request.contextPath }"></c:set>
	<!-- 当前登录的用户对象 -->
	<c:set var="user" value="${currentUser}"></c:set>
	<!-- 当前登录的用户姓名 -->
	<c:set var="username" value="${currentUser.name}"></c:set>
	<!-- 当前登录的用户类型 -->
	<c:set var="permission" value="${currentUser.permission}"></c:set>
	<!-- 其他页面通过设置title来改变页面标题 -->
	<c:set var="title" value="中盛科技管理系统"></c:set>
	
<!-- 原 -->
    <% 
    	 //全局寄存工程根目录
         String context=request.getContextPath();
         //其他页面通过设置title来改变页面标题
         String title = "中盛科技管理系统 V1.0";
         String currentUser = "";
         String permission  = "";
         if(request.getSession().getAttribute("currentUser") != null)
         {
        	 User user = (User)request.getSession().getAttribute("currentUser");
        	 currentUser = user.getName();
        	 permission = user.getPermission();
         }        
     %>
     
     <title>${title}</title>
     
     <link href="${context}/js/bootstrap/css/bootstrap.min1.css" rel="stylesheet"> 
     <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${context}/js/bootstrap-table/bootstrap-table.css">
     
     <script src="${context}/js/bootstrap/html5shiv.min.js"></script>
     <script src="${context}/js/bootstrap/respond.min.js"></script>   
    
     <script type="text/javascript" src="${context}/js/jquery/jquery.min.js"></script>
     <script type="text/javascript" src="${context}/js/bootstrap/bootstrap.min.js"></script>
    <script src="${context}/js/bootstrap-table/bootstrap-table.js"></script>
    <script src="${context}/js/bootstrap-table/bootstrap-table-locale-zh-CN.js"></script>

     <script >
/*     //打开客服咨询界面
     function openhelp(){
         window.open(
             '${context}/custom/main',
             "",
             "directories=no,height=100,location=no,menubar=no,resizable=no,status=no,titlebar=no,toolbar=no,top=50,left=450,height=515,width=750"
             )
         }*/

     //验证用户名是否注册
     var rsLoginName=false;
     function ajaxsubmit()
     {
     	var id = "loginname";
     	
	 	var value = $("#" + id).val();
     	$.ajax({
			url:"${context}/register/datas?datas=loginname",//要请求的servlet
			data:"loginname="+value,//给服务器的参数
			type:"POST",
			dataType:"text",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
			cache:false,
			success:function(result) {
				if(result == "true") {//如果校验失败
					$("#" + id + "Error").text("用户名已被注册！");
					showError($("#" + id + "Error"));
					rsLoginName=true;
				}else{
					rsLoginName=false;
				}
				
			}
		});
     	//return rsLoginName;
     }
     //验证管理员姓名是否注
    var rsUserName=false;
  	function ajaxusername()
     {
     	var id = "username";
	 	var value = $("#" + id).val();
     	$.ajax({
			url:"${context}/register/datas?datas=username",//要请求的servlet
			data:"username="+value,//给服务器的参数
			type:"POST",
			dataType:"text",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
			cache:false,
			success:function(msg) {
				if(msg == "true") {//如果校验失败
					$("#" + id + "Error").text("此姓名已被注册！");
					showError($("#" + id + "Error"));
					rsUserName=true;
				}else{
					rsUserName=false;
				}
				
			}
		});
     	//return rsUserName;
     } 
  	 //验证管理员联系方式是否注册
   var rsPhoneNumber=false;
  	function ajaxuphoneNumber()
     {
     	var id = "phoneNumber";
	 	var value = $("#" + id).val();
     	$.ajax({
			url:"${context}/register/datas?datas=phoneNumber",//要请求的servlet
			data:"phoneNumber="+value,//给服务器的参数
			type:"POST",
			dataType:"text",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
			cache:false,
			success:function(msg) {
				if(msg == "true") {//如果校验失败
					$("#" + id + "Error").text("此手机号已被注册！");
					showError($("#" + id + "Error"));
					rsPhoneNumber=true;
				}else{
					rsPhoneNumber=false;
				}
				
			}
		});
     	//return rsPhoneNumber;
     } 
  	 //验证管理员邮箱是否注册
  	var rsEmail=false;
  	function ajaxemail()
     {
     	var id = "email";
	 	var value = $("#" + id).val();
     	$.ajax({
			url:"${context}/register/datas?datas=email",//要请求的servlet
			data:"email="+value,//给服务器的参数
			type:"POST",
			dataType:"text",
			async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
			cache:false,
			success:function(msg) {
				if(msg == "true") {//如果校验失败
					$("#" + id + "Error").text("此邮箱已被注册！");
					showError($("#" + id + "Error"));
					rsEmail=true;
				}
				else{
					rsEmail=false;
				}
			}
		});
     } 
     </script> 
     <style>
       body{
           padding-top:10px;
       }
       .socials {
           padding: 30px;
       }
     </style>   
</head>