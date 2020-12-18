<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script type="text/javascript">

    <%--设备基础信息--%>
    function ComDetails(beforeId,afterId) {
        window.location.href = "${context}/review/ComDetails?beforeId=" + beforeId+"&afterId="+afterId ;
    }

    <%--页面默认显示表格--%>
    function tabDefault() {
        $('.tabs-contents').find('#tabContent1').addClass('active').siblings().removeClass('active');
        equipmentTable(0);
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

<%--浏览设备--%>
<ul id="checktab" class="nav nav-pills">
    <li class="active" data-id="tabContent1"><a href="#" onclick="tabChange()" data-toggle="tab">设备浏览</a></li>
</ul>

<!-- 设备管理主界面  -->
</br>
<div class="tabs-contents">
    <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
        <table class="table table-hover" id="equipmentTable">
        </table>
    </div>
</div>

<%--详情查看模态框--%>
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
                    <li class="active"><a data-toggle="tab" >
                        <span style="font-size:14px;color:black; font-family:微软雅黑">经销商基本信息</span>
                    </a>
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
                    </tr>
                    <tr>

                        <td width="30%" align="right">传真:</td>
                        <td align="left">${company.companyFax}</td>
                    </tr>
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

    <%--浏览设备表--%>
    function equipmentTable(companyId) {
        $('#equipmentTable').bootstrapTable('destroy');
        $('#equipmentTable').bootstrapTable({
            url:'${context}/review/getAllEquipment',
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
            pageSize: 5,
            pageList:[5,10],
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
                field: 'equipment_id',
                title: '设备编号',
                valign: 'middle',
                align: 'center'
            },{
                field:'company_Id',
                title:'公司编号',
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
                        return ' <button type="button" class="btn btn-default" onclick=ComDetails(912202011,245116621)>设备信息</button>\n' +
                            '<button type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo1" onclick=info(912202011245116621)>操作</button>' +
                            ' <div class="modal fade" id="ShowReviewInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                            '   <div class="modal-dialog">\n' +
                            '       <div class="modal-content">\n' +
                            '           <div class="modal-header">\n' +
                            '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                            '                   &times;\n' +
                            '               </button>\n' +
                            '               <p style="float:left;">设备：</p>\n' +
                            '           </div>\n' +
                            '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                            '               <table class="table table-hover" id="reviewProductTabInfo1">\n' +
                            '               </table>\n' +
                            '           </div>\n' +
                            '       </div><!-- /.modal-contxent -->\n' +
                            '   </div><!-- /.modal-dialog -->\n' +
                            '</div>\n';
                }
            }]
        })

    }

</script>
</html>