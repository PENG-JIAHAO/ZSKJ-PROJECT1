<%@ page pageEncoding="UTF-8" import="java.util.*"
	import="com.isscollege.gdce.domain.User"
	import="java.util.List,com.isscollege.gdce.domain.News"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
			$(function(){
				var pageNumber = '${pageShow}';
				if(pageNumber == null || pageNumber=="")
				{
					$('#myTab a:first').tab('show');
				}
				else
				{
					if(pageNumber =="news")
					{
						$('#myTab a:last').tab('show');
					}
					else
					{
						$('#myTab a:first').tab('show');
					}
				}
			});

			function goNewsReview()
			{
				window.location.href("${context}/review/newsReview");
			}

			function successReview(newsInfoId)
			{
				window.location.href("${context}/review/newsAuditPass?id="+newsInfoId);
			}

			function failReview(newsInfoId)
			{
				window.location.href("${context}/review/newsFailAuditPass?id="
							+ newsInfoId);
			}

			$(function () {
				$(".nav-sel li a").each(function () {
					if ($(this)[0].href==String(window.location)){
						$(this).addClass("selected").siblings().removeClass("selected");
					}
				})
			})
	</script>

	<style type="text/css">
	.STYLE5 {
	font-size: large;
	font-weight: bold;
	display: block;
	height: 50px;
	width: 90px;
	margin-bottom: 10px;
	margin-left: -3px;
	line-height: 50px;
	text-align: center;
	}

	.STYLETOP {
		margin-top: -20px;
	}

	.STYLE5:hover {
		background-color: #bab4b4;
		text-decoration: none;
		border-radius: 5px;
	}

    .selected {
        background-color: #bab4b4;
        text-decoration: none;
        border-radius: 5px;
    }
