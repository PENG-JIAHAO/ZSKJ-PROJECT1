package com.isscollege.gdce.service;

import java.util.List;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.LogisticsInfo;
import com.isscollege.gdce.domain.LogisticsPrice;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;

public interface ILogisticsService
{
	List<Company> queryLogisticsCompany();

	List<WaybillInfo> queryWaybillOnPage(int Page, String state, String userid);

	List<WaybillInfo> queryWaybillOnPageByTwoState(int Page, String state, String state1, String userid);

	List<WaybillInfo> queryWaybillByState(String state, String userid);

	List<WaybillInfo> queryWaybillByTwoState(String state, String state1, String userid);

	List<LogisticsPrice> priceGuide(String startingPlace, String destination, double weight);

	Company queryCompanyInfo(String waybillCompanyid);

	List<Double> sumcost(List<LogisticsPrice> logisticspricelist, double weight);

	List<LogisticsInfo> queryLogisticsInfo(String waybillId);

	WaybillInfo queryWaybillInfoByWaybillId(String waybillId);

	Product queryProductByOrderId(String orderId);

	public boolean updateWaybillState(String Cstate, String waybillid);

	boolean insertLogisticsInfo(LogisticsInfo logisticsInfo);

	boolean updateOrderState(int changeState, String orderId);

	String queryWaybillByOrderId(String orderId);

	public List<Order> queryOrderAll(String userid);

	List<Order> queryOrderOnPage(int page, String userid);

}
