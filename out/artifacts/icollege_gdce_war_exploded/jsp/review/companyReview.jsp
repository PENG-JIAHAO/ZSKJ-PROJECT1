<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script type="text/javascript">

    function ComDetails(beforeId,afterId) {
        window.location.href = "${context}/review/ComDetails?beforeId=" + beforeId+"&afterId="+afterId ;
    }

    function tabDefault() {
        $('.tabs-contents').find('#tabContent1').addClass('active').siblings().removeClass('active');
        x(1,1);
    }

    function tabChange(){
        $('.nav-pills li').click(function () {
            var _id=$(this).attr('data-id');
            $('.tabs-contents').find('#'+_id).addClass('active').siblings().removeClass('active');
            switch (_id) {
                case "tabContent1":
                    x(1,1);
                    break;
                case  "tabContent2":
                    x(0,2);
                    break;
                case "tabContent3":
                    x(2,3);
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
<body onload="tabDefault()">

    <ul id="checktab" class="nav nav-pills">
        <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">已通过</a></li>
        <li data-id="tabContent2"><a href="#"  onclick="tabChange()" data-toggle="tab" >待审核</a></li>
        <li data-id="tabContent3"><a href="#" onclick="tabChange()" data-toggle="tab">未通过</a></li>
    </ul>
    <!-- 审核主界面  -->
</br>
    <div class="tabs-contents">
        <div class="tab-content" id="tabContent1">
            <table class="table table-hover" id="companyTab1">
            </table>
        </div>
        <div class="tab-content" id="tabContent2">
            <table class="table table-hover" id="companyTab2">
            </table>
        </div>
        <div class="tab-content" id="tabContent3">
            <table class="table table-hover" id="companyTab3">
            </table>
        </div>
    </div>





</body>
<script>

    function x(reviewState,tabNum){
        $('#companyTab'+tabNum).bootstrapTable({
            url:'${context}/review/getdataCompany?reviewState='+reviewState,
            striped: true,
            sortable: true,
            pagination: true,
            showLoading: true,
            sidePagination: "server",
            sortName: "companyId",
            sortOrder:'asc',
            pageNumber: 1,
            pageSize: 7,
            pageList:[7,14],
            queryParamsType: 'limit',
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
                alert(status);
            },
            onPageChange: function (number, size) {
                $('#companyTab'+tabNum).bootstrapTable('removeAll')//页面改变时清空表数据
            },
            columns:[{
                field:'companyId',
                title:'企业机构代码',
                sortable:true,
                order:'asc',
                valign:'middle',
                align:'center'
            },{
                field: 'companyName',
                title: '企业名称',
                valign: 'middle',
                align: 'center'
            },{
                field: 'legalPerson',
                title: '法人',
                valign: 'middle',
                align: 'center'
            },{
                field: 'phoneNumber',
                title: '联系方式',
                valign: 'middle',
                align: 'center'
            },{
                field: 'openLicenseId',
                title: '营业执照',
                valign: 'middle',
                align: 'center'
            },{
                field: 'taxRegisterId',
                title: '税务登记证',
                valign: 'middle',
                align: 'center'
            },{
                field: 'reviewState',
                title: '审核状态',
                // sortable:true,
                // order:'asc',
                valign: 'middle',
                align: 'center',
                formatter:function (value,row,index) {
                    if (value===1){
                        return '审核通过';
                    }else if (value===0){
                        return '待审核';
                    }else if(value===3){
                        return '已撤销';
                    }else {
                        return '审核不通过';
                    }
                }
            },{
                field: 'operate',
                title: '操作',
                valign: 'middle',
                align: 'center',
                formatter:function (value,row,index) {
                    var beforeId=row.companyId.substring(0,9);
                    var afterId=row.companyId.substring(9,18);
                    return ' <button type="button" class="btn btn-default" onclick="ComDetails('+beforeId+','+afterId+')">详情</button>';
                }
            }]
        });}


</script>
</html>
