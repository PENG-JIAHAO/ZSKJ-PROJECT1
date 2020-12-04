package com.isscollege.gdce.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.ITradeModel;

/*
 * 交易管理
 */
@Controller
@RequestMapping("/trade")
public class TradeController
{
	private static final Logger LOGGER = Logger.getLogger(TradeController.class);
	@Autowired
	private ITradeModel tradeModel;

	// 查看摘牌信息功能
	@RequestMapping("/checkDelist")
	public String checkDelist(Integer productId, HttpSession session) throws Exception
	{
		session.setAttribute("product", tradeModel.getProductInfoById(productId));
		return "trade/delist";
	}

	// 生成合同(确认摘牌时)
	@RequestMapping("/productToContract")
	public String productToContract(HttpSession session, Contract contract) throws Exception
	{
		if(session.getAttribute("product") != null
				&& session.getAttribute("currentUser") != null)
		{
			Product product = (Product) session.getAttribute("product");
			User currentUser = (User) session.getAttribute("currentUser");
			tradeModel.updateProductState(product.getProductId());
			String sellerCompanyId = tradeModel.getCompanyIdByName(product.getUserName());
			contract.setSellerCompanyId(sellerCompanyId);
			contract.setBuyerCompanyId(currentUser.getCompanyId());
			contract.setProductId(product.getProductId());
			session.setAttribute("contract", contract);
			session.setMaxInactiveInterval(60 * 60);
		}
		return "/contract/contract";
	}
}