package com.isscollege.gdce.service;

import com.isscollege.gdce.domain.Product;

public interface ITradeService
{

	Product getProductInfoById(int productId);

	String getPhoneNumber(int productId);

	boolean updateProductState(int productId);

	String getCompanyIdByName(String name);
}
