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
                allCompanyListTab(0);
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
                <button id="btn_add" type="button" class="btn btn-default">新增</button>
                <button type="button" class="btn btn-default" onclick="deleteSelects()">删除</button>
            </div>
            <div class="tab-content" id="tabContent1" style="margin:-10px 10px 5px">
                <table class="table table-hover" id="allCompanyListTab">
                </table>
            </div>
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
