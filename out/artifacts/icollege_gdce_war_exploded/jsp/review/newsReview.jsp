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


    function changeNew(newsId, state) {
        window.location.href = "${context}/review/changeNew?newsId=" + newsId + "&state=" + state + "&page=${page}";
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
                formatter:function (value,row,index) {
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
                formatter:function (value,row,index) {
                    return  '<a href="${context}/review/news?title='+row.title+'">查看</a>';
                }
            },{
                field: 'reviewState',
                title: '审核状态',
                valign: 'middle',
                align: 'center',
                formatter: function (value,row,index) {
                    if (value===1){
                        return '<button type="button" class="btn btn-default" onclick="c('+value+')">撤销通过</button>\n';
                    }else if (value===0){
                        return ' <div style=" text-align: center">\n' +
                            '                                                <table>\n' +
                            '                                                    <th>\n' +
                            '                                                        <button style="width:68px; text-align: center;font-weight:normal;" type="button" class="btn btn-default" onclick="changeNew('+row.id+',1)">通过</button>\n' +
                            '                                                    </th>\n' +
                            '                                                    <th>\n' +
                            '                                                        <button style="width:68px;text-align: center;font-weight:normal;"\n' +
                            '                                                                type="button"\n' +
                            '                                                                class="btn btn-default"\n' +
                            '                                                                onclick="changeNew('+row.id+',2)">不通过\n' +
                            '                                                        </button>\n' +
                            '                                                    </th>\n' +
                            '                                                </table>\n' +
                            '                                            </div>';
                    }else if (value===2){
                        return '审核未通过';
                    }else {
                        return '已撤销';
                    }
                }
            }]
        });
    }
    function c(x) {
        var r = confirm("是否确认撤销审核通过");
        if (r === true) {
            changeNew(x, 3);
        }
    }
</script>
</body>
</html>