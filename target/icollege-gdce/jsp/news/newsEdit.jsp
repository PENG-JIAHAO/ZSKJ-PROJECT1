<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" charset="utf-8"
	src="${context}/js/ckeditor/ckeditor.js"></script>

	<style type="text/css">
		div {
			width: 100%;
		}
		
		a {
			text-decoration: none;
		}
		
		a:hover {
			text-decoration: underline;
		}
		
		.top {
			border-collapse: collapse;
			border: 1px solid yellow;
			width: 50%;
			height: 100%;
			float: left;
		}
		
		#top {
			border-collapse: collapse;
			text-align: center;
			padding-top: 17px;
			width: 493px;
			height: 45px;
		}
		
		#picture {
			border-collapse: collapse;
			border: 1px solid black;
			margin: 0 auto;
			width: 995px;
			height: auto;
		}
		
		#layout {
			border-collapse: collapse;
			border: 1px solid blue;
			margin: 0 auto;
			width: 995px;
			height: 500px;
		}
		
		.littleTitle {
			border-collapse: collapse;
			border: 1px solid black;
			float: left;
			width: 25%;
			text-align: center;
		}
		
		#special {
			border-collapse: collapse;
			border: 1px solid black;
			float: left;
			width: 240px;
		}
	</style>

	<script type="text/javascript">
		function judge()
		{
			var pass=${permission==3?1:2}

			if(pass==1)
				{
					window.location.href="${context}/jsp/report/reportIndex.jsp";
			} else {
				$('#modal-container-204152').modal();
			}
		}
		function myfunction(){
			if(document.getElementById("name").value=='')
			{
				$('#modal-container-204155').modal();
				return false;    				
			}
			if(document.getElementById("title").value=='')
			{
				$('#modal-container-204156').modal();
				return false;    				
			}	
			if((ed.getData().replace(/<\/?p[^>]*>|&nbsp;/g,"")).trim() == '')
			{
				$('#modal-container-204157').modal();
				return false;  				
			}
				return true; 
		}
	</script>

<body>
	<div class="modal fade" id="modal-container-204155" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">用户名称不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204156" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">标题不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204157" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">资讯内容不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204152" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">您没有权限访问</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<h3 class="text-muted">
					<a href="${context}"><img alt="logo" src="${context}/imgs/logo.png"></a>
				</h3>
			</nav>
		</div>
	</div>


	<div id="picture">
		<img src="${context}/imgs/news/banner004.png"
			alt="banner004" />
	</div>
<script>

</script>
	<div id="form">
		<form action="${context}/news/addNews" method="post" >
			<table border="1px" width="995px" align="center" cellpadding="0px"
				cellspacing="0px">
				<tr height="50px">
					<td colspan="2" align="center"><b>资讯上传</b></td>&nbsp;&nbsp;
				</tr>
				<tr height="50px">
					<td align="center">选择类型</td>
					<td><select name="type">
							<option name="type" value="hgzc">宏观政策</option>
							<option name="type" value="scfx">市场分析</option>
							<option name="type" value="dlhy">电力行业</option>
							<option name="type" value="mtjg">煤炭价格</option>
					</select></td>
				</tr>

				<tr height="50px">
					<td align="center">用户名称</td>
					<td><input type="text" name="name" id="name">
					</td>
				</tr>
				
				<tr height="50px">
					<td align="center">标题</td>
					<td><input type="text" name="title" id="title" /></td>

				</tr>
				
				<tr height="200px">
					<td align="center">资讯内容</td>
					<!--文本框 -->
					<td><textarea rows="50" cols="50" name="content" id="content"></textarea>
						<script type="text/javascript" >var ed=CKEDITOR.replace("content");</script>
					</td>
				</tr>
				
				<tr height="50px">
					<td align="center">操作</td>
					<td>&nbsp;&nbsp;&nbsp;<input type="submit" value="提交" onclick="return myfunction();" >&nbsp;&nbsp;&nbsp;
						<input type="button" value="返回"
						onclick="javascript:history.back();"></td>
					<td><input type="hidden" name="forward" value="addNews"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>
		<h5>
			<a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br>
			<br> 网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
			地址：北京市昌平区未来科技城 邮编：102209
			电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
			电子邮箱：fuel@powerec.net
		</h5>
		</p>
	</div>
</body>
</html>








<!-- 文本框 -->
