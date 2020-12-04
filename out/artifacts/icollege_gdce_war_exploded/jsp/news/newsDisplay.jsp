<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.isscollege.gdce.domain.News"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/jsp/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>资讯显示页面</title>
		
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			a{
				text-decoration: none;
			}
			
			a:hover{
				text-decoration: underline;
			}
			
			li:not(.special){
				float: left;
				list-style: none;
			}
			
			#father{
				border-collapse: collapse;
				border: 0px solid red;
				width: 100%;
				height: auto;
				margin: 20px auto 0px;
			}
			
			#guide{
				border-collapse: collapse;
				border: 0px solid blue;
				margin: 0 auto;
				width: 995px;
				height: 62px;
			}
			
			.top{
				border-collapse: collapse;
				border: 0px solid yellow;
				width: 50%;
				height: 100%;
				float: left;
			}
			
			#top{
				border-collapse: collapse;
				text-align: center;
				padding-top: 17px;
				width: 493px;
				height: 45px;
			}
			
			#picture{
				border-collapse: collapse;
				border: 0px solid black;
				margin: 0 auto;
				width: 995px;
				height: auto;
			}
			
			#biaoqian{
				border-collapse: collapse;
				border: 0px solid gray;
				width: 995px;
				height: 45px;
				margin: auto;
				margin-top: 20px;
			}
			
			#nei{
				border-collapse: collapse;
				border: 0px solid gray;
				margin-top: 15px;
				font-size: 18px;
				line-height: 30px;
			}
			
			#text_title{
				border-collapse: collapse;
				border: 0px solid gray;
				width: 995px;
				height: 50px;
				font-family: "微软雅黑", "黑体";
				margin: auto;
				text-align: center;
			}
			
			.msgbar {
			    line-height: 30px;
			    text-align: center;
			    color: #999;
			    font-size: 15px;
			}
			
			#text{
				border-collapse: collapse;
				border: 0px solid gray;
				width: 995px;
				height: auto;
				margin: auto;
				font-size: 18px;
				line-height: 30px;
			}
			
			.pagebar {
    			text-align: center;
			}
			
			#next{
				border-collapse: collapse;
				border: 0px solid black;
				width: 995px;
				font-size: 15px;
				margin-left: 430px;
				margin: 10px auto 15px;
			}
			
			#lianjie{
				border-collapse: collapse;
				border: 0px solid black;
				width: 995px;
				margin: 30px auto 0px;
				background-color: rgba(0,0,0,0.23);
			}
			
			#contact{
				border-collapse: collapse;
				border: 0px solid black;
				background-color: black;
				color: white;
				width: 995px;
				margin: auto;
			}
		</style>
</head>
<body>
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
	<c:choose>
		<c:when test="${!empty username}">${username }</c:when>
		<c:otherwise >
			<a href="${context}/jsp/user/login.jsp">登录</a>&nbsp;&nbsp;
			<a href="${context}/jsp/user/register.jsp">注册</a>
		</c:otherwise>
	</c:choose>&nbsp;&nbsp;
	<a href="${context}/login/logout">退出</a>
</div>
<div id="father">
	<div class="container">

		<div class="header clearfix">
			<nav class="navbar">
				<ul class="nav nav-pills pull-right socials">
					<li role="presentation"><a
							href="${context}">首页</a></li>
					<li role="presentation"><a href="#" onClick="warring()">交易中心</a></li>
				<li role="presentation"class="active"><a
						href="${context}/news/findPageBean?type=hgzc&currentPage=1">资讯中心</a></li>
				<li role="presentation"><a
						href="${context}/jsp/report/reportIndex.jsp">报表中心</a></li>
				<li role="presentation"><a
						href="${context}/jsp/user/com_qualification.jsp">会员中心</a></li>
			</ul>
			<h3 class="text-muted">
				<a href="${context}"><img alt="logo"
										  src="${context}/imgs/logo.png"></a>
			</h3>
		</nav>
	</div>
</div>
			<div id="biaoqian">
				<div id="nei">
	        	当前位置：<a href="${context}/news/findPageBean?type=hgzc&&currentPage=1" class="lili-a">资讯中心</a>
	        	> <a href="${context}/news/findPageBean?type=${news.type}&&currentPage=1" >${type}</a>
	        	> 正文
	        	</div>
       		</div>
       		
       		<div id="text_title">
       			<h1>${news.title}</h1>
       		</div>

			<div class="msgbar">
				<span>发布时间：${news.createDate}</span>
				<span>作者：${news.name}</span>
			</div>
			
			<div id="text">
				${news.content}
			</div>


			<div id="next">
				<c:if test="${n>0}">
				<c:set var="shang" value="${list.get(n-1)}"/>
				</c:if>
				<c:if test="${n<7}">
				<c:set var="xia" value="${list.get(n+1)}"/>
				</c:if>
				<ul style="list-style: none;margin-top: 30px">
					<c:if test="${n-1==-1}">
						<li class="special" ><strong style="cursor: pointer" >上一篇：</strong><a onclick="a('${context}','${shang.title}',${n-1})">${shang.title}</a></li>
					</c:if>
					<c:if test="${n-1!=-1}">
						<li class="special" style="cursor: pointer" ><strong>上一篇：</strong><a onclick="a('${context}','${shang.title}',${n-1})">${shang.title}</a></li>
					</c:if>
					<li class="special" style="cursor: pointer" ><strong>下一篇：</strong><a  onclick="a('${context}','${xia.title}',${n+1})">${xia.title}</a></li>
				</ul>
				<script>
					function a(contextElement,titleElement,n) {   //编码title中“%”
						var url = contextElement+"/news/newsDisplay?title="+encodeURI(titleElement)+"&type=${news.type}"+"&n="+n
						window.location = url;
					}
				</script>

			</div>
			
			<div id="lianjie">
				
				<p>友情链接:</p>
				
				<a href="#"><span>中国国电集团&nbsp|&nbsp</span></a>
				<a href="#"><span>郑州商品交易所&nbsp|&nbsp</span></a>
				<a href="#"><span>中国煤炭市场网&nbsp|&nbsp</span></a>
				<a href="#"><span>上海煤炭交易中心&nbsp|&nbsp</span></a>
				<a href="#"><span>神华煤炭交易网&nbsp|&nbsp</span></a>
				<a href="#"><span>伊泰集团&nbsp|&nbsp</span></a>
				<a href="#"><span>中国煤炭资源网&nbsp|&nbsp</span></a>
				<a href="#"><span>太原煤炭交易中心&nbsp|&nbsp</span></a>
				<a href="#"><span>秦皇岛煤炭网&nbsp|&nbsp</span></a>
				<a href="#"><span>神华集团&nbsp|&nbsp</span></a>
				<a href="#"><span>内蒙古煤炭交易中心&nbsp|&nbsp</span></a>
				<a href="#"><span>中煤集团&nbsp|&nbsp</span></a>
				<a href="#"><span>中国海事服务网&nbsp|&nbsp</span></a>
				<a href="#"><span>同煤集团&nbsp|&nbsp</span></a>
				<a href="#"><span>上海航运交易所</span></a> 

			</div>
			
			<div class="jumbotron text-center" style="margin-bottom:0">
		  <p><h5><a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br><br>
		     	网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209 电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
		                                                     电子邮箱：fuel@powerec.net</h5></p>
		</div>
		</div>

</body>
</html>