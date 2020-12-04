package com.isscollege.gdce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.isscollege.gdce.domain.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.isscollege.gdce.model.IProductModel;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexPageController
{
	private static final Logger LOGGER = Logger.getLogger(IndexPageController.class);
	@Autowired
	private IProductModel productModel;

	public void setProductModel(IProductModel productModel)
	{
		this.productModel = productModel;
	}

	@RequestMapping(value = { " ", "", "/" }, method = RequestMethod.GET)
	public void showView( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String url = "/jsp/index.jsp";

		if (session.getAttribute("currentUser") instanceof User)
		{
			User user = (User) session.getAttribute("currentUser");
			if (user.getLevel() == 0 || user.getLevel() == 1)
			{
				url = "/jsp/product/managing";
			}
		}

		session.setAttribute("indexProductInfoList",productModel.getIndexProductInfo());
		session.setAttribute("allProductInfoList", productModel.getAllProductInfo());
		session.setAttribute("auditingProductList", productModel.getPublishedProductInfo());
		session.setAttribute("publishedProductInfoList", productModel.getAuditingProductInfo());
		session.setAttribute("underProductList", productModel.getUnderProductInfo());
		session.setAttribute("notPassProductList", productModel.getNotPassProductInfo());

		request.getRequestDispatcher(url).forward(request, response);
	}

	@RequestMapping(value = "/getuserproduct")
	public String getProductsByUserName(@RequestParam(value = "param", defaultValue = "1") int param, HttpServletRequest request, Model model)
	{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		List<Product> productUserList= productModel.getProductInfoByName(user.getName());
		session.setAttribute("productUserList", productUserList);
		PageHelper.startPage(param, 10);
		PageInfo<Product> productUserListpageinfo = new PageInfo<Product>(productUserList);
		PageInfo<Product> auditingProductListpageinfo = new PageInfo<Product>((List<Product>) session.getAttribute("auditingProductList"));
		PageInfo<Product> underProductListpageinfo = new PageInfo<Product>((List<Product>) session.getAttribute("underProductList"));
		PageInfo<Product> notPassProductListpageinfo = new PageInfo<Product>((List<Product>) session.getAttribute("notPassProductList"));
		model.addAttribute("productUserListpageinfo", productUserListpageinfo);
		model.addAttribute("auditingProductListpageinfo", auditingProductListpageinfo);
		model.addAttribute("underProductListpageinfo", underProductListpageinfo);
		model.addAttribute("notPassProductListpageinfo", notPassProductListpageinfo);
		return "product/managing";
	}

}
