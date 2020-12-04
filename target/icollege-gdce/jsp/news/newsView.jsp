<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
		<script type="text/javascript" charset="utf-8" src="${context}/js/ckeditor/ckeditor.js"></script>
		<style type="text/css">
		 div{
            width:100%;
        	}
        			
			#picture{
				border-collapse: collapse;
				border: 1px solid black;
				margin: 0 auto;
				width: 995px;
				height: auto;
			}
			
			#layout{
				border-collapse: collapse;
				border: 1px solid blue;
				margin: 0 auto;
				width: 995px;
				height: 500px;
				}
			
			.littleTitle{
				border-collapse: collapse;
				border: 1px solid black;
				float: left;
				width: 25%;
				text-align: center;
			}
			
			#special{
				border-collapse: collapse;
				border: 1px solid black;
				float: left;
				width: 240px;
			}
		</style>
	
	<body>					
		<div class="container">
			<div class="header clearfix">
				<nav class="navbar">
					<h3 class="text-muted">
						<img alt="logo" src="${context}/imgs/logo.png">
					</h3>
				</nav>
			</div>
		</div>
	
		<div id="picture">
			<img src="${context}/imgs/news/banner004.png" alt="banner004" />
		</div>
		<div id="table" >
			<table border="1px" width="995px" align="center" cellpadding="0px" cellspacing="0px" >
				<tr height="50px">					    
					<td colspan="2" align="center">资讯预览</td>
				</tr>
				<tr height="50px">					
					<td align="center" width="100px">选择类型</td>
					<td>${type}</td>						
				</tr>
				<tr height="50px">
					<td align="center">用户名称</td>
					<td>${username}</td>
				</tr >
				<tr height="50px">
					<td align="center">标题</td>
					<td>${newstitle}</td>
				</tr>
				<tr height="200px">
					<td align="center">资讯内容</td>
					<td>${content}</td>
				</tr>	
				<tr height="50px">
					<td align="center">操作</td>
					<td colspan="2"><input type="button" value="返回" onclick="javascript:history.back();" ></td>					
				</tr>
			</table>		
		</div>
		<div class="jumbotron text-center" style="margin-bottom:0">
		  <p><h5><a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br><br>
		     网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
		地址：北京市昌平区未来科技城 邮编：102209 电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
		                                                     电子邮箱：fuel@powerec.net</h5></p>
		</div>
	</body>
</html>