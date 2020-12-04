<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <title>客服咨询</title>
    <script type="text/javascript" src="${context}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${context}/js/layui/layui.js"></script>
    <style type="text/css">
        body{
            background-color: #66c4ff;
        }
        .messagetitle{
            margin-top: 13px;
            margin-bottom: 20px;
            margin-left: 24px;
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 5px;
            margin-right: 5px;
            margin-left: 5px;
            border-top-left-radius: 5%;
            border-top-right-radius: 5%;
            border-bottom-left-radius: 5%;
            border-bottom-right-radius: 5%;
            box-shadow: 0px 0px 10px 2px black;
            background-color: #61ebff;
        }
        .userheadimgtitle{
            border-radius: 100%;
            width: 40px;
            height: 40px;
            margin-left: 5px;
            border: black solid 1px;
        }
        .usertitle{
            margin-left: 15px;
            vertical-align: top;
        }
        .customtitle{
            margin-left: 30%;
            vertical-align: top;
        }
        .sendmessage-div{
            margin-top: 20px;
            margin-left: 20px;
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 5px;
            padding-bottom: 5px;
            margin-right: 5px;
            margin-left: 5px;
            border-top-left-radius: 5%;
            border-top-right-radius: 5%;
            border-bottom-left-radius: 5%;
            border-bottom-right-radius: 5%;
            box-shadow: 0px 0px 10px 2px black;
            background-color: #61ebff;
        }
        .sendtext{
            width: 70%;
            height: 40px;
            margin-left: 5px;
        }
        .sendexpression{
            width: 45px;
            height: 40px;
            border-radius: 100%;
            margin-left: 40px;
        }
        .sendbutton{
            width: 60px;
            height: 40px;
            margin-left: 30px;
        }
        .expressionmanage{
            display: none;
            position: absolute;
            margin-top: -200px;
            margin-left: 28%;
            border: #9F9F9F solid 1px;

        }
        .expression{
            width: 20px;
            height: 20px;
        }
        .messageshow{
            height: 400px;
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 5px;
            margin-right: 5px;
            margin-left: 5px;
            border-top-left-radius: 5%;
            border-top-right-radius: 5%;
            border-bottom-left-radius: 5%;
            border-bottom-right-radius: 5%;
            box-shadow: 0px 0px 20px 2px black;
            background-color: whitesmoke;
            overflow: auto;
            display: block;
        }
        .usermessage{
            text-align: right;
            list-style: none;
            right: 10px;
        }
        .custommessage{
            text-align: left;
            list-style: none;
            left: 10px;
        }
        .headimg{
            border-radius: 50%;
            border: black solid 1px;
            width: 30px;
            height: 30px;
        }
        .messagedate{
            vertical-align: top;
            color: #1E9FFF;
        }
        .usermessage-text{
            background-color: #8effe7;
            padding-left: 30px;
            padding-right: 20px;
            padding-top: 5px;
            padding-bottom: 10px;
            border-top-left-radius: 20%;
            border-top-right-radius: 20%;
            border-bottom-left-radius: 20%;
            border-bottom-right-radius: 50%;
            border: #9F9F9F solid 1px;
            margin-left: 50%;
            height: auto;
        }
        .custommessage-text{
            background-color: #34ffec;
            padding-right: 30px;
            padding-left: 20px;
            padding-top: 5px;
            padding-bottom: 10px;
            border-top-left-radius: 20%;
            border-top-right-radius: 20%;
            border-bottom-left-radius: 50%;
            border-bottom-right-radius: 20%;
            border: #9F9F9F solid 1px;
            margin-right: 50%;
            height: auto;
        }

    </style>
</head>
<body>
<!--信息显示-->
<div class="messagetitle">
    <span><img src="${context}/js/layui/images/face/user.jpg" class="userheadimgtitle"></span>
    <span class="usertitle" id="userstate">
        <c:choose>
            <c:when test="${username!=null}">
                ${username}
            </c:when>
            <c:otherwise>
                未登录
            </c:otherwise>
        </c:choose>
    </span>
    <span class="customtitle">客服在线</span>
