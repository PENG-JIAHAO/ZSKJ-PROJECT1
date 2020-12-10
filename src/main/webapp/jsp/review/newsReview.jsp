<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/jsp/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    .tab-content{
        display: none;
    }
    .tab-content.active{
        display: block;
    }
</style>
<script type="text/javascript">


    function changeNew(productId, state) {
        window.location.href = "${context}/review/changeNew?productId=" + productId + "&state=" + state + "&page=${page}";
        alert("操作成功！")
    }

    function tabDefault() {
        $('.tabs-contents').find('#tabContent1').addClass('active').siblings().removeClass('active');
        x(1,1);
    }

    function newsReviewText(title) {
        window.location.href = "${context}/review/news?title=" + title ;
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
<body onload="tabDefault()">

    <ul id="checktab" class="nav nav-pills">
        <li class="active" data-id="tabContent1"><a href="#"  onclick="tabChange()" data-toggle="tab">已通过</a></li>
        <li data-id="tabContent2"><a href="#"  onclick="tabChange()" data-toggle="tab" >待审核</a></li>
        <li data-id="tabContent3"><a href="#" onclick="tabChange()" data-toggle="tab">未通过</a></li>
    </ul>
    <!-- 资讯信息 选项卡-->
</br>
      <div class="tabs-contents">
        <div class="tab-content" id="tabContent1">
            <table class="table table-hover" id="newsTab1">
            </table>
        </div>
        <div class="tab-content" id="tabContent2">
            <table class="table table-hover" id="newsTab2">
            </table>
        </div>
        <div class="tab-content" id="tabContent3">
            <table class="table table-hover" id="newsTab3">
            </table>
        </div>
    </div>

<script>

    function info1(productId,tabNum) {
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
    function x(reviewState,tableNum) {
        $('#newsTab'+tableNum).bootstrapTable({
            url:'${context}/review/getdataNews?reviewState='+reviewState,
            striped: true,
            sortable: true,
            pagination: true,
            showLoading: true,
            sidePagination: "server",
            sortName: "id",
            sortOrder:'asc',
            pageNumber: 1,
            pageSize: 7,
            pageList: [7,14],
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
                $('#newsTab'+tableNum).bootstrapTable('removeAll')//页面改变时清空表数据
            },columns:[{
                field: 'id',
                title: '序号',
                sortable: true,
                sortOrder: 'asc',
                align: 'center',
                valign:'middle'
            },{
                field: 'name',
                title: '来源',
                align: 'center',
                valign: 'middle'
            },{
                field: 'title',
                title: '标题',
                align: 'center',
                valign: 'middle'
            },{
                field: 'type',
                title: '类型',
                align: 'center',
                valign: 'middle',
                formatter:function (value) {
                    if (value==='hgzc'){
                        return '宏观政策';
                    }else if (value==='scfx'){
                        return '市场分析';
                    }else if(value==='dlhy'){
                        return '电力行业';
                    }else {
                        return '煤炭价格';
                    }
                }
            },{
                field: 'operate',
                title: '内容',
                valign: 'middle',
                align: 'center',
                formatter:function (value,row) {
                    return  '<a href="${context}/review/news?title='+row.title+'">查看</a>';
                }
            },{
                field: 'reviewState',
                title: '操作',
                valign: 'middle',
                align: 'center',
                formatter: function (value,row) {
                    var id= row.id;
                    if (row.reviewState===1){
                        return '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px"  type="button" class="btn btn-default" onclick=c('+id+')>撤销</button>' +
                            '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo1" onclick=info1('+id+',1)>记录</button>' +
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
                    }else if(row.reviewState===0){
                        return '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" class="btn btn-default" onclick="changeNew('+id+',1)">通过</button>' +
                            ' <button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" class="btn btn-default" onclick="changeNew('+id+',2)">不通过</button>\n';
                    }else{
                        return '<button style="padding:0px 3px 0px 3px;height:23px;font-size:15px;line-height:23px" type="button" class="btn btn-default" data-toggle="modal" data-target="#ShowReviewInfo2" onclick=info1('+id+',2)>记录</button>' +
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
        });
    }
    function c(x) {
        var r = confirm("是否确认撤销"+x+"审核通过");
        if (r === true) {
            changeNew(x, 3);
        }
    }

</script>
</body>
</html>