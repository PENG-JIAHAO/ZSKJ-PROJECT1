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
                allCompanyListTab();
            }

            function deleteSelects()
            {
                var obj=$('#allCompanyListTab');
                var company_Id = $.map(obj.bootstrapTable('getSelections'), function (row) {
                    return row.company_Id;
                });
                if(company_Id.length==0)
                {
                    alert("请选择删除项");
                }else{
                    var r=confirm("是否确认删除？");
                    if(r==true){
                        window.location.href="${context}/review/deleteCompany?company_Id="+company_Id;
                    }
                }
            }

            function OperatorInfo(beforeId,afterId) {
                window.location.href = "${context}/review/OperatorInfo?beforeId=" + beforeId+"&afterId="+afterId ;
            }

            $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素

        </script>
        <script src="${context}/js/jquery/jq.js"></script>
        <script src="${context}/js/jquery/imgViewer.js"></script>
    </head>

    <body onload="tabDefault()">
        <ul id="checktab" class="nav nav-pills">
            <li class="active" data-id="tabContent1"><a href="#" data-toggle="tab">经销商管理</a></li>
        </ul>
        </br>
        <div class="tabs-contents">
            <div id="toolbar" class="btn">
                <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#addOperator">新增</button>
                <button type="button" class="btn btn-default" onclick="deleteSelects()">删除</button>
            </div>
            <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
                <table class="table table-hover" id="allCompanyListTab">
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
                                    <form action="${context }/review/addCompany" method="post">
                                    <table class="child2" >
                                        <tr>
                                            <td><input type="hidden" name="forward" value="addmanager"></td>
                                        </tr>
                                        <tr>
                                            <td >经销商编号:</td>
                                            <td><input name="company_Id" placeholder="输入经销商编号" type="text" class="inputClass" id="company_Id" onBlur="ajaxsubmit()"></td>
                                            <td class="tdError"><label class="errorClass" id="companyIdError">${requestScope.errors.loginname}</label></td>
                                            <td style="margin-left: 10px">经销商名称：</td>
                                            <td ><input name="company_name" placeholder="输入经销商名称" type="text" id="company_name" class="inputClass" onBlur="ajaxemail()"></td>
                                            <td class="tdError"> <label class="errorClassTwo" id="companyNameError" >${requestScope.errors.email}</label></td>
                                        </tr>
                                        <tr>
                                            <td>联系人:</td>
                                            <td><input class="inputClass" placeholder="输入联系人姓名" type="text"
                                                       name="person_name" id="person_name" oncopy="return false" onpaste="return false"></td>
                                            <td class="tdError"><label class="errorClass" id="legalPersonError">${requestScope.errors.password }</label>
                                            <td style="margin-left: 10px">经销商地址:</td>
                                            <td ><input name="company_address" placeholder="输入经销商地址" type="text" class="inputClass" id="company_address" onBlur="ajaxsubmit()"></td>
                                            <td class="tdError"> <label class="errorClassTwo" id="legalPersonIdError" >${requestScope.errors.email}</label></td>
                                        </tr>
                                        <tr>
                                            <td>联系人邮箱:</td>
                                            <td> <input name="person_email" placeholder="输入联系人邮箱" type="text"
                                                        id="person_email" class="inputClass" onBlur="ajaxusername()"></td>
                                            <td class="tdError"> <label class="errorClass" id="companyEmailError" >${requestScope.errors.username}</label>
                                            </td>
                                            <td style="margin-left: 10px">联系人电话:</td>
                                            <td ><input name="person_phone" placeholder="输入联系人电话" type="text" id="person_phone" class="inputClass" onBlur="ajaxusername()"></td>
                                            <td class="tdError"> <label class="errorClassTwo" id="phoneNumberError" >${requestScope.errors.email}</label></td>
                                        </tr>
                                    </table>
                                    </form>
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


    </body>

    <script>
        function allCompanyListTab(){
            $("#allCompanyListTab").bootstrapTable({
                url:'${context}/review/getAllCompanyInfo',
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
                    field:'company_name',
                    title:'经销商简称',
                    sortable: true,
                    order:'asc',
                    valign: 'middle',
                    align: 'center'
                },{
                    field: 'company_Id',
                    title: '经销商编号',
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
</script>
</html>
