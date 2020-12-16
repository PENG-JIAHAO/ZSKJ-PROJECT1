<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="com.isscollege.gdce.domain.Product"%>
<%@ page import="java.util.List"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <script type="text/javascript">

        function equipmentDetails(beforeId,afterId) {
            window.location.href = "${context}/review/equipmentDetails?beforeId=" + beforeId+"&afterId="+afterId ;
        }

        function tabDefault() {
            $('.tabs-contents').find('#tabContent1').addClass('active').siblings().removeClass('active');
            optTable(1,1);
        }

        function tabChange(){
            $('.nav-pills li').click(function () {
                var _id=$(this).attr('data-id');
                $('.tabs-contents').find('#'+_id).addClass('active').siblings().removeClass('active');
                switch (_id) {
                    case "tabContent1":
                        optTable(1,1);
                        break;
                    case  "tabContent2":
                        optTable(0,2);
                        break;
                    case "tabContent3":
                        optTable(2,3);
                        break;
                }
            });
        }

    </script>
    <style type="text/css">
        .STYLE1 {
            font-size: 18px
        }

        .STYLE3 {
            font-size: 24px
        }

        .STYLE5 {
            font-size: large;
            font-weight: bold;
        }

        .STYLE6 {
            font-weight: bold
        }
        .tab-content{
            display: none;
        }
        .tab-content.active{
            display: block;
        }
    </style>

    <body onload="tabDefault()" onunload="window.opener.location.reload()">
    <%--<c:set var="company" target="${Company }" value="${company}"></c:set>--%>
    <%--<c:set var="clientuser" target="${User }" value="${requestScope.user}"></c:set>--%>
        <%--分组按钮--%>
        <ul id="checktab" class="nav nav-pills">
            <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">设备使用商分组1</a></li>
            <li data-id="tabContent2"><a href="#"  onclick="tabChange()" data-toggle="tab" >设备使用商分组2</a></li>
            <li data-id="tabContent3"><a href="#" onclick="tabChange()" data-toggle="tab">设备使用商分组3</a></li>
        </ul>

        </br>

        <!--主界面(3个表格)-->
        <div class="tabs-contents">
            <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
                <table class="table table-hover" id="mftTab1"></table>
            </div>
            <div class="tab-content" id="tabContent2">
                <table class="table table-hover" id="mftTab2"></table>
            </div>
            <div class="tab-content" id="tabContent3">
                <table class="table table-hover" id="mftTab3"></table>
            </div>
        </div>

        <%--信息查看按钮模态框--%>
        <div class="modal fade" id="operatorInfoTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 700px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                    </div>

                    <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab">
                                <span style="font-size:14px;color:black; font-family:微软雅黑">设备使用商基本信息 </span>
                            </a>
                            </li>
                        </ul>
                        <table  class="table table-hover table-condensed" align="center" style="text-align: center">
                            <tr>
                                <td width="30%" align="right">编号:</td>
                                <td align="left">${clientuser.name}</td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">经销商:</td>
                                <td align="left">${company.companyName}</td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">联系人:</td>
                                <td align="left">${company.legalPerson}</td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">地址:</td>
                                <td align="left" >${company.companyAddress}</td>
                            </tr>
                            <tr>
                                <td width="30%" align="right">联系电话:</td>
                                <td align="left">${company.phoneNumber}</td>
                            </tr>>
                            <tr>
                                <td width="30%" align="right">邮箱:</td>
                                <td align="left">${company.companyEmail}</td>
                            </tr>
                        </table>

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" >
                                <span style="font-size:14px;color:black; font-family :微软雅黑">使用统计</span>
                            </a>
                            </li>
                        </ul>
                        <table width="730px" class="table table-hover table-condensed" align=center style="table-layout: fixed">
                            <tr>
                                <td width="80px" align="right">未结算次数:</td>
                                <td width="100px" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">次</td>
                                <td width="80" align="right">单价:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                                <td width="80" align="right">金额:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                            </tr>
                            <tr>
                                <td width="80px" align="right">已结算次数:</td>
                                <td width="100px" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">次</td>
                                <td width="80" align="right">单价:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                                <td width="80" align="right">金额:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                            </tr>
                            <tr>
                                <td width="80px" align="right">累计:</td>
                                <td width="100px" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">次</td>
                                <td width="80" align="right">总额:</td>
                                <td width="100" align="left">${company.legalPerson}</td>
                                <td width="10px" align="left">元</td>
                            </tr>
                        </table>

                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" >
                                <span style="font-size:14px;color:black; font-family:微软雅黑">自动催缴设置</span>
                            </a>
                            </li>
                        </ul>
                        <from>
                            <table class="table table-hover table-condensed" align="center"
                                   style="text-align: center">
                                <tr>
                                    <td width="80px" align="right">是否自动:</td>
                                    <td width="100px" align="left">${company.legalPerson}</td>
                                    <td width="80" align="right">设置:</td>
                                    <td width="100" align="left">${company.legalPerson}</td>
                                    <td width="10px" align="left">次</td>
                                    <td width="80" align="right">金额:</td>
                                    <td width="100" align="left">${company.legalPerson}</td>
                                    <td width="10px" align="left">元</td>
                                </tr>
                                <tr>
                                    <td width="80px" align="right">是否锁机:</td>
                                    <td width="100px" align="left">${company.legalPerson}</td>
                                    <td width="80" align="right">设置:</td>
                                    <td width="100" align="left">${company.legalPerson}</td>
                                    <td width="10px" align="left">次</td>
                                    <td width="80" align="right">金额:</td>
                                    <td width="100" align="left">${company.legalPerson}</td>
                                    <td width="10px" align="left">元</td>
                                </tr>
                            </table>
                        </from>
                    </div><!-- /.modal-body -->
                </div><!-- /.modal-contxent -->
            </div><!-- /.modal-dialog -->
        </div>

