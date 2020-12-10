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
                allEquipmentListTab(0);
            }

            function OperatorInfo(beforeId,afterId) {
                window.location.href = "${context}/review/OperatorInfo?beforeId=" + beforeId+"&afterId="+afterId ;
            }

            $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素

            function deleteSelects()
            {
                var r=confirm("是否确认删除");
                if (r===true){
                    var obj=$('#allEquipmentListTab');
                    var ids = $.map(obj.bootstrapTable('getSelections'), function (row) {
                        return row.companyId;
                    });
                    obj.bootstrapTable('remove', {field: 'companyId',values: ids });
                    //删除功能待完成
                    href="${context}/review/deleteSelect?companyId+"+ids;
                    var a=confirm("删除成功");
                }

            }
        </script>
        <script src="${context}/js/jquery/jq.js"></script>
        <script src="${context}/js/jquery/imgViewer.js"></script>

    </head>

    <body onload="tabDefault()">
        <ul id="checktab" class="nav nav-pills">
            <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">设备商管理</a></li>
        </ul>

        </br>

        <div class="tabs-contents">
            <div id="toolbar" class="btn">
                <button id="btn_add" type="button" class="btn btn-default">新增</button>
                <button type="button" class="btn btn-default" onclick="deleteSelects()">删除</button>
            </div>
            <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
                <table class="table table-hover" id="allEquipmentListTab">
                </table>
            </div>
        </div>
    </body>

    <script>
    function allEquipmentListTab(reviewState){
        $("#allEquipmentListTab").bootstrapTable({
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
            }]
        });
    }

</script>
</html>