</div>
<!--消息显示区-->
<div class="messageshow" ><div id="meassageShow"></div></div>
<!--消息输入区-->
<div id="send" class="sendmessage-div">
    <span><input type="text" placeholder="请输入需要咨询的问题" id="sendText" class="sendtext"/></span>
    <span><button class="sendexpression" onclick="showexpression()">表情</button></span>
    <span><button id="sendButton" type="button" class="sendbutton">发送</button></span>
</div>
<!--表情选择区-->
<div id="expressionmanage" class="expressionmanage" align="center">
    <table>
        <tr>
            <td><button><img src="${context}/js/layui/images/face/0.gif" class="expression" onclick="switchexpression('#0#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/1.gif" class="expression" onclick="switchexpression('#1#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/2.gif" class="expression" onclick="switchexpression('#2#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/3.gif" class="expression" onclick="switchexpression('#3#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/4.gif" class="expression" onclick="switchexpression('#4#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/5.gif" class="expression" onclick="switchexpression('#5#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/6.gif" class="expression" onclick="switchexpression('#6#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/7.gif" class="expression" onclick="switchexpression('#7#')"></button></td>
        </tr>
        <tr>
            <td><button><img src="${context}/js/layui/images/face/8.gif" class="expression" onclick="switchexpression('#8#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/9.gif" class="expression" onclick="switchexpression('#9#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/10.gif" class="expression" onclick="switchexpression('#10#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/11.gif" class="expression" onclick="switchexpression('#11#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/12.gif" class="expression" onclick="switchexpression('#12#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/13.gif" class="expression" onclick="switchexpression('#13#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/14.gif" class="expression" onclick="switchexpression('#14#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/15.gif" class="expression" onclick="switchexpression('#15#')"></button></td>
        </tr>
        <tr>
            <td><button><img src="${context}/js/layui/images/face/16.gif" class="expression" onclick="switchexpression('#16#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/17.gif" class="expression" onclick="switchexpression('#17#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/18.gif" class="expression" onclick="switchexpression('#18#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/19.gif" class="expression" onclick="switchexpression('#19#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/20.gif" class="expression" onclick="switchexpression('#20#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/21.gif" class="expression" onclick="switchexpression('#21#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/22.gif" class="expression" onclick="switchexpression('#22#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/23.gif" class="expression" onclick="switchexpression('#23#')"></button></td>
        </tr>
        <tr>
            <td><button><img src="${context}/js/layui/images/face/24.gif" class="expression" onclick="switchexpression('#24#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/25.gif" class="expression" onclick="switchexpression('#25#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/26.gif" class="expression" onclick="switchexpression('#26#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/27.gif" class="expression" onclick="switchexpression('#27#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/28.gif" class="expression" onclick="switchexpression('#28#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/29.gif" class="expression" onclick="switchexpression('#29#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/30.gif" class="expression" onclick="switchexpression('#30#')"></button></td>
            <td><button><img src="${context}/js/layui/images/face/31.gif" class="expression" onclick="switchexpression('#31#')"></button></td>
        </tr>

    </table>
</div>

