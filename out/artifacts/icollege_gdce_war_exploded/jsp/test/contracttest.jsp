<%@ page pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp"%>
<%@page import="com.isscollege.gdce.domain.Contract"%>
<body>
	<%Contract contract = new Contract();%>
	<%contract.setBuyerCompanyId("123456789");%>
	<%contract.setSellerCompanyId("987654321");%>
	<%contract.setProductId(1);%>
	<%session.setAttribute("contract", contract); %>
	<a href="<%=context%>/jsp/contract/contract.jsp">jump</a>
</body>
</html>