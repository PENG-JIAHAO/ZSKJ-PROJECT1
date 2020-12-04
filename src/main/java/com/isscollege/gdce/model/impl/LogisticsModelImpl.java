package com.isscollege.gdce.model.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.LogisticsInfo;
import com.isscollege.gdce.domain.LogisticsPrice;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;
import com.isscollege.gdce.model.ILogisticsModel;
import com.isscollege.gdce.service.ILogisticsService;

@Component("/logisticsModelImpl")
public class LogisticsModelImpl implements ILogisticsModel
{
	private static final Logger LOGGER = Logger.getLogger(LogisticsModelImpl.class);
	@Autowired
	ILogisticsService service;

	public List<WaybillInfo> queryWaybillByState(String state, String userid)
	{
		return service.queryWaybillByState(state, userid);
	}

	public List<WaybillInfo> queryWaybillByTwoState(String state, String state1, String userid)
	{
		return service.queryWaybillByTwoState(state, state1, userid);
	}

	public List<WaybillInfo> queryWaybillOnPage(int Page, String state, String userid)
	{
		return service.queryWaybillOnPage(Page, state, userid);
	}

	public List<WaybillInfo> queryWaybillOnPageByTwoState(int Page, String state, String state1, String userid)
	{
		return service.queryWaybillOnPageByTwoState(Page, state, state1, userid);
	}

	@Override
	public List<LogisticsPrice> priceGuide(String startingPlace, String destination, double weight)
	{
		return service.priceGuide(startingPlace, destination, weight);
	}

	@Override
	public Company queryCompanyInfo(String waybillCompanyid)
	{
		return service.queryCompanyInfo(waybillCompanyid);
	}

	@Override
	public List<Double> sumcost(List<LogisticsPrice> logisticspricelist, double weight)
	{
		return service.sumcost(logisticspricelist, weight);
	}

	@Override
	public List<LogisticsInfo> queryLogisticsInfo(String waybillId)
	{
		return service.queryLogisticsInfo(waybillId);
	}

	@Override
	public WaybillInfo queryWaybillInfoByWaybillId(String waybillId)
	{
		return service.queryWaybillInfoByWaybillId(waybillId);
	}

	@Override
	public Product queryProductByOrderId(String orderId)
	{
		return service.queryProductByOrderId(orderId);
	}

	@Override
	public boolean updateWaybillState(String Cstate, String waybillid)
	{
		return service.updateWaybillState(Cstate, waybillid);
	}

	public boolean insertLogisticsInfo(LogisticsInfo logisticsInfo)
	{
		return service.insertLogisticsInfo(logisticsInfo);
	}

	public boolean updateOrderState(int changeState, String orderId)
	{
		return service.updateOrderState(changeState, orderId);
	}

	@Override
	public String queryWaybillByOrderId(String orderId)
	{
		return service.queryWaybillByOrderId(orderId);
	}

	@Override
	public List<Order> queryOrderAll(String userid)
	{
		return service.queryOrderAll(userid);
	}

	@Override
	public List<Order> queryOrderOnPage(int page, String userid)
	{
		return service.queryOrderOnPage(page, userid);
	}

	@Override
	public List<Company> queryLogisticsCompany()
	{
		return service.queryLogisticsCompany();
	}

}
