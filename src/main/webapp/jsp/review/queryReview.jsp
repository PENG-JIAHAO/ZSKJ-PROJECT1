<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="com.isscollege.gdce.domain.Product"%>
<%@ page import="java.util.List"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    case "tabContent2":
                        x(0,2);
                        break;
                    case "tabContent3":
                        x(2,3);
                        break;
                    default :
                            x(1,1);
                            break;
                }
            });
        }

    function changePro(productId,prostate,state) {
        window.location.href = "${context}/review/changePro?productId=" + productId +"&prostate=" + prostate + "&state=" + state + "&page=${page}";
    }

    function a(x){
        var r=confirm("是否确认撤销审核通过");
        if (r==true){
            changePro(x,1,3)
        }
    }

    function alertShow(id) {
        window.productId=id;
        document.getElementById("productIdShow").value = window.productId;
        var id = "OffProductInfo";
        // 获取输入框的值 对button显示做优化
        var value = $("#" + id).val();//获取输入框内容
        let btnIdDisabledValue = document.getElementById("offShellUpdateBtn");
        if(value.length==0){
            btnIdDisabledValue.disabled = true;
        }else if (value.length<20){
            btnIdDisabledValue.disabled = true;
        }else {
            btnIdDisabledValue.disabled = false;
        }
    }

    function validateOffProductInfo() {
        var id = "OffProductInfo";
        var value = $("#" + id).val();//获取输入框内容

        let btnIdDisabledValue = document.getElementById("offShellUpdateBtn");
        /*
         * 1. 非空校验
         */
        if(value.length==0)
        {
            /*
             * 获取对应的label
             * 添加错误信息
             * 显示label
             */
            $("#" + id + "Error").css("display","block");
            $("#" + id + "Error").css("color","red");
            $("#" + id + "Error").text("文本不能为空！");
            showError($("#" + id + "Error"));
            btnIdDisabledValue.disabled = true;
        }else if (value.length<20){
            $("#" + id + "Error").css("display","block");
            $("#" + id + "Error").css("color","red");
            $("#" + id + "Error").text("下架原因字数必须大于20！");
            showError($("#" + id + "Errors"));
            btnIdDisabledValue.disabled = true;
        }else {
            $("#" + id + "Error").css("display","none");
            btnIdDisabledValue.disabled = false;
        }

    }

        function info(productId,tabNum) {
            $('#reviewProductTabInfo'+tabNum).bootstrapTable('destroy');
            $('#reviewProductTabInfo'+tabNum).bootstrapTable({
                url: '${context}/review/getdatarecord?productId='+productId,
                striped: true,
                sortable: true,
                pagination: true,
                showLoading: true,
                sidePagination: "server",
                sortName: "RecordId",
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
                    field:'recordID',
                    title:'记录编号',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'userName',
                    title:'操作账户',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'operateType',
                    title:'操作类型',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'createDate',
                    title:'时间',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field:'comment',
                    title:'意见',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },]
            })

        }
    </script>

</head>
<body onload="tabDefault()" onunload="window.opener.location.reload()">

    <ul id="checktab" class="nav nav-pills">
        <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">已通过</a></li>
        <li data-id="tabContent2"><a href="#"  onclick="tabChange()" data-toggle="tab" >待审核</a></li>
        <li data-id="tabContent3"><a href="#" onclick="tabChange()" data-toggle="tab">未通过</a></li>
    </ul>

</br>

    <div class="tabs-contents">
        <div class="tab-content" id="tabContent1">
            <table class="table table-hover" id="productTab1">
            </table>
        </div>
        <div class="tab-content" id="tabContent2">
            <table class="table table-hover" id="productTab2">
            </table>
        </div>
        <div class="tab-content" id="tabContent3">
            <table class="table table-hover" id="productTab3">
            </table>
        </div>
    </div>





