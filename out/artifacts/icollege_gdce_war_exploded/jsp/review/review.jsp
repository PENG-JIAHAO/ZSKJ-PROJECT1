<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	window.location.href = "${context}/review/changeCom?companyId=" + companyId + "&state=" + state + "&page=${page}";
	function changepro(productId,prostate,state) {

		window.location.href = "${context}/review/changePro?productId=" + productId +"&prostate=" + prostate + "&state=" + state + "&page=${page}";
	}
	function comdetails(companyId) {
		window.location.href = "${context}/review/ComDetails?companyId=" + companyId + "&page=${page}";
	}
	function changeadv(adId, state) {
		window.location.href = "${context}/review/changeAdv?adId=" + adId + "&state=" + state + "&page=${page}";
		alert("审核成功！")
	}
	function changenew(newsId, state) {
		window.location.href = "${context}/review/changeNew?newsId=" + newsId + "&state=" + state + "&page=${page}";
		alert("操作成功！")
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

#alertBox{
	display: none;
	position: absolute;
	top: 30%;
	width: 100%;
	height: 400px;
	z-index: 99;
}
.boxContent{
	margin: 0 auto;
	padding: 50px 40px 50px;
	width: 400px;
	height:240px;
	border: 1px solid #333333;
	border-radius: 5px;
	background-color: #FFFFFF ;
}
.boxContent input{
.
width: 320px;
	height: 32px;
	line-height: 32px;
	color: #999999;
	font-size: 18px;
	outline: none;
	margin: 0 auto;
}

.boxBtn{
	width:  100%;
	height: 40px;
	margin: 20px auto 0;
	display: flex;
	justify-content: space-between;
}
.boxBtn a{
	margin: 0 auto;
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	font-size: 16px;
	color: #FFFFFF;
	background-color: #0f74a8;
	list-style: none;
	border-radius: 4px;
	text-align: center;
}

</style>

