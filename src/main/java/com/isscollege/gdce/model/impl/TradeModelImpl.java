package com.isscollege.gdce.model.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.model.ITradeModel;
import com.isscollege.gdce.service.ITradeService;

@Component("/tradeModel")
public class TradeModelImpl implements ITradeModel
{
	private static final Logger LOGGER = Logger.getLogger(TradeModelImpl.class);
	@Autowired
	private ITradeService server;

	@Override
	public Product getProductInfoById(int productId)
	{
		return server.getProductInfoById(productId);
	}

	@Override
	public String getPhoneNumber(int productId)
	{
		return server.getPhoneNumber(productId);
	}

	@Override
	public boolean updateProductState(int productId)
	{
		return server.updateProductState(productId);
	}

	@Override
	public String getCompanyIdByName(String name)
	{
		return server.getCompanyIdByName(name);
	}
}
