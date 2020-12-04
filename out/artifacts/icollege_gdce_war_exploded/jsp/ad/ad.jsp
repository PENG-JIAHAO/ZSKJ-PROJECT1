<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<%@ include file="/jsp/header.jsp"%>
<%@ page import="java.sql.*"
         import="com.isscollege.gdce.domain.Company"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
	$(function () {
		var perm=${permission};

		if(perm==2){
			document.getElementById("productsend").removeAttribute("disabled");
			document.getElementById("productselect").removeAttribute("disabled");
		}

	});

	function judge() {
		var perm =${currentUser.permission};
		if (perm==2) {
			window.location.href = "${context}/jsp/report/reportIndex.jsp";
		} else {
			$('#modal-container-204152').modal();
		}
	}

	function submitcon()
	{

		if(document.getElementById("name").value=="")
		{
			$('#modal-container-204155').modal();
			return false;
		}
		else if(document.getElementById("name").value.length !=18 )
		{
			$('#modal-container-204156').modal();
			return false;
		}
		else if(document.getElementById("releaseDate").value=="")
		{
			$('#modal-container-204157').modal();
			return false;
		}
		else if(document.getElementById("endDate").value=="")
		{
			$('#modal-container-204158').modal();
			return false;
		}
		else if(document.getElementById("email").value=="")
		{
			$('#modal-container-204159').modal();
			return false;
		}
		else if(document.getElementById("exampleInputFile").value=="")
		{
			$('#modal-container-204160').modal();
			return false;
		}
		else if(document.getElementById("price").innerHTML==""){
			$('#modal-container-204161').modal();
			return false;
		}
		if(document.getElementById("name").value!="" && document.getElementById("releaseDate").value!=""&& 
				document.getElementById("endDate").value!="" && document.getElementById("email").value!=""
				&& document.getElementById("exampleInputFile").value!=""&& document.getElementById("price").innerHTML!="")
		{
			document.getElementById("test").setAttribute("type", "submit");
			$('#modal-container-204162').modal();
			return false;
		}
		return true;
	}
function addprice(){
		var startdate=$("#releaseDate").val();
		var starttime=Date.parse(startdate)/1000/3600/24;
	
		var enddate=$("#endDate").val();
		var category=$("#position").val();
		var timenow=Date.parse(new Date( ))/1000/3600/24;

	
	if(startdate!=null && enddate!=null && startdate!=""&enddate!=""){
		var days=daysBetween(startdate,enddate);
		if(days<0){
			$('#modal-container-204163').modal();
			$("#price").val("");
			return false;  
		}
		//alert(starttime+":"+timenow)
    if((starttime+1)<timenow){
    	var datenow=new Date();
    	var year=datenow.getFullYear();
    	var month=datenow.getMonth()+1;
        var day=datenow.getDate();
        var message="开始时间必须晚于"+year+"年"+month+"月"+day+"日";
        $('#modal-container-204164').modal();
    	$("#price").text("");
    	return false;
    }
		if(days<30){
			$('#modal-container-204165').modal();
			$("#price").text("");
			return false ;
		}
		  if(category==1)
		  {
			  var price=days*4000/30;
		var mes="需要交的广告费"+days+"天"+"x"+"4000元/月"+"="+price.toFixed(2)+"元";
		
		$("#price").text(mes);
		$("#sendprice").val(price);
		document.getElementById("price").removeAttribute("hidden");
		return ;
		  }
		  if(category==2|| category==3)
		  {
			  var price=days*2000/30;
			 var mes="需要交的广告费"+days+"天"+"x"+"2000元/月"+"="+price.toFixed(2)+"元";
		
			 $("#price").text(mes);
			  $("#sendprice").val(price);
			 document.getElementById("price").removeAttribute("hidden");
			 return ;
		  }
		  if(category==4)
		  {
			  var price=days*1500/30;
			  var mes="需要交的广告费"+days+"天"+"x"+"1500元/月"+"="+price.toFixed(2)+"元";
			  $("#price").text(mes);
			  $("#sendprice").val(price);
				document.getElementById("price").removeAttribute("hidden");
			  return ;
		  }
		function daysBetween(sDate1,sDate2){
			var time1=Date.parse(new Date(sDate1));
			var time2=Date.parse(new Date(sDate2));
			var dayss=parseInt(time2-time1)/1000/3600/24;
			return dayss;
		}
	}
	
	}

