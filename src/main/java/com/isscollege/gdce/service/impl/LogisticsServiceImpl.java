package com.isscollege.gdce.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.ILogisticsDao;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.LogisticsInfo;
import com.isscollege.gdce.domain.LogisticsPrice;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;
import com.isscollege.gdce.service.ILogisticsService;

@Service("/logisticsServiceImpl")
public class LogisticsServiceImpl implements ILogisticsService
{
	private static final Logger LOGGER = Logger.getLogger(LogisticsServiceImpl.class);
	@Autowired
	ILogisticsDao dao;

	public List<WaybillInfo> queryWaybillByState(String state, String userid)
	{

		return dao.queryWaybillByState(state, userid);
	}

	public List<WaybillInfo> queryWaybillByTwoState(String state, String state1, String userid)
	{
		return dao.queryWaybillByTwoState(state, state1, userid);
	}

	public List<WaybillInfo> queryWaybillOnPage(int Page, String state, String userid)
	{
		return dao.queryWaybillOnPage(Page, state, userid);

	}

	public List<WaybillInfo> queryWaybillOnPageByTwoState(int Page, String state, String state1, String userid)
	{

		return dao.queryWaybillOnPageByTwoState(Page, state, state1, userid);

	}

	@Override
	public List<LogisticsPrice> priceGuide(String startingPlace, String destination, double weight)
	{
		List<LogisticsPrice> price = new ArrayList<LogisticsPrice>();
		List<LogisticsPrice> logisticspricelist = dao.queryLogisticsPrice(startingPlace, destination);
		for (LogisticsPrice productPrice : logisticspricelist)
		{
			String productWeight = productPrice.getWeight();
			String prodcutOperator = "" + productWeight.charAt(0) + productWeight.charAt(1);
			int prodcutOperatorWeight = productWeight.charAt(2);
			if ((weight > prodcutOperatorWeight && prodcutOperator.equals("<="))
					|| (weight <= prodcutOperatorWeight && prodcutOperator.equals(">=")))
			{
				price.add(productPrice);
			}
		}
		return price;
	}

	@Override
	public Company queryCompanyInfo(String waybillCompanyid)
	{
		return dao.queryCompanyBywaybillCompanyid(waybillCompanyid);
	}

	@Override
	public List<Double> sumcost(List<LogisticsPrice> logisticspricelist, double weight)
	{
		List<Double> totalpriceslist = new ArrayList<>();
		DecimalFormat dl = new DecimalFormat("0.00");
		for (int i = 0; i < logisticspricelist.size(); i++)
		{
			double money = Double.parseDouble(dl.format(logisticspricelist.get(i).getPrice() * weight * 10000));
			totalpriceslist.add(money);
		}
		return totalpriceslist.size() > 0 ? totalpriceslist : null;
	}

	@Override
	public List<LogisticsInfo> queryLogisticsInfo(String waybillId)
	{
		return dao.queryLogisticsByWaybillId(waybillId);
	}

	@Override
	public WaybillInfo queryWaybillInfoByWaybillId(String waybillId)
	{
		return dao.queryWaybillInfoByWaybillId(waybillId);
	}

	@Override
	public Product queryProductByOrderId(String orderId)
	{
		return dao.queryProductByOrderId(orderId);
	}

	@Override
	public boolean updateWaybillState(String Cstate, String waybillid)
	{

		return dao.updateWaybillState(Cstate, waybillid);
	}

	@Override
	public boolean insertLogisticsInfo(LogisticsInfo logisticsInfo)
	{

		return dao.insertLogisticsInfo(logisticsInfo) > 0;

	}

	@Override
	public boolean updateOrderState(int changeState, String orderId)
	{
		return dao.updateOrderState(changeState, orderId) > 0;

	}

	@Override
	public String queryWaybillByOrderId(String orderId)
	{
		return dao.queryWaybillByOrderId(orderId);
	}

	public List<Order> queryOrderAll(String userid)
	{
		return dao.queryOrderAll(userid);

	}

	@Override
	public List<Order> queryOrderOnPage(int page, String userid)
	{
		return dao.queryOrderOnPage(page, userid);
	}

	@Override
	public List<Company> queryLogisticsCompany()
	{
		return dao.queryLogisticsCompany();
	}
}
