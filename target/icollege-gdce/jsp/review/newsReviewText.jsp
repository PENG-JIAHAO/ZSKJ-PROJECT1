<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/jsp/header.jsp" %>
<%@ page import="com.isscollege.gdce.domain.News,
                 com.isscollege.gdce.domain.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${context}/js/jquery/imgViewer.js"></script>
<script>
    function onclick1()
    {
        window.location.href = "${context}/review/newsReview";
    }
</script>
<body>
<c:set var="news" target="${News }" value="${requestScope.news}"> </c:set>

<hr/>
<div class="container" border="1px"
     style="width: 890px; height: 60ch ; box-shadow:5px 5px 20px #aaa " ${sessionScope.news.toString()} >
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab">
            <span style="font-size:14px;color:black; font-family:微软雅黑">内容</span>
        </a>
    </ul>
    <div>
        <tr>
            <td width="30%"></td>
            <td align="left">${news.content}</td>
        </tr>
    </div>
    <div  style="position:fixed; ;left:1% ;top:0%"><br/>
        <button type="button" class="btn btn-default" onclick="onclick1()">返回</button>
    </div>
</div>
</body>
</html>