</style>
<body>
    <c:if test="${empty user or user.level==2 or user.level==3 or user.level==4}">
    <c:redirect url="${context }"></c:redirect>
    </c:if>


	<div class="container text-right" style="margin-bottom: 0">
	    <c:choose>
	        <c:when test="${!empty currentUser}">${currentUser.name}</c:when>
	        <c:when test="${empty currentUser}">
	        <c:redirect url = "/jsp/user/login.jsp"></c:redirect>
	        </c:when>
	    </c:choose>&nbsp;&nbsp;
		<a href="${context}/login/logout">退出</a>
	</div>
	<div class="container">
		<div class="header clearfix">
			<nav class="navbar">
				<h3 class="text-muted">
					<img alt="logo" src="${context}/imgs/logo.png">
				</h3>
			</nav>
		</div>
	</div>

	<div class="box" align="center">
		<img alt="分割图" src="${context}/imgs/banner004.png">
	</div>
	<br>
	<br>
	<div align="center" class="locationD">
		<h2>管理员中心</h2>
	</div>
	<br>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-2 column">
						<div class="panel panel-default">
							<div class="panel-body" align="center">
							</div>
							<div id="child1">
								<ul style="list-style:none" style="list-style:none" class="nav-sel">
									<li><a href="${context}/news/adminPageBean?type=hgzc&&currentPage=1" class="STYLE5 STYLETOP">宏观政策</a></li>
									<li><a href="${context}/news/adminPageBean?type=scfx&&currentPage=1" class="STYLE5">市场分析</a></li>
									<li><a href="${context}/news/adminPageBean?type=dlhy&&currentPage=1" class="STYLE5">电力行业</a></li>
									<li><a href="${context}/news/adminPageBean?type=mtjg&&currentPage=1" class="STYLE5">煤炭价格</a></li>
									<li><a href="${context}/jsp/news/newsEdit.jsp" class="STYLE5">新增资讯</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-10 column" style="box-shadow:5px 5px 20px;width:875px">
						<table class="table cursor:pointer" id="adminNews">
							<caption></caption>
							<thead>
								<tr class="info ">
									<th style="text-align: center">资讯编号</th>
									<th width=250px style="text-align: center">资讯标题</th>
									<th style="text-align: center">资讯作者</th>
									<th style="text-align: center">创建时间</th>
									<th style="text-align: center">审核状态</th>
									<th style="text-align: center">编辑</th>
									<th style="text-align: center">操作</th>
								</tr>
								<c:set var = "i" value ="1"/>
							<c:forEach var="news" items="${pageBean.newsList}">
								<tr>
									<td style="text-align: center"><img src="${context}/imgs/news/${i}.png" alt="1" />&nbsp;&nbsp;</td>
									<c:set var ="i" value ="${i=i+1}"/>
									<td style="text-align: center ;cursor:pointer"><a onclick="newsdecode('${news.title}')">${news.title}</a></td>
									<script>
										function newsdecode(titleElement) {   //编码title中“%”
											var url = "${context}/news/getNewsByTitle?title="+encodeURI(encodeURI(titleElement))
											window.location = url;
										}
									</script>
									<script>
										function newsdecode_editor(titleElement) {   //编码title中“%”
											var url = "${context}/news/getNewsByTitle?title="+encodeURI(encodeURI(titleElement))+"&manager='true'"
											window.location = url;
										}
									</script>
   <%--<td style="text-align: center"><a href="${context}/news/getNewsByTitle?title=${(news.title)}&manager='true'">${news.title}</a></td>--%>
									<td style="text-align: center">${news.name}</td>
									<td style="text-align: center">${news.createDate}</td>
									<c:if test="${news.reviewState==0}">
										<td style="text-align: center">待审核</td>
										<td style="text-align: center">编辑</td>
										<td style="text-align: center">
									    <a href="${context}/news/deleteNews?title=${news.title}">删除</a>
									    </td>
									</c:if>
									<c:if test="${news.reviewState==2}">
										<td style="text-align: center">未通过</td>
										<td style="text-align: center"><a onclick="newsdecode_editor('${news.title}')">编辑</a></td>;

									   <td style="text-align: center">
                                   <a href="${context}/news/deleteNews?title=${news.title}">删除</a>
									    </td>
									</c:if>
									<c:if test="${news.reviewState==1}">
										<td style="text-align: center">审核通过</td>
										<td style="text-align: center"><a onclick="newsdecode_editor('${news.title}')">编辑</a></td>
										<td style="text-align: center">
									       <a href="${context}/news/deleteNews?title=${news.title}">删除</a>
									    </td>
									</c:if>
									<c:if test="${news.reviewState==3}">
										<td style="text-align: center">审核已撤销</td>
										<td style="text-align: center"><a onclick="newsdecode_editor('${news.title}')">编辑</a></td>
										<td style="text-align: center">
											<a href="${context}/news/deleteNews?title=${news.title}">删除</a>
										</td>
									</c:if>
								</tr>
							</c:forEach>


						</table>
							<div style="text-align: center" id="paging">
								<ul class="pagination">
									<c:if test="${pageBean.currentPage==1 }">
										 <li class="disabled"><a href="javaScript:void(0);">&laquo;</a></li>
									</c:if>
									<c:if test="${pageBean.currentPage!=1 }">
									  <li><a href="${context}/news/adminPageBean?type=${type}&&currentPage=${pageBean.currentPage-1}">&laquo;</a></li>
									</c:if>

								<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
										<!-- 判断当前页 -->
									<c:if test="${pageBean.currentPage==page }">
										<li class="active"><a href="javascript:void(0);">${page}</a></li>
									</c:if>
									<c:if test="${pageBean.currentPage!=page }">
										<li><a href="${context}/news/adminPageBean?type=${type}&&currentPage=${page}">${page}</a></li>
									</c:if>

								</c:forEach>

								<c:if test="${pageBean.currentPage==pageBean.totalPage}">
									<li class="disabled"><a href="javaScript:void(0);">&raquo;</a></li>
								</c:if>
								<c:if test="${pageBean.currentPage!=pageBean.totalPage}">
								  <li><a href="${context}/news/adminPageBean?type=${type}&&currentPage=${pageBean.currentPage+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; margin-top: 208px">
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