<body>

	<c:set var="user" value="${sessionScope.currentUser}"></c:set>
	<c:set var="per" value="${user.getPermission()}"></c:set>
	<c:if test="${empty user || user.getLevel() == 2 || user.getLevel() == 3 || user.getLevel() == 4}">
		<c:redirect url="${context}"></c:redirect>
	</c:if>


	<br>
	<!-- <div align="center" class="locationD">
		<h2>审核中心</h2>
	</div> -->
	<br>
	<div class="container">
		<div class="row clearfix" >
			<div class="col-md-12 column" align="center">
				<div class="row clearfix">
						<div class="container">
							<div class="row clearfix">
								<div class="col-md-12 column" align="center" >
									<ul id="checktab" class="nav nav-pills">
										<li class="active"><a href="#passed" data-toggle="tab">已通过</a></li>
										<li><a href="#await" data-toggle="tab">待审核</a></li>
										<li><a href="#reject" data-toggle="tab">未通过</a></li>
									</ul>
									<br/>
									<div id="mychecktab" class="tab-content" align="center" >
										<div class="tab-pane fade in active" id="passed">
											<div class="container">
												<div class="row clearfix">
													<div class="col-md-12 cloumn">
														<div class="table-responsive">
															<c:if test="${per.indexOf('6')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr>
																		<th><span class="STYLE10">企业机构代码</span></th>
																		<th><span class="STYLE10">企业名称</span></th>
																		<th><span class="STYLE10">法人</span></th>
																		<th><span class="STYLE10">联系方式</span></th>
																		<th><span class="STYLE10">银行账户</span></th>
																		<th><span class="STYLE10">营业执照</span></th>
																		<th><span class="STYLE10">税务登记号</span></th>
																		<th><span class="STYLE10">操作</span></th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allCompanyList }">
																		<c:set var="des" value="companyReview"></c:set>
																		<c:set var="i" value="${allCompanyList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach items="${allCompanyList}" var="company"  varStatus="count">
																			<c:if test="${count.current.reviewState==1}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class ="${style}">
																					<td>${company.companyId}</td>
																					<td>${company.companyName}</td>
																					<td>${company.legalPerson }</td>
																					<td>${company.phoneNumber }</td>
																					<td>${company.bankAccount }</td>
																					<td>${company.openLicenseId}</td>
																					<td>${company.taxRegisterId }</td>
																					<td bordercolor="#CCCCCC">
																						<div>
																							<div align="center">
																								<button type="button" class="btn btn-default"
																										onclick="comdetails('${company.companyId }')">详情</button>
																							</div>
																						</div>
																					</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
															<c:if test="${per.indexOf('5')!=-1}">
																<table class="table table-hover" >
																	<thead >
																	<tr style="font-weight:bolder;">
																		<th ><span  class="STYLE10" >用户名称</span></th>
																		<th ><span class="STYLE10">标题</span></th>
																		<th ><span class="STYLE10" >类型</span></th>
																		<th ><span class="STYLE10" >内容</span></th>
																		<th ><span class="STYLE10" >操作</span></th>
																	</tr>
																	</thead>
																	<tbody >
																	<c:if test="${not empty allNewsList}">
																		<c:set var="des" value="newsReview"></c:set>
																		<c:set var="i" value="${allNewsList.size()}"></c:set>
																		<c:set var="j" value="1"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:set var="number" value="1"> </c:set>
																		<c:set var="hgzc" value="hgzc"> </c:set>
																		<c:set var="scfx" value="scfx"> </c:set>
																		<c:set var="dlhy" value="dlhy"> </c:set>
																		<c:set var="mtjg" value="mtjg"> </c:set>
																		<c:forEach var="news" items="${allNewsList}" varStatus="count">
																			<c:if test="${count.current.reviewState==1}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<c:if test="${news.type.equals(hgzc)}">
																					<c:set var="Type" value="宏观政策"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(scfx)}">
																					<c:set var="Type" value="市场分析"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(dlhy)}">
																					<c:set var="Type" value="电力分析"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(mtjg)}">
																					<c:set var="Type" value="煤炭价格"> </c:set>
																				</c:if>
																				<c:set var="j" value="${j+1}"></c:set>
																				<script type="text/javascript">
																					$(function () {
																						var j =${j};
																						$("#textarea" + j).html($("#content" + j).text());

																					});
																				</script>
																				<tr class ="${style}" style="width:10%;margin: 0 auto;">
																					<td  style="vertical-align: middle;width:90px" class="STYLE10">${news.getName()}</td>
																					<td  style="vertical-align: middle;width:100px" class="STYLE10">${news.getTitle()}</td>
																					<td  style="vertical-align: middle;" class="STYLE10">${Type}</td>
																					<div id="content${j}" hidden="hidden"> ${news.content}</div>
																					<td style="vertical-align: middle;width:auto" class="cursor:pointer"><a
																							class="alt"><span><textarea
																							style=" width:450px;height:300px;;border: none;"
																							name="text" id="textarea${j}"
																							readonly="readonly"></textarea></span>查看</a>
																					</td>
																					<c:set var="number" value="${number+1}"> </c:set>
																					<td style="vertical-align: middle;padding-right: 1px;width:100px;"
																						bordercolor="#CCCCCC">
																						<div>
																							<div align="center">
																										<button type="button" class="btn btn-default"
																												onclick="c(${news.id})">撤销通过
																										</button>
																								<script>
																									function c(x) {
																										var r = confirm("是否确认撤销审核通过");
																										if (r == true) {
																											changenew(x, 3);
																										}
																									}
																								</script>
																							</div>
																						</div>
																					</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
															<c:if test="${per.indexOf('7')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr class="STYLE10">
																		<th width="47">商品编号</th>
																		<th width="70">数量（万吨）</th>
																		<th width="70">价格（元/吨）</th>
																		<th width="54">全硫份（%）</th>
																		<th width="48">产地</th>
																		<th width="40">运费单价（元/吨）</th>
																		<th width="51">全水分（%）</th>
																		<th width="47">用户名称</th>
																		<th width="47">操作</th>

																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allProductInfoList}">
																		<c:set var="des" value="queryReview"></c:set>
																		<c:set var="i" value="${allProductInfoList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="product" items="${allProductInfoList}" varStatus="count">
																			<c:if test="${count.current.reviewState==1&& count.cuurent.productState==0}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class="${style}">
																					<td class="STYLE10">${product.productId }</td>
																					<td class="STYLE10">${product.quantity }</td>
																					<td class="STYLE10">${product.price }</td>
																					<td class="STYLE10">${product.fullSulfur }</td>
																					<td class="STYLE10">${product.srcAddress }</td>
																					<td class="STYLE10">${product.carriage }</td>
																					<td class="STYLE10">${product.dryPowder }</td>
																					<td class="STYLE10">${product.userName }</td>
																					<td bordercolor="#CCCCCC">
																						<div>
																							<div align="center">
																										<button   type="button" class="btn btn-default"
																												  onclick=a(${product.productId})>撤销通过</button>
																								<button   type="button" class="btn btn-default"
																										  onclick=warning(${product.productId})>下架</button>
																								<script>
																									function a(x){
																										var r=confirm("是否确认撤销审核通过");
																										if (r==true){
																											changepro(x,1,3)
																										}
																									}
																									function warning(x) {
																										var r=confirm("是否确认下架");
																										if(r==true){
																											alertShow()
																										}

																									}

																									function validateOffProductInfo() {
																										var id = "OffProductInfo";
																										var value = $("#" + id).val();//获取输入框内容
																										console.log(value)
																										/*
                                                                                                         * 1. 非空校验
                                                                                                         */
																										if(!value)
																										{
																											/*
                                                                                                             * 获取对应的label
                                                                                                             * 添加错误信息
                                                                                                             * 显示label
                                                                                                             */
																											alert("文本不能为空")

																											return false;
																										} else if (value.length<20){
																											alert("下架原因不能低于20个字！")

																											return false;
																										}else{
																											return  true;
																										}
																									}
																									function  alertShow(){
																										document.getElementById("alertBox").style.display = 'block';
																										var alertValue = document.getElementById("alertSumbit").val();
																										if(alertValue==null){

																											document
																													.write("<button type='button' class='btn btn-primary' disabled='disabled'>确定</button>");
																										}
																									}
																									function  alertNone(){
																										document.getElementById("alertBox").style.display = 'none';
																									}
																								</script>
																							</div>

																							<div id="alertBox" >
																								<div class="boxContent">
																									<form action="${context}/review/updateProductState?id=${product.id}" method="post" onSubmit="return validateOffProductInfo()">
																										<input type="text" name=" OffProductInfo" id="OffProductInfo" placeholder='请输入下架原因'/><br/>
																										<div class="boxBtn">
																											<button type="submit" id="alertSumbit" style="margin: 0 auto; display: inline-block;   width: 50px; height: 30px; line-height: 30px; font-size: 16px; color: #FFFFFF;  background-color: #0f74a8; list-style: none;border-radius: 4px;   text-align: center;" >确定</button>
																											<a onclick="alertNone()">取消</a>
																										</div>
																									</form>
																								</div>
																							</div>

																						</div>

																					</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>

																</table>
															</c:if>
															<c:if test="${per.indexOf('8')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr>
																		<th class="STYLE10">申请公司</th>
																		<th class="STYLE10">联系方式（邮箱）</th>
																		<th class="STYLE10">广告位</th>
																		<th class="STYLE10">广告时间</th>
																		<th class="STYLE10">广告图片</th>
																		<th class="STYLE10">广告费用</th>
																		<th class="STYLE10">操作</th>

																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allAdsList}">
																		<c:set var="des" value="advertisementReview"></c:set>
																		<c:set var="i" value="${allAdsList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="advertisement" items="${allAdsList}" varStatus="count">
																			<c:if test="${count.current.reviewState==1}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class ="${style}">
																					<td>${advertisement.companyId}</td>
																					<td>${advertisement.email}</td>
																					<td>${advertisement.position}</td>
																					<td>${advertisement.endDate}</td>
																					<td>${advertisement.adsImgPath}</td>
																					<td>${advertisement.price}</td>
																					<td bordercolor="#CCCCCC">
																						<div>
																							<div align="center">
																										<button type="button" class="btn btn-default"
																												onclick="b(${advertisement.id})">撤销通过</button>
																								<script>
																									function b(x){
																										var r=confirm("是否确认撤销审核通过");
																										if (r==true){
																											changeadv(x,3)
																										}
																									}
																								</script>
																							</div>
																						</div>
																					</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="await">
											<div class="container">
												<div class="row clearfix">
													<div class="col-md-12 cloumn">
														<div class="table-responsive">
															<c:if test="${per.indexOf('6')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr>
																		<th><span class="STYLE10">企业机构代码</span></th>
																		<th><span class="STYLE10">企业名称</span></th>
																		<th><span class="STYLE10">法人</span></th>
																		<th><span class="STYLE10">联系方式</span></th>
																		<th><span class="STYLE10">银行账户</span></th>
																		<th><span class="STYLE10">营业执照</span></th>
																		<th><span class="STYLE10">税务登记号</span></th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty  allCompanyList}">
																		<c:set var="des" value="companyReview"></c:set>
																		<c:set var="i" value="${allCompanyList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="company" items="${allCompanyList}" varStatus="count">
																			<c:if test="${count.current.reviewState==0}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class ="${style }">
																					<td>${company.companyId}</td>
																					<td>${company.companyName}</td>
																					<td>${company.legalPerson }</td>
																					<td>${company.phoneNumber }</td>
																					<td>${company.bankAccount }</td>
																					<td>${company.openLicenseId}</td>
																					<td>${company.taxRegisterId }</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
															<c:if test="${per.indexOf('5')!=-1}">
																<table class="table table-hover" >
																	<thead >
																	<tr style="font-weight:bolder;">
																		<th ><span  class="STYLE10" >用户名称</span></th>
																		<th ><span class="STYLE10">标题</span></th>
																		<th ><span class="STYLE10" >类型</span></th>
																	</tr>
																	</thead>
																	<tbody >
																	<c:if test="${not empty allNewsList}">
																		<c:set var="des" value="newsReview"></c:set>
																		<c:set var="i" value="${allNewsList}"></c:set>
																		<c:set var="j" value="1"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:set var="number" value="1"> </c:set>
																		<c:set var="hgzc" value="hgzc"> </c:set>
																		<c:set var="scfx" value="scfx"> </c:set>
																		<c:set var="dlhy" value="dlhy"> </c:set>
																		<c:set var="mtjg" value="mtjg"> </c:set>
																		<c:forEach var="news" items="${allNewsList}" varStatus="count">
																			<c:if test="${count.current.reviewState==0}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<c:if test="${news.type.equals(hgzc)}">
																					<c:set var="Type" value="宏观政策"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(scfx)}">
																					<c:set var="Type" value="市场分析"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(dlhy)}">
																					<c:set var="Type" value="电力分析"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(mtjg)}">
																					<c:set var="Type" value="煤炭价格"> </c:set>
																				</c:if>
																				<c:set var="j" value="${j+1}"></c:set>
																				<tr class ="${style}" style="width:10%;margin: 0 auto;">
																					<td  style="vertical-align: middle;width:90px" class="STYLE10">${news.getName()}</td>
																					<td  style="vertical-align: middle;width:100px" class="STYLE10">${news.getTitle()}</td>
																					<td  style="vertical-align: middle;" class="STYLE10">${Type}</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
															<c:if test="${per.indexOf('7')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr class="STYLE10">
																		<th width="47">商品编号</th>
																		<th width="70">数量（万吨）</th>
																		<th width="70">价格（元/吨）</th>
																		<th width="54">全硫份（%）</th>
																		<th width="48">产地</th>
																		<th width="40">运费单价（元/吨）</th>
																		<th width="51">全水分（%）</th>
																		<th width="47">用户名称</th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allProductInfoList}">
																		<c:set var="des" value="queryReview"></c:set>
																		<c:set var="i" value="${allProductInfoList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="product" items="${allProductInfoList}" varStatus="count">
																			<c:if test="${count.current.reviewState==0}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class="${style}">
																					<td class="STYLE10">${product.productId }</td>
																					<td class="STYLE10">${product.quantity }</td>
																					<td class="STYLE10">${product.price }</td>
																					<td class="STYLE10">${product.fullSulfur }</td>
																					<td class="STYLE10">${product.srcAddress }</td>
																					<td class="STYLE10">${product.carriage }</td>
																					<td class="STYLE10">${product.dryPowder }</td>
																					<td class="STYLE10">${product.userName }</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>

																</table>
															</c:if>
															<c:if test="${per.indexOf('8')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr>
																		<th class="STYLE10">申请公司</th>
																		<th class="STYLE10">联系方式（邮箱）</th>
																		<th class="STYLE10">广告位</th>
																		<th class="STYLE10">广告时间</th>
																		<th class="STYLE10">广告图片</th>
																		<th class="STYLE10">广告费用</th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allAdsList}">
																		<c:set var="des" value="advertisementReview"></c:set>
																		<c:set var="i" value="${allAdsList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="advertisement" items="${allAdsList}" varStatus="count">
																			<c:if test="${count.current.reviewState==0}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class ="${style}">
																					<td>${advertisement.companyId}</td>
																					<td>${advertisement.email}</td>
																					<td>${advertisement.position}</td>
																					<td>${advertisement.endDate}</td>
																					<td>${advertisement.adsImgPath}</td>
																					<td>${advertisement.price}</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane" id="reject">
											<div class="container">
												<div class="row clearfix">
													<div class="col-md-12 cloumn">
														<div class="table-responsive">
															<c:if test="${per.indexOf('6')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr>
																		<th><span class="STYLE10">企业机构代码</span></th>
																		<th><span class="STYLE10">企业名称</span></th>
																		<th><span class="STYLE10">法人</span></th>
																		<th><span class="STYLE10">联系方式</span></th>
																		<th><span class="STYLE10">银行账户</span></th>
																		<th><span class="STYLE10">营业执照</span></th>
																		<th><span class="STYLE10">税务登记号</span></th>
																		<th><span class="STYLE10">审核状态</span></th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allCompanyList}">
																		<c:set var="des" value="companyReview"></c:set>
																		<c:set var="i" value="${allCompanyList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="company" items="${allCompanyList}" varStatus="count">
																			<c:if test="${count.current.reviewState==2||count.current.reviewState==3}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class ="${style }">
																					<c:if test="${company.reviewState==3}">
																						<c:set var="a" value="已撤销"></c:set>
																					</c:if>
																					<c:if test="${company.reviewState==2}">
																						<c:set var="a" value="审核不通过"></c:set>
																					</c:if>
																					<td>${company.companyId}</td>
																					<td>${company.companyName}</td>
																					<td>${company.legalPerson }</td>
																					<td>${company.phoneNumber }</td>
																					<td>${company.bankAccount }</td>
																					<td>${company.openLicenseId}</td>
																					<td>${company.taxRegisterId }</td>
																					<td>${a}</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
															<c:if test="${per.indexOf('5')!=-1}">
																<table class="table table-hover" >
																	<thead >
																	<tr style="font-weight:bolder;">
																		<th ><span  class="STYLE10" >用户名称</span></th>
																		<th ><span class="STYLE10">标题</span></th>
																		<th ><span class="STYLE10" >类型</span></th>
																		<th ><span class="STYLE10" >审核状态</span></th>
																	</tr>
																	</thead>
																	<tbody >
																	<c:if test="${not empty allNewsList}">
																		<c:set var="des" value="newsReview"></c:set>
																		<c:set var="i" value="${allNewsList.size()}"></c:set>
																		<c:set var="j" value="1"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:set var="number" value="1"> </c:set>
																		<c:set var="hgzc" value="hgzc"> </c:set>
																		<c:set var="scfx" value="scfx"> </c:set>
																		<c:set var="dlhy" value="dlhy"> </c:set>
																		<c:set var="mtjg" value="mtjg"> </c:set>
																		<c:forEach var="news" items="${allNewsList}" varStatus="count">
																			<c:if test="${count.current.reviewState==2||count.current.reviewState==3}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<c:if test="${news.type.equals(hgzc)}">
																					<c:set var="Type" value="宏观政策"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(scfx)}">
																					<c:set var="Type" value="市场分析"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(dlhy)}">
																					<c:set var="Type" value="电力分析"> </c:set>
																				</c:if>
																				<c:if test="${news.type.equals(mtjg)}">
																					<c:set var="Type" value="煤炭价格"> </c:set>
																				</c:if>
																				<c:set var="j" value="${j+1}"></c:set>
																				<tr class ="${style}" style="width:10%;margin: 0 auto;">
																					<c:if test="${news.reviewState==3}">
																						<c:set var="b" value="已撤销"></c:set>
																					</c:if>
																					<c:if test="${news.reviewState==2}">
																						<c:set var="b" value="审核不通过"></c:set>
																					</c:if>
																					<td  style="vertical-align: middle;width:90px" class="STYLE10">${news.getName()}</td>
																					<td  style="vertical-align: middle;width:100px" class="STYLE10">${news.getTitle()}</td>
																					<td  style="vertical-align: middle;" class="STYLE10">${Type}</td>
																					<td  style="vertical-align: middle;" class="STYLE10">${b}</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
															<c:if test="${per.indexOf('7')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr class="STYLE10">
																		<th width="47">商品编号</th>
																		<th width="70">数量（万吨）</th>
																		<th width="70">价格（元/吨）</th>
																		<th width="54">全硫份（%）</th>
																		<th width="48">产地</th>
																		<th width="40">运费单价（元/吨）</th>
																		<th width="51">全水分（%）</th>
																		<th width="47">用户名称</th>
																		<th width="47">审核状态</th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allProductInfoList}">
																		<c:set var="des" value="queryReview"></c:set>
																		<c:set var="i" value="${allProductInfoList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="product" items="${allProductInfoList}" varStatus="count">
																			<c:if test="${count.current.reviewState==2||count.current.reviewState==3}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class="${style}">
																					<c:if test="${product.reviewState==3}">
																						<c:set var="c" value="已撤销"></c:set>
																					</c:if>
																					<c:if test="${product.reviewState==2}">
																						<c:set var="c" value="审核不通过"></c:set>
																					</c:if>
																					<td class="STYLE10">${product.productId }</td>
																					<td class="STYLE10">${product.quantity }</td>
																					<td class="STYLE10">${product.price }</td>
																					<td class="STYLE10">${product.fullSulfur }</td>
																					<td class="STYLE10">${product.srcAddress }</td>
																					<td class="STYLE10">${product.carriage }</td>
																					<td class="STYLE10">${product.dryPowder }</td>
																					<td class="STYLE10">${product.userName }</td>
																					<td class="STYLE10">${c }</td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>

																</table>
															</c:if>
															<c:if test="${per.indexOf('8')!=-1}">
																<table class="table table-hover">
																	<thead>
																	<tr>
																		<th class="STYLE10">申请公司</th>
																		<th class="STYLE10">联系方式（邮箱）</th>
																		<th class="STYLE10">广告位</th>
																		<th class="STYLE10">广告时间</th>
																		<th class="STYLE10">广告图片</th>
																		<th class="STYLE10">广告费用</th>
																		<th class="STYLE10">审核状态</th>
																	</tr>
																	</thead>
																	<tbody>
																	<c:if test="${not empty allAdsList}">
																		<c:set var="des" value="advertisementReview"></c:set>
																		<c:set var="i" value="${allAdsList.size()}"></c:set>
																		<c:set var="style" value=""></c:set>
																		<c:forEach var="advertisement" items="${allAdsList}" varStatus="count">
																			<c:if test="${count.current.reviewState==2||count.current.reviewState==3}">
																				<c:choose>
																					<c:when test="${i%5==0}">
																						<c:set var="style" value="success"></c:set>
																					</c:when>
																					<c:when test="${i%5==1 }">
																						<c:set var="style" value="error"></c:set>
																					</c:when>
																					<c:when test="${i%5==2 }">
																						<c:set var="style" value="warning"></c:set>
																					</c:when>
																					<c:when test="${i%5==3 }">
																						<c:set var="style" value="info"></c:set>
																					</c:when>
																					<c:when test="${i%5==4}">
																						<c:set var="style" value="active"></c:set>
																					</c:when>
																				</c:choose>
																				<c:set var="i" value="${i-1}"></c:set>
																				<tr class ="${style}">
																					<c:if test="${advertisement.reviewState==3}">
																						<c:set var="d" value="已撤销"></c:set>
																					</c:if>
																					<c:if test="${advertisement.reviewState==2}">
																						<c:set var="d" value="审核不通过"></c:set>
																					</c:if>
																					<td>${advertisement.companyId}</td>
																					<td>${advertisement.email}</td>
																					<td>${advertisement.position}</td>
																					<td>${advertisement.endDate}</td>
																					<td>${advertisement.adsImgPath}</td>
																					<td>${advertisement.price}</td>
																					<td>${d}</td>
																				</tr>

																			</c:if>
																		</c:forEach>
																	</c:if>
																	</tbody>
																</table>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 column"  id="page">
									<div class="row">
										<div class="col-md-6">
											当前第${pageinfo.pageNum}页，总共${pageinfo.pages}页，共${pageinfo.total}条记录
										</div>

										<div class="col-md-6">
											<nav aria-label="Page navigation">
												<ul class="pagination">

													<li><a href="${context}/login/getcheckedlist?param=1">首页</a> </li>

													<c:if test="${pageinfo.hasPreviousPage}">
														<li><a href=""${context}/login/getcheckedlist?param=${pageinfo.pageNum-1}"" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
															</a></li>
													</c:if>

													<c:forEach items="${pageinfo.navigatepageNums}" var="pagenum">
														<c:if test="${pagenum==pageinfo.pageNum}">
															<li class="active"><a href="#">${pagenum}</a> </li>
														</c:if>
														<c:if test="${pagenum!=pageinfo.pageNum}">
															<li><a href="${context}/login/getcheckedlist?param=${pagenum}">${pagenum}</a> </li>
														</c:if>
													</c:forEach>
													<c:if test="${pageinfo.hasNextPage}">
														<li><a href=""${context}/login/getcheckedlist?param=${pageinfo.pageNum+1}"" aria-label="Next">
															<span aria-hidden="true">&laquo;</span>
															</a></li>
													</c:if>
													<li><a href="${context}/login/getcheckedlist?param=${pageinfo.pages}">末页</a> </li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
				</div>
				</div>
				</div>
				</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <!-- 文本框大小随着内容自适应 -->
	<script >
	$(function () {
	    // 为每一个textarea绑定事件使其高度自适应
	    $.each($("textarea"), function(i, n){
	        autoTextarea($(n)[0]);
	    });
	})
	var autoTextarea = function (elem, extra, maxHeight) {
    extra = extra || 0;
    var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
    isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
        addEvent = function (type, callback) {
            elem.addEventListener ?
                elem.addEventListener(type, callback, false) :
                elem.attachEvent('on' + type, callback);
        },
        getStyle = elem.currentStyle ?
        function (name) {
            var val = elem.currentStyle[name];
            if (name === 'height' && val.search(/px/i) !== 1) {
                var rect = elem.getBoundingClientRect();
                return rect.bottom - rect.top -
                       parseFloat(getStyle('paddingTop')) -
                       parseFloat(getStyle('paddingBottom')) + 'px';
            };
            return val;
        } : function (name) {
            return getComputedStyle(elem, null)[name];
        },
    minHeight = parseFloat(getStyle('height'));
    elem.style.resize = 'none';//如果不希望使用者可以自由的伸展textarea的高宽可以设置其他值

    var change = function () {
        var scrollTop, height,
            padding = 0,
            style = elem.style;

        if (elem._length === elem.value.length) return;
        elem._length = elem.value.length;

        if (!isFirefox && !isOpera) {
            padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
        };
        scrollTop = document.body.scrollTop || document.documentElement.scrollTop;

        elem.style.height = minHeight + 'px';
        if (elem.scrollHeight > minHeight) {
            if (maxHeight && elem.scrollHeight > maxHeight) {
                height = maxHeight - padding;
                style.overflowY = 'auto';
            } else {
                height = elem.scrollHeight - padding;
                style.overflowY = 'hidden';
            };
            style.height = height + extra + 'px';
            scrollTop += parseInt(style.height) - elem.currHeight;
            document.body.scrollTop = scrollTop;
            document.documentElement.scrollTop = scrollTop;
            elem.currHeight = parseInt(style.height);
        };
    };

    addEvent('propertychange', change);
    addEvent('input', change);
    addEvent('focus', change);
    change();
};

function removeTAG(str){
    return str.replace(/<[^>]+>/g, "");
}
// $(document).ready(function () {
// 	$("#passed").bootstrapTable({
// 		url: "/login/getcheckedlist",
// 		striped: true,
// 		pageNumber: 1,
// 		pagination: true,
// 		sidePagination: 'client',
// 		pageSize: 10,
// 		pageList: [5, 10],
// 		showRefresh: true
// 	})
// })
// 	$(document).ready(function () {
// 		$("#await").bootstrapTable({
// 			url: "/login/getcheckedlist",
// 			striped: true,
// 			pageNumber: 1,
// 			pagination: true,
// 			sidePagination: 'client',
// 			pageSize: 10,
// 			pageList: [5, 10],
// 			showRefresh: true
// 		})
// 	})
// 	$(document).ready(function () {
// 		$("#reject").bootstrapTable({
// 			url: "/login/getcheckedlist",
// 			striped: true,
// 			pageNumber: 1,
// 			pagination: true,
// 			sidePagination: 'client',
// 			pageSize: 10,
// 			pageList: [5, 10],
// 			showRefresh: true
// 		})
// 	})
	</script>

</body>

</html>