</script>
<script language="javascript" type="text/javascript">
		
      function showdiv() {
          document.getElementById("bg").style.display = "block";
          document.getElementById("show").style.display = "block";
      }


	function hidediv() {
		var chk = document.getElementById('checkbox');
		document.getElementById("bg").style.display = 'none';
		document.getElementById("show").style.display = 'none';
		 chk.checked = true
	}
	
</script>
<script language="javascript">
	function agree() {
		if (document.getElementById('cb').checked)
			document.getElementById('tj').disabled = false;
		else
			document.getElementById('tj').disabled = 'disabled';
	}
</script>
<style type="text/css">
#bg {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.7;
	opacity: .70;
	filter: alpha(opacity = 70);
}

#show {
	display: none;
	position: absolute;
	top: 25%;
	left: 22%;
	width: 53%;
	height: 49%;
	padding: 8px;
	border: 8px solid #E8E9F7;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>
<body>
	<div class="modal fade" id="modal-container-204152" role="dialog"
	 	aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
							data-dismiss="modal">×</button>
					<h4 class="modal-title" id="${myModalLabel}">错误</h4>
				</div>
				<div class="modal-body">您没有访问权限</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204155" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id=${myModalLabel}>错误</h4>
				</div>
				<div class="modal-body">企业机构代码不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204156" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">企业机构代码位数18位</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204157" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">投放日期不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204158" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">结束日期不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204159" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">邮件不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204160" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">广告内容不能为空</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204161" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-boddy">填写的广告信息有误</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204162" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">请检查核对信息!</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204163" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">开始时间必须小于结束时间</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204164" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">开始日期必须在今日之后</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modal-container-204165" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" aria-hidden="true" type="button"
						data-dismiss="modal">×</button>
					<h4 class="modal-title" id="myModalLabel">错误</h4>
				</div>
				<div class="modal-body">最少租用时间为30天</div>
				<div class="modal-footer">
					<button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container text-right" style="margin-bottom: 0">
		<h3 class="text-muted" style="float: left;display: inline-block;" >
			<a href="${context}"><img alt="logo" src="${context}/imgs/logo.png"></a>
		</h3>
		<div>
			<c:set var="username" value="${currentUser.name}"></c:set>
			<c:choose>
				<c:when test="${empty username}">
					<a href="${context}/jsp/login.jsp">登录</a>
				</c:when>
				<c:otherwise>
					<a style="color: #333;">${username}&nbsp;&nbsp;</a>
				</c:otherwise>
			</c:choose>

			<a href="${context}/login/logout">注销</a>
		</div>
	</div>



	<div class="span4" align="center">
		<h2>广告位申请</h2>
		<div class="main-center">
			<form role="form" action="${context}/ads/addAdvertisement" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="exampleInputEmail1">
						<div align="left">
							 <p>
								企业机构代码 <input name="companyId" type="text" class="form-control"
									id="name" value="${currentUser.companyId}" readonly>
							</p>
							
							<p>
								申请位置 <select name="position" id="position" onchange="addprice()">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</p>
						</div>
						<p align="left">
							投放时间 <input type="date" name="releaseDate" id="releaseDate" onchange="addprice()"> 至<input
								type="date" name="endDate" id="endDate" onchange="addprice()">
						</p>
						<p>
					<div id="price" name="price" hidden="hidden" style="color:#ff0000; size:20px" value=" "></div>
						</p>
						<p align="left">
							邮箱 <input name="email" type="email" class="form-control"
								id="email" />
						</p>
						<p align="left">
							广告内容文件 <input name="adsImgPath" type="file" id="exampleInputFile" accept=".jpg,.jpeg,.png"  onchange="changImg(event,'image1')" />
							<img style="display:none"   id="image1"  height="50" width="50" >
						</p>
						<script type="text/javascript">
							function changImg(e,name) {
								for (var i = 0; i < e.target.files.length; i++) {
									var file = e.target.files.item(i);
									if (!(/^image\/.*$/i.test(file.type))) {
										continue; //不是图片 就跳出这一次循环
									}
									//实例化FileReader API
									var freader = new FileReader();
									freader.readAsDataURL(file);
									freader.onload = function (e) {
										console.log(e.target.result);
										$("#"+ name).attr("src", e.target.result);
										$("#"+ name).css({"display":"inline"});
									}
								}
							}</script>
						<p align="left">
							广告链接地址 <input name="adsURL" type="text" class="form-control"
								id="lianjie" />
						</p>
					
						<p align="left">
							我已经仔细 
							<input name="button" type="button" id="btnshow" onclick="showdiv();" value="阅读广告收费规则" />
							<input name="checkbox" type="checkbox" id="checkbox"/>
						</p>
						<p align="left">
							备注<input name="note" type="text" class="form-control"/>
							<input id="sendprice" name="price" hidden="hidden">
						</p>

						<p style="display: flex;justify-content: space-around;">
							<input type="submit" id="submit"  class="btn btn-primary" onclick="return submitcon()"/>
							<button type="button"  class="btn btn-primary" ><a style="color: #FFFFFF;" href="${context}/jsp/ad/management.jsp">返回</a></button>
						</p>
					</label>
				</div>
			</form>
		</div>
	</div>


	<div id="bg"></div>
	<div id="show">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="page-header">
						<h1 align="center">广告投放规则</h1>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>广告位</th>
								<th>价格（月）</th>
								<th>规格说明（px）</th>
								<th>有无空位</th>
							</tr>
						</thead>
						<tbody>

							<tr class="success">
								<td>1</td>
								<td>4000</td>
								<td>600*200</td>
								<td>有</td>
							</tr>
							<tr class="error">
								<td>2</td>
								<td>2000</td>
								<td>600*100</td>
								<td>有</td>
							</tr>
							<tr class="warning">
								<td>3</td>
								<td>2000</td>
								<td>600*100</td>
								<td>有</td>
							</tr>
							<tr class="info">
								<td>4</td>
								<td>1600</td>
								<td>1200*120</td>
								<td>有</td>
							</tr>
						</tbody>
					</table>
					<h3 class="text-muted">
						<img alt="logo" src="${context}/imgs/ad/ad.PNG">
					</h3>

					<p align="left">
						1、以上每个广告位限一个链接地址，1个月(30天)起租。所有广告明码标价，谢绝还价；<br />
						2、刊登广告的网站必须同时被Baidu，Google，Yahoo.cn收录2条以上；<br />
						3、不接受违法、色情、赌博、中奖、彩票及放置木马类站点的广告；不接弹窗、插件类和捆绑类广告；<br />
						4、广告不提供试放，不承诺多少次点击；<br />
						5、所有投放广告，一律先付款后上广告，未到期不能更换广告位，每月可更换文字、图片或链接一次，广告位租出后3天内可以申请退换，扣除总金额20%运营成本费用；<br />
						6、广告文字或图片必须通过我们的审核才可投放（如文件大小以及图片质量），广告图片如为FLASH格式请勿带声音特效、鼠标移过自动弹窗特效和内嵌代码，图片颜色变化频率不能过快，以免影响浏览者视觉；<br />
						7、已经刊登的广告如有虚假，或者有人举报有欺骗等违法行为，广告商没办法做出有效答复或解释的，或者在广告期间网站无法正常访问的，本站保留立即去掉广告的权利并不给予退款；<br />
						8、广告租出期间，广告链接的目标网站不符合2、3款条件的，本站无条件拿下广告；<br />
						9、广告到期时自动删除广告链接，我们不主动追问广告投放者是否续租广告；<br /> 10、如您需要增加其它广告位可联系我们商议。<br />
					</p>

					<div align="center">
						<input id="btnclose" type="button" value="已阅读"
							onclick="hidediv();" />
					</div>
				</div>
				<div class="span4"></div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>