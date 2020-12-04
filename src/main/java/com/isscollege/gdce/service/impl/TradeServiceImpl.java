package com.isscollege.gdce.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.ITradeDao;
import com.isscollege.gdce.dao.IUserDao;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.service.ITradeService;

@Service("/tradeService")
public class TradeServiceImpl implements ITradeService
{
	private static final Logger LOGGER = Logger.getLogger(TradeServiceImpl.class);
	@Autowired
	private ITradeDao iTradeDao;
	@Autowired
	private IUserDao iUserDao;

	public Product getProductInfoById(int productId)
	{
		return iTradeDao.getProductInfoById(productId);
	}

	public String getPhoneNumber(int productId)
	{
		return iTradeDao.getPhoneNumber(productId);
	}

	public boolean updateProductState(int productId)
	{
		return iTradeDao.updateProductState(productId);
	}

	public String getCompanyIdByName(String name)
	{
		User TempUser = new User();

		TempUser = iUserDao.queryUserByName(name);

		return TempUser.getCompanyId();
	}
}
