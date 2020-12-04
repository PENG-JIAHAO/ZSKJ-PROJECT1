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

    function changeAdv(adId, state) {
        window.location.href = "${context}/review/changeAdv?adId=" + adId + "&state=" + state + "&page=${page}";
        alert("审核成功！")
    }

    function changeNew(newsId, state) {
        window.location.href = "${context}/review/changeNew?newsId=" + newsId + "&state=" + state + "&page=${page}";
        alert("操作成功！")
    }
    $.bindViewer(".viewer-item");  //支持绑定到动态生成的元素
</script>
<script src="${context}/js/jquery/jq.js"></script>
<script src="${context}/js/jquery/imgViewer.js"></script>

</head>
<body onload="tabDefault()">

    <ul id="checktab" class="nav nav-pills">
        <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">已通过</a></li>
        <li data-id="tabContent2"><a href="#"  onclick="tabChange()" data-toggle="tab" >待审核</a></li>
        <li data-id="tabContent3"><a href="#" onclick="tabChange()" data-toggle="tab">未通过</a></li>
    </ul>
<!-- 广告位申请 选项卡-->
    </br>
    <div class="tabs-contents">
        <div class="tab-content" id="tabContent1">
            <table class="table table-hover" id="adsTab1">
            </table>
        </div>
        <div class="tab-content" id="tabContent2">
            <table class="table table-hover" id="adsTab2">
            </table>
        </div>
        <div class="tab-content" id="tabContent3">
            <table class="table table-hover" id="adsTab3">
            </table>
        </div>
    </div>



</body>
<script>
    function x(reviewState,tabNum){
        $("#adsTab"+tabNum).bootstrapTable({
        url:'${context}/review/getdataAds?reviewState='+reviewState,
        striped: true,
        sortable: true,
        pagination: true,
        showLoading: true,
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
            field:'companyId',
            title:'申请公司',
            sortable: true,
            order:'asc',
            valign: 'middle',
            align: 'center'
        },{
            field: 'email',
            title: '联系方式(邮箱)',
            valign: 'middle',
            align: 'center'
        },{
            field: 'position',
            title: '广告位',
            valign: 'middle',
            align: 'center'
        },{
            field: 'endDate',
            title: '广告时间',
            valign: 'middle',
            align: 'center'
        },{
            field: 'adsImgPath',
            title: '广告图片',
            valign: 'middle',
            align: 'center',
            formatter:function (value,row,index) {
                var path=row.adsImgPath;
                if (row.adsImgPath==null){
                    path="";
                }
                return '<img class="viewer-item"  style="width: 50px;height: 50px;cursor: pointer;" src="${context}/ads/loadQualificationpicture?path='+path+'"/>'
            }
        },{
            field: 'price',
            title: '广告费用',
            valign: 'middle',
            align:'center'
        },{
            field: 'reviewState',
            title: '审核状态',
            valign: 'middle',
            align: 'center',
            formatter: function (value, row, index) {
                if (row.reviewState===1){
                    return '已通过';
                }else if (row.reviewState===3){
                    return '已撤销';
                }else if (row.reviewState===2){
                    return '未通过'
                }else if (row.reviewState===0){
                    return '待审核'
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
                    return '<button type="button" class="btn btn-default" onclick="b('+id+')">撤销</button>\n'+
                           '<button type="button" class="btn btn-default"><a href="${context}/companyQualificationDown?&path='+path+'">下载</a></button>';
                }else if (row.reviewState===0){
                    return ' <button type="button" class="btn btn-default" onclick="changeAdv('+id+',1)">通过</button>\n' +
                        '<button type="button" class="btn btn-default" onclick="changeAdv('+id+',2)">不通过</button>\n\r'+
                        '<button type="button" class="btn btn-default"><a href="${context}/companyQualificationDown?&path='+path+'">下载</a></button>';
                }else {
                    return '<button type="button" class="btn btn-default"><a href="${context}/companyQualificationDown?&path='+path+'">下载</a></button>';
                }
            }
        }]
    });
    }

    function b(x){
        var r=confirm("是否确认撤销审核通过");
        if (r===true){
            changeAdv(x,3)
        }
    }
</script>
</html>
