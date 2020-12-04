<%@ page pageEncoding="UTF-8" import="java.util.*" %>
<%@ include file="/jsp/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
<style type="text/css">
body
{
background-color:white;
}

td
{
text-align:left;
}

</style>


<body >
    <div class="container text-right" style="margin-bottom: 0">
		<c:choose>
			<c:when test="${currentUser eq '' }" >
				<a href="${context }/jsp/login.jsp">登录</a>
			</c:when>
			<c:otherwise>
				${currentUser.name }&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
		<a href="${context }/login/logout">注销</a>
	</div>
	
    <div class="container">
      <div class="header clearfix">
        <nav class="navbar">
          <ul class="nav nav-pills pull-right socials">
            <li role="presentation"><a href="${context }">首页</a></li>
            <li role="presentation"><a href="#">交易中心</a></li>
            <li role="presentation"><a href="${context }/jsp/news/newsCenter.jsp" >咨询中心</a></li>
            <li role="presentation"><a href="${context }/jsp/logistics/waybillIndex.jsp">物流中心</a></li>
            <li role="presentation"><a href="${context }/jsp/user/com_qualification.jsp">会员中心</a></li>
          </ul>
          <h3 class="text-muted"><a href="${context }"><img alt="logo" src="${context }/imgs/logo.png"></a></h3>
        </nav>        
      </div>
     </div>
     
<div class="container">
<div class="row clearfix">
<div class="col-md-1 column">
		</div>

<div class="col-md-10 column">

	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="alert alert-success" >订单生成成功 ！</div>
		</div>
		<br>
	</div>

<br>
<h3><span class="label label-primary">销售信息</span></h3>
<table class="table" >
			
				<tbody>
					<tr class="warning">
						<td width="480px">
							订单号
						</td>
						<td colspan="3" >
	               <!--填写时间  -->     ${order.orderId}
						</td>
				
					</tr>
					<tr >
						<td>
							订单创建时间
						</td>
						<td colspan="3">
					<!--订单号  -->		${order.createDate}
					
					    </td>
					</tr>
					<tr class="error">
						<td>
							订单状态
						</td>
						<td>
			<!--状态  -->		待付款
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
					</tr>
		
				</tbody>
			</table>
			<h3><span class="label label-primary">商品信息</span></h3>
			<table class="table">
			
				<tbody>
					<tr class="warning">
						<td width="480px">
							商品名称
						</td>
					
				
					</tr>
					
					<tr >
						<td>
						       价格
						</td>
						<td>
				   			${product.price}元/吨
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
				
					</tr>
					<tr >
						<td>
						     数量
						</td>
						<td>
						${product.quantity}万吨
						</td>
						<td>
						
						</td>
						<td>
							
						</td>
				
					</tr><tr >
						<td>
						       产地
						</td>
						<td>
							${product.srcAddress}
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
				
					</tr>
					<tr >
						<td>
							发货港口
						</td>
						<td>
							${product.portAddress}
						</td>
						<td>
						
						</td>
						<td>
						
						</td>
				
					</tr>
					<tr >
						<td>
							付款金额
						</td>
						<td>
							${order.tradePrice}万元	
						</td>
						
						<td>
							
						</td>
						<td>
							
						</td>
							
					</tr>
				
				</tbody>
			</table>
	<h3><span class="label label-primary">买方信息</span></h3>
			<table class="table">
			
				<tbody>
					<tr class="warning">
						<td width="480px">
							买方
						</td>
						<td colspan="3">
				<!--买方 -->		${buyerCompany.companyName }
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
					
					</tr>
					
					<tr class="error">
						<td>
							买方联系方式
						</td>
						<td colspan="3">
							${buyerCompany.phoneNumber }
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
				
					
				</tbody>
			</table>
		<h3><span class="label label-primary">卖方信息</span></h3>	
			<table class="table">
		
				<tbody>
					<tr class="warning">
						<td width="480px">
							卖方
						</td>
						<td colspan="3">
				  	${sellerCompany.companyName }
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
					
					</tr>
					
					<tr class="error">
						<td>
							卖方联系方式
						</td>
						<td colspan="3">
				<!--卖方联系方式  -->		${sellerCompany.phoneNumber }
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
				
					</tr>
					
				</tbody>
			</table>
		<div class="col-md-1 column">
		</div>
		</div>
	</div>
<br>




    </div>
<div class="jumbotron text-center" style="margin-bottom:0">
  <p><h5><a onclick="openhelp()">客服中心</a>|<a href="">联系我们</a><br><br>
     网站版权归中国国电集团公司所有 京ICP备 05053479号-2 |京公网安备110102005596号-1<br>
地址：北京市昌平区未来科技城 邮编：102209 电话：400-020-8000（非工作时间：15011089832）、010-56978755 传真： 010-56978760<br>
                                                     电子邮箱：fuel@powerec.net</h5></p>
</div>


</body>
</html>