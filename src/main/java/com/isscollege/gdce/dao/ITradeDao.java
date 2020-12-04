package com.isscollege.gdce.dao;

import com.isscollege.gdce.domain.Product;

public interface ITradeDao
{
	Product getProductInfoById(int productId);

	String getPhoneNumber(int productId);

	public boolean updateProductState(int productId);
}