<!--处理函数-->
<script type="text/javascript">
    //客服窗口初始化
    window.onload=function (){
        wellcom();
    }
    function wellcom(){
        $.ajax({
            url:"${context}/custom/wellcom",
            type:"get",
            dataType: "text",
            success: function (data) {
                let custommessage=getCustomMessage(data);
                displayCustomMessage(custommessage);
            }
        })
    }
    //用户信息信息处理
    function messageHandle(message){
        let handleMessage=message;
        handleMessage=jpgToHtml(handleMessage);
        return handleMessage;
    }
    //信息中表情图信息处理
    function jpgToHtml(handleMessage){
        for(let i=0;i<72;i++){
            let expression="<img src='${context}/js/layui/images/face/"+i+".gif' class='expression'>";
            var str="#".concat(i+"#");

            //动态替换表情指令
            handleMessage=handleMessage.replace(new RegExp(str,'g'),expression);
        }
        return handleMessage;

    }
    //选择需要发送表情
    function switchexpression(expression){
        let sendText = $("#sendText");
        sendText.val(sendText.val()+expression);
    }

    //显示与隐藏表情框
    function showexpression(){
        let expressionmanage = document.getElementById("expressionmanage");
        if(expressionmanage.style.display=="none"){
            expressionmanage.style.display="block";
        }
        else{
            expressionmanage.style.display="none";
        }
    }
    //消息滚动条自动到底部
    function scrollDown(){
        let messageShow = document.getElementById("meassageShow");
        if(messageShow.hasAttribute("scroll")){return false;}
        messageShow.scrollTop=messageShow.scrollHeight;

    }
    //用户消息数据获取
    function getUserMessage()
    {
        //用户消息数据
        let date = new Date();
        let usermessage={
            headimg:"${context}/js/layui/images/face/user.jpg",
            name:"${username}",
            date: date.toLocaleTimeString(),
            message:messageHandle($("#sendText").val())
        };
        return usermessage;
    }
    //客服消息数据获取
    function getCustomMessage(message){
        //从后台获取客服消息数据
        //客服消息数据
        let date = new Date();
        let custommessage={
            headimg:"${context}/js/layui/images/face/custom.jpg",
            name:"小煤",
            date: date.toLocaleTimeString(),
            message:messageHandle(message)
        };
        return custommessage;
    }
    //用户消息渲染
    function displayUserMessage(usermessage){
        let laytpl=layui.laytpl;
        //用户消息信息渲染到模板
        laytpl($("#usermesage").html()).render(usermessage,function (html){
            $("#meassageShow").append(html);
            $("#sendText").val("")
        });
    }
    //客服消息渲染
    function displayCustomMessage(custommessage){
        let laytpl=layui.laytpl;
        //客服消息信息渲染到模板
        laytpl($("#custommessage").html()).render(custommessage,function (html){
            $("#meassageShow").append(html);
        });
    }
    //输入框绑定回车事件
    $('#sendText').bind('keyup', function(event) {
        if (event.keyCode == "13") {
            //回车执行发送
            $('#sendButton').click();
        }
    })
    //表情点击绑定回车事件
    $('#expressionmanage').bind('keyup', function(event) {
        if (event.keyCode == "13") {
            //回车执行发送
            $('#sendButton').click();
        }
    })
</script>
<!--用户消息模板-->
<script type="text/html" id="usermesage">
    <li class="usermessage">
        <div class="user">
            <img src="{{d.headimg}}" class="headimg">
            <city class="messagedate">{{d.name}}:
                <i>{{d.date}}</i>
            </city>
        </div>
        <div class="usermessage-text">{{d.message}}</div>
    </li>
</script>
<!--客服信息模板-->
<script type="text/html" id="custommessage">
    <li class="custommessage">
        <div class="custom">
            <img src="{{d.headimg}}"class="headimg">
            <city class="messagedate">{{d.name}}:
                <i>{{d.date}}</i>
            </city>
        </div>
        <div class="custommessage-text">{{d.message}}</div>
    </li>
</script>
<!--数据渲染-->
<script>
    layui.use(['layer','laytpl'],function (){
        $("#sendButton").click(function () {
            //用户未登录不能发送信息
            var str=$("#userstate").text();
            if(str=="\n" +
                "        \n" +
                "            \n" +
                "            \n" +
                "                未登录\n" +
                "            \n" +
                "        \n" +
                "    "){
                alert("请您在进行登录后在进行操作！");
                return false;
            }
            //用户发送消息事件
            if($("#sendText").val()==""){
                alert("输入信息不能为空！");
                return false;
            }
            //获取所需渲染的数据
            let usermessage=getUserMessage();
            let custommessage=getCustomMessage($("#sendText").val());

            //数据渲染
            displayUserMessage(usermessage);
            displayCustomMessage(custommessage);
            scrollDown();
        })
    });
</script>
</body>