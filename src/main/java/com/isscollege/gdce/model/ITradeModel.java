package com.isscollege.gdce.model;

import com.isscollege.gdce.domain.Product;

public interface ITradeModel
{
	Product getProductInfoById(int productId);

	String getPhoneNumber(int productId);

	boolean updateProductState(int productId);

	String getCompanyIdByName(String name);
}