</body>

    <script>

        <%--点击设备按钮--%>
        function getEquipment(reviewState,tabNum) {
            $('#equipmentListTab'+tabNum).bootstrapTable('destroy');
            $('#equipmentListTab'+tabNum).bootstrapTable({
                url:'${context}/review/getDataCompany?reviewState='+reviewState,
                striped: true,
                sortable: true,
                pagination: true,
                showLoading: true,
                search:true,
                searchOnEnterKey:false,
                strictSearch:true,
                sidePagination: "server",
                sortName: "id",
                sortOrder: "desc",
                pageNumber: 1,
                pageSize: 7,
                pageList:[7,14],
                queryParamsType: 'limit',
                queryParams: function (params) {
                    return params;
                },
                onSort: function (name, order) {

                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (status) {

                },
                columns: [{
                    field: 'companyId',
                    title: '设备编号',
                    valign: 'middle',
                    align: 'center'
                },{
                    field:'reviewState',
                    title:'状态',
                    sortable: true,
                    order:'asc',
                    valign: 'middle',
                    align: 'center'
                },{
                    field: 'operate',
                    title: '操作',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var id = row.id;
                        var path = row.adsImgPath;
                        if (row.reviewState === 1) {
                            return ' <button type="button" class="btn btn-default" onclick=equipmentDetails(912202011,245116621)>设备信息</button>\n' +
                                '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo1" onclick=info(912202011245116621)>操作</button>' +
                                ' <div class="modal fade" id="ShowReviewInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">店铺设备：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="reviewProductTabInfo1">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-contxent -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }
                    }
                }]
            })

        }

        <%--主页面--%>
        function optTable(reviewState,tabNum){
            $("#mftTab"+tabNum).bootstrapTable({
                url:'${context}/review/getDataCompany?reviewState='+reviewState,
                striped: true,
                sortable: true,
                pagination: true,
                showLoading: true,
                search:true,
                searchOnEnterKey:false,
                strictSearch:false,
                showRefresh:true,
                detailView: true,  //是否显示父子表
                sidePagination:'server',
                sortName:'id',
                sortOrder:'asc',
                pageNumber:1,
                pageSize:5,
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
                onPageChange: function (number, size) {
                    $('#adsTab'+tabNum).bootstrapTable('removeAll')//页面改变时清空表数据
                },
                columns:[{
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
                    field: 'phoneNumber',
                    title: '电话',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'legalPerson',
                    title: '联系人',
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
                },{
                    field: 'operate',
                    title: '操作',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index){
                        var id=row.id;
                        var path=row.adsImgPath;
                        if (row.reviewState===1){
                            return' <button type="button" class="btn btn-default" data-toggle="modal" data-target="#operatorInfoTable">信息</button>\n'+
                                '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowInfo1" onclick=getEquipment(1,1)>设备</button>' +
                                ' <div class="modal fade" id="ShowInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">设备使用商设备：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="equipmentListTab1">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-contxent -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }
                        else if (row.reviewState===0){
                            return' <button type="button" class="btn btn-default" data-toggle="modal" data-target="#operatorInfoTable">信息</button>\n'+
                                '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo2" onclick=getEquipment(1,2)>设备</button>' +
                                ' <div class="modal fade" id="ShowReviewInfo2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">设备使用商设备：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="equipmentListTab2">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-contxent -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }
                        else{
                            return' <button type="button" class="btn btn-default" data-toggle="modal" data-target="#operatorInfoTable">信息</button>\n'+
                                '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo3" onclick=getEquipment(1,3)>设备</button>' +
                                ' <div class="modal fade" id="ShowReviewInfo3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">设备使用商设备：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="equipmentListTab3">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-contxent -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }
                    }
                }],
                onExpandRow: function (index, row, $detail) {
                    ExpandRow(index, row, $detail);
                }
            });
        }
        //父子表(子表)
        function ExpandRow(index, row, $detail) {
            var id = row.id;
            var childname = "plan_" + id;
            var equipmentListTab = $detail.html('<table id="' + childname + '"></table>').find('table');
            $(equipmentListTab).bootstrapTable('destroy');
            $(equipmentListTab).bootstrapTable({
                url:'${context}/review/getDataCompany?reviewState='+1,
                striped: true,
                sortable: true,
                pagination: true,
                showLoading: true,
                sidePagination: "server",
                sortName: "id",
                sortOrder: "desc",
                pageNumber: 1,
                pageSize: 7,
                pageList:[7,14],
                queryParamsType: 'limit',
                queryParams: function (params) {
                    return params;
                },
                onSort: function (name, order) {

                },
                onLoadSuccess: function (data) {

                },
                onLoadError: function (status) {

                },
                columns: [{
                    field: 'companyId',
                    title: '设备编号',
                    valign: 'middle',
                    align: 'center'
                },{
                    field:'reviewState',
                    title:'状态',
                    sortable: true,
                    order:'asc',
                    valign: 'middle',
                    align: 'center'
                },{
                    field: 'operate',
                    title: '操作',
                    valign: 'middle',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var id = row.id;
                        var path = row.adsImgPath;
                        if (row.reviewState === 1) {
                            return ' <button type="button" class="btn btn-default" onclick=equipmentDetails(912202011,245116621)>设备信息</button>\n' +
                                '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo1" onclick=info(912202011245116621)>操作</button>' +
                                ' <div class="modal fade" id="ShowReviewInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">店铺设备：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="reviewProductTabInfo1">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-contxent -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }
                    }
                }]
            })

        }
    </script>
</html>