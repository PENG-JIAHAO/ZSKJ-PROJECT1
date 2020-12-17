<%@page import="org.apache.commons.lang3.ObjectUtils"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>

        <style>
            .tab-content{
                display: none;
            }
            .tab-content.active{
                display: block;
            }
        </style>
        <script type="text/javascript">

            function tabDefault() {
                $('.tabs-contents').find('#tabContent1').addClass('active').siblings().removeClass('active');
                allShopListTab();
            }

            function OperatorInfo(beforeId,afterId) {
                window.location.href = "${context}/review/OperatorInfo?beforeId=" + beforeId+"&afterId="+afterId ;
            }

            $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素

            //新增按钮跳转页面
            function addOperator() {
                window.location.href = "${context}/review/addOperator.jsp";
            }

            //删除按钮
            function deleteSelects()
            {
                var obj=$('#allShopListTab');
                var shop_id = $.map(obj.bootstrapTable('getSelections'), function (row) {
                    return  row.shop_id;
                });
                if(shop_id.length==0)
                {
                    alert("请选择删除项");
                }else{
                    var r=confirm("是否确认删除？");
                    if(r==true){
                        window.location.href="${context}/review/deleteShop?shop_id="+shop_id;
                    }
                }
            }
        </script>
        <script src="${context}/js/jquery/jq.js"></script>
        <script src="${context}/js/jquery/imgViewer.js"></script>

    </head>

    <body onload="tabDefault()">
        <ul id="checktab" class="nav nav-pills">
            <li class="active" data-id="tabContent1"><a href="#" onclick="tabChange()" data-toggle="tab">设备商管理</a></li>
        </ul>

        </br>

        <div class="tabs-contents">
            <div id="toolbar" class="btn">
                <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#addOperator">新增</button>
                <button type="button" class="btn btn-default" onclick="deleteSelects()">删除</button>
            </div>
            <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
                <table class="table table-hover" id="allShopListTab">
                </table>
            </div>
        </div>

        <%--新增按钮模态框--%>
        <div class="modal fade" id="addOperator" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 800px">
                <form action="${context}/review/addCompany" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <p>填写基础信息:</p>
                    </div>
                    <div class="modal-body" style="margin-bottom:20px;margin-top:10px" id="reviewTabContent" >
                        <div class="row clearfisx" align="center">
                            <div class='tab-pane' id='add'>
<%--                               <form action="${context }/review/addCompany" method="post" onsubmit="return ckShopAddForm()">--%>
                                    <table class="child2" >
                                        <tr>
                                            <td><input type="hidden" name="forward" value="addmanager"></td>
                                        </tr>
                                        <tr>
                                            <td >企业机构代码:</td>
                                            <td><input name="companyId" placeholder="输入企业机构代码" type="text" class="inputClass" id="companyId" onBlur="ajaxsubmit()"></td>
                                            <td class="tdError"><label class="errorClass" id="companyIdError">${requestScope.errors.loginname}</label></td>
                                            <td style="margin-left: 10px">企业名称：</td>
                                            <td ><input name="companyName" placeholder="输入企业名称" type="text" id="companyName" class="inputClass" onBlur="ajaxemail()"></td>
                                            <td class="tdError"> <label class="errorClassTwo" id="companyNameError" >${requestScope.errors.email}</label></td>
                                        </tr>
                                        <tr>
                                            <td>法人:</td>
                                            <td><input class="inputClass" placeholder="输入法人" type="text"
                                                       name="legalPerson" id="legalPerson" oncopy="return false" onpaste="return false"></td>
                                            <td class="tdError"><label class="errorClass" id="legalPersonError">${requestScope.errors.password }</label>
                                            <td style="margin-left: 10px">身份证号:</td>
                                            <td ><input name="legalPersonId" placeholder="输入身份证号" type="text" class="inputClass" id="legalPersonId" onBlur="ajaxsubmit()"></td>
                                            <td class="tdError"> <label class="errorClassTwo" id="legalPersonIdError" >${requestScope.errors.email}</label></td>
                                        </tr>
                                        <tr>
                                            <td>公司邮箱:</td>
                                            <td> <input name="companyEmail" placeholder="输入公司邮箱" type="text"
                                                        id="companyEmail" class="inputClass" onBlur="ajaxusername()"></td>
                                            <td class="tdError"> <label class="errorClass" id="companyEmailError" >${requestScope.errors.username}</label>
                                            </td>
                                            <td style="margin-left: 10px">联系方式:</td>
                                            <td ><input name="phoneNumber" placeholder="输入公司邮箱" type="text" id="phoneNumber" class="inputClass" onBlur="ajaxusername()"></td>
                                            <td class="tdError"> <label class="errorClassTwo" id="phoneNumberError" >${requestScope.errors.email}</label></td>
                                        </tr>
                                        <tr></tr>
                                        <tr>
                                            <td>传真:</td>
                                            <td > <input name="companyFax" placeholder="输入传真" type="text" id="companyFax" class="inputClass" onBlur="ajaxuphoneNumber()"></td>
                                            <td class="tdError"> <label class="errorClass" id="companyFaxError" >${requestScope.errors.phoneNumber}</label>
                                            </td>
                                            <td style="margin-left: 10px">邮政编码:</td>
                                            <td > <input name="postalCode" placeholder="输入邮政编码" type="text" id="postalCode" class="inputClass" onBlur="ajaxuphoneNumber()"></td>
                                            <td class="tdError"> <label class="errorClass" id="postalCodeError" >${requestScope.errors.phoneNumber}</label>
                                            </td>
                                        </tr>
                                        <tr></tr>
                                    </table>
<%--                                </form>--%>
                            </div>
                        </div>
                    </div><!-- /.modal-body -->
                    <div class="modal-footer">
                        <div align="center">
                            <tr>
                                <td align="center" class="child2-button" >
                                    <label>
                                        <input name="submit" id = "btnSubmit" class="btn btn-default" type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </label>
                                </td>
                                <td></td>
                                <td align="center" class="child2-button" >
                                    <label>
                                        <input name="reset" id = "btnReset" class="btn btn-default" data-dismiss="modal" type="reset" value="返回">&nbsp;&nbsp;&nbsp;
                                    </label>
                                </td>
                            </tr>
                        </div>
                    </div><!-- /.modal-footer -->
                </div><!-- /.modal-contxent -->
                </form>
            </div><!-- /.modal-dialog -->
        </div>
        <c:set var="msg" value="${request.getAttribute('msg')}"/>
        <c:out value="${msg}"></c:out>
    </body>

    <script>
        function allShopListTab(){
        $("#allShopListTab").bootstrapTable({
            url:'${context}/review/getAllShopInfo',
            striped: true,
            sortable: true,
            pagination: true,
            showLoading: true,
            toolbar:"#toolbar",
            search:true,
            showRefresh: true,
            sidePagination:'server',
            sortName:'id',
            sortOrder:'asc',
            clickToSelect:true,//是否启用点击选中行
            maintainSelected :true,
            pageNumber:1,
            pageSize:10,
            pageList:[5,10],
            queryParamsType:'limit',
            queryParams: function (params) {
                return params;
            },
            rowStyle: function rowStyle(row, index) {
                var classes = ['active', 'success', 'info', 'warning', 'danger'];
                if (index % 2 === 0 && index / 2 < classes.length) {
                    return {
                        classes: classes[index / 2]
                    };
                }
                return {};
            },
            onSort: function (name, order) {

            },
            onLoadSuccess: function (data) {

            },
            onLoadError: function (status) {

            },
            columns:[{
                checkbox: true
            },{
                field:'shop_name',
                title:'店铺简称',
                sortable: true,
                order:'asc',
                valign: 'middle',
                align: 'center'
            },{
                field: 'shop_id',
                title: '店铺编号',
                valign: 'middle',
                align: 'center'
            },{
                field: 'person_name',
                title: '联系人',
                valign: 'middle',
                align: 'center'
            }, {
                field: 'person_phone',
                title: '联系人电话',
                valign: 'middle',
                align:'center'
            }]
        });
    }

        function ckShopAddForm(){
            var flag=true;
            var loginNames=/^\w{3,20}$/;
            var loginName=$("#loginname").val();
            var userNames=/^[\u4E00-\u9FA5A-Za-z0-9_]{2,20}$/;
            var userName=$("#username").val();
            var emails=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;/* 邮箱验证 */
            var email = $("#email").val();
            var tels=/^1\d{10}$/;/* 电话号码验证 */
            var phoneNumber = $("#phoneNumber").val();
            if($("#companyId").val()==""  ||  $("#companyName").val()=="" || $("#legalPerson").val()=="" || $("#legalPersonId").val()==""  || $("#accountantName").val()==""
                || $("#companyAddress").val()=="" || $("#companyEmail").val()=="" || $("#phoneNumber").val()=="" || $("#companyFax").val()==""|| $("#postalCode").val()==""){
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
</html>