</body>
<script>

        function x(reviewState,tabNum){
            $("#productTab"+tabNum).bootstrapTable({
                url: '${context}/review/getdataproducts?reviewState='+reviewState,
                striped: true,
                sortable: true,
                pagination: true,
                showLoading: true,
                sidePagination: "server",
                sortName: "quantity",
                sortOrder: "desc",
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

                },
                onPageChange: function (number, size) {
                    $('#productTab'+tabNum).bootstrapTable('removeAll')//页面改变时清空表数据
                },
                columns: [{
                    field:'id',
                    title:'商品号',
                    sortable:true,
                    order:'asc',
                    valign:'middle',
                    align:'center'
                },{
                    field: 'quantity',
                    title: '数量</br>(万吨)',
                    sortable: true,
                    order: 'desc',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'lowPower',
                    title: '热值</br>(KCal/Kg)',
                    valign: 'middle',
                    align: 'center'

                }, {
                    field: 'fullSulfur',
                    title: '全硫(%)',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'volatiles',
                    title: '挥发份(%)',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'fullMoisture',
                    title: '发站',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'dryPowder',
                    title: '空干基灰分',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'fullMoisture',
                    title: '全水分(%)',
                    valign: 'middle',
                    align: 'center'
                }, {
                    field: 'userName',
                    title: '用户名称',
                    valign: 'middle',
                    align: 'center'
                },{
                    field: 'operate',
                    title: '判定操作',
                    align: 'center',
                    valign: 'middle',
                    formatter:function (value,row,index) {
                        var id= row.id;
                        var productId=row.productId;
                        if (row.productState===1){
                            return '已下架';
                        }else {
                            return '<button  type="button" class="btn btn-default" data-toggle="modal" data-target="#OffSureModal" onclick="alertShow('+id+')">下架'+id+'</button>\n'+
                                    ' <div class="modal fade" id="OffSureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                            '            <div class="modal-dialog">\n' +
                            '                <div class="modal-content">\n' +
                            '                    <div class="modal-header">\n' +
                            '                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                            '                            &times;\n' +
                            '                        </button>\n' +
                            '                    </div>\n' +
                        '                        <form action="${context}/review/updateProductState" method="post" >\n' +
                                '                    <div class="modal-body" style="margin-bottom:20px;">\n' +
                                '                        <p style="float:left;">确认是否下架？</p>\n' +
                            '                            <div class="offShellReasonPart">\n' +
                            '                               <input type="hidden" name="id"  id="productIdShow" value="">'+
                            '                                <textarea type="text" name="OffProductInfo" id="OffProductInfo"  onchange="validateOffProductInfo()" placeholder=\'请输入下架原因\' style="width:100% ;height: 100%;resize:none;" ></textarea>\n' +
                            '                                <p id="OffProductInfoError" style="float:left;margin:5px 5px 0;"></p>\n' +
                            '                            </div>\n' +
                                '                    </div>\n' +
                                '                    <div class="modal-footer">\n' +
                            '                               <button  class="btn btn-primary" type="submit"  id="offShellUpdateBtn"  disabled="true" onclick = changePro(productId,1,4) >\n' +
                            '                                    确定'+id+'\n' +
                            '                                </button>\n' +
                                '                        <button type="button" class="btn btn-default" data-dismiss="modal" >\n' +
                                '                            取消\n' +
                                '                        </button>\n' +
                                '                    </div>\n' +
                        '                        </form>\n' +
                            '                </div><!-- /.modal-content -->\n' +
                            '            </div><!-- /.modal -->\n' +
                            '        </div>\n'
                        }
                       }
                },{
                    field:'operate',
                    title:'操作',
                    align:'center',
                    valign:'middle',
                    formatter:function(value,row,index){
                        var id=row.productId;
                        var state=row.reviewState;
                        if (state===1){
                            return '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px"  type="button" class="btn btn-default" onclick=a('+id+')>撤销</button>' +
                                '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo1" onclick=info('+id+',1)>记录</button>' +
                                ' <div class="modal fade" id="ShowReviewInfo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">记录信息如下：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="reviewProductTabInfo1">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-contxent -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }else if(state===0){
                            return '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" class="btn btn-default" onclick="changePro('+id+',0,1)">通过</button>' +
                                ' <button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" class="btn btn-default" onclick="changePro('+id+',1,2)">不通过</button>\n';
                        }else{
                            return '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo2" onclick=info('+id+',2)>记录</button>' +
                                ' <div class="modal fade" id="ShowReviewInfo2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\n' +
                                '   <div class="modal-dialog">\n' +
                                '       <div class="modal-content">\n' +
                                '           <div class="modal-header">\n' +
                                '               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">\n' +
                                '                   &times;\n' +
                                '               </button>\n' +
                                '               <p style="float:left;">记录信息如下：</p>\n' +
                                '           </div>\n' +
                                '           <div class="modal-body" style="margin-bottom:20px;" id="reviewTabContent" >\n' +
                                '               <table class="table table-hover" id="reviewProductTabInfo2">\n' +
                                '               </table>\n' +
                                '           </div>\n' +
                                '       </div><!-- /.modal-content -->\n' +
                                '   </div><!-- /.modal-dialog -->\n' +
                                '</div>\n';
                        }
                    }
                }]
            })
        }


</script>
</html>
