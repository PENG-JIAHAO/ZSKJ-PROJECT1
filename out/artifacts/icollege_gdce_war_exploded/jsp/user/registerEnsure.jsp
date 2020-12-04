<jsp:useBean id="setHeaderMessage" scope="request" type=""/>

<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/jsp/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>

<style>
    .ensure-box {
        width: 600px;
        height: 200px;
        background-color: rgba(0,0,0,0.2);
        border-radius: 5px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-left: -300px;
        margin-top: -100px;
    }
</style>
<body>
        <div class="ensure-box">
            <p class="text-center h1" style="line-height: 100px">${alertMessage}</p>
            <p class="text-center h3 text-danger">
                <span id="ensureSecond">3</span>秒后页面自动跳转。
            </p>
        </div>

<script>
    var second = ensureSecond.innerText;
    setInterval("secondredirect()", 1000);
    function secondredirect()
    {
        ensureSecond.innerText=--second;
        if(second<1)
            location.href="${setHeaderMessage}";
    }
</script>
</body>
</html>
