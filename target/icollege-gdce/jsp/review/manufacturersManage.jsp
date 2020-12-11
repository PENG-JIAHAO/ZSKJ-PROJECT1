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
                allOperatorListTab(0);
            }

            function deleteSelects()
            {
                var obj=$('#allOperatorListTab');
                var companyId = $.map(obj.bootstrapTable('getSelections'), function (row) {
                    return row.companyId;
                });
                if(companyId.length==0)
                {
                    alert("请选择删除项");
                }else{
                    var r=confirm("是否确认删除？");
                    if(r==true){
                        window.location.href="${context}/review/deleteCompany?companyId="+companyId;
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
            <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">经销商管理</a></li>
        </ul>
        </br>
        <div class="tabs-contents">
        <div id="toolbar" class="btn">
            <button id="btn_add" type="button" class="btn btn-default">新增</button>
            <button type="button" class="btn btn-default" onclick="deleteSelects()">删除</button>
        </div>
        <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
            <table class="table table-hover" id="allOperatorListTab">
            </table>
        </div>

<%--        <div class="modal fade" id="ShowReviewInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
<%--            <div class="modal-dialog" style="width: 700px">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
<%--                            &times;--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >--%>
<%--                        <ul class="nav nav-tabs">--%>
<%--                            <li class="active"><a data-toggle="tab" >--%>
<%--                                <span style="font-size:14px;color:black; font-family:微软雅黑">运营商基本信息</span>--%>
<%--                            </a>--%>
<%--                        </ul>--%>
<%--                        <table  class="table table-hover table-condensed" align="center" style="text-align: center">--%>
<%--                            <tr>--%>
<%--                                <td width="30%" align="right">编号:</td>--%>
<%--                                <td align="left">${clientuser.name}</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--    --%>
<%--                                <td width="30%" align="right">经销商:</td>--%>
<%--                                <td align="left">${company.companyName}</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--    --%>
<%--                                <td width="30%" align="right">联系人:</td>--%>
<%--                                <td align="left">${company.legalPerson}</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--    --%>
<%--                                <td width="30%" align="right">地址:</td>--%>
<%--                                <td align="left" >${company.companyAddress}</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--    --%>
<%--                                <td width="30%" align="right">联系电话:</td>--%>
<%--                                <td align="left">${company.phoneNumber}</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--    --%>
<%--                                <td width="30%" align="right">传真:</td>--%>
<%--                                <td align="left">${company.companyFax}</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--    --%>
<%--                                <td width="30%" align="right">邮箱:</td>--%>
<%--                                <td align="left">${company.companyEmail}</td>--%>
<%--                            </tr>--%>
<%--                        </table>--%>
<%--                        <ul class="nav nav-tabs">--%>
<%--                            <li class="active"><a data-toggle="tab" >--%>
<%--                                <span style="font-size:14px;color:black; font-family :微软雅黑">使用统计</span>--%>
<%--                            </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                        <table width="730px" class="table table-hover table-condensed" align=center style="table-layout: fixed">--%>
<%--                            <tr>--%>
<%--                                <td width="80px" align="right">未结算次数:</td>--%>
<%--                                <td width="100px" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">次</td>--%>
<%--                                <td width="80" align="right">单价:</td>--%>
<%--                                <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">元</td>--%>
<%--                                <td width="80" align="right">金额:</td>--%>
<%--                                <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">元</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td width="80px" align="right">已结算次数:</td>--%>
<%--                                <td width="100px" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">次</td>--%>
<%--                                <td width="80" align="right">单价:</td>--%>
<%--                                <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">元</td>--%>
<%--                                <td width="80" align="right">金额:</td>--%>
<%--                                <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">元</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td width="80px" align="right">累计:</td>--%>
<%--                                <td width="100px" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">次</td>--%>
<%--                                <td width="80" align="right">总额:</td>--%>
<%--                                <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                <td width="10px" align="left">元</td>--%>
<%--                            </tr>--%>
<%--                        </table>--%>
<%--    --%>
<%--                        <ul class="nav nav-tabs">--%>
<%--                            <li class="active"><a data-toggle="tab" >--%>
<%--                                <span style="font-size:14px;color:black; font-family:微软雅黑">自动催缴设置</span>--%>
<%--                            </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                        <from>--%>
<%--                            <table class="table table-hover table-condensed" align="center"--%>
<%--                                   style="text-align: center">--%>
<%--                                <tr>--%>
<%--                                    <td width="80px" align="right">是否自动:</td>--%>
<%--                                    <td width="100px" align="left">${company.legalPerson}</td>--%>
<%--                                    <td width="80" align="right">设置:</td>--%>
<%--                                    <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                    <td width="10px" align="left">次</td>--%>
<%--                                    <td width="80" align="right">金额:</td>--%>
<%--                                    <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                    <td width="10px" align="left">元</td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td width="80px" align="right">是否锁机:</td>--%>
<%--                                    <td width="100px" align="left">${company.legalPerson}</td>--%>
<%--                                    <td width="80" align="right">设置:</td>--%>
<%--                                    <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                    <td width="10px" align="left">次</td>--%>
<%--                                    <td width="80" align="right">金额:</td>--%>
<%--                                    <td width="100" align="left">${company.legalPerson}</td>--%>
<%--                                    <td width="10px" align="left">元</td>--%>
<%--                                </tr>--%>
<%--                            </table>--%>
<%--                        </from>--%>
<%--                    </div><!-- /.modal-body -->--%>
<%--                </div><!-- /.modal-contxent -->--%>
<%--            </div><!-- /.modal-dialog -->--%>
<%--        </div>--%>


    </body>

    <script>
        function allOperatorListTab(reviewState){
            $("#allOperatorListTab").bootstrapTable({
                url:'${context}/review/getAllDataCompany?reviewState='+reviewState,
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
                    field:'companyName',
                    title:'统一简称',
                    sortable: true,
                    order:'asc',
                    valign: 'middle',
                    align: 'center'
                },{
                    field: 'companyId',
                    title: '运营编号',
                    valign: 'middle',
                    align: 'center'
                },{
                    field: 'accountantName',
                    title: '联系人',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'legalPerson',
                    title: '法人',
                    valign: 'middle',
                    align:'center'
                },{
                    field: 'reviewState',
                    title: '在线数量',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.reviewState===1){
                            return '在线';
                        }else if (row.reviewState===3){
                            return '欠费';
                        }else if (row.reviewState===2){
                            return '欠费'
                        }else if (row.reviewState===0){
                            return '离线'
                        }
                    }
                }]
            });
        }
</script>
</html>
