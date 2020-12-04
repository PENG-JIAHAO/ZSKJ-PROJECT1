package com.isscollege.gdce.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.IOrderDao;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;
import com.isscollege.gdce.service.IOrderService;

@Service(value = "orderService")
public class OrderServiceImpl implements IOrderService
{
	private static final Logger LOGGER = Logger.getLogger(OrderServiceImpl.class);
	@Autowired
	private IOrderDao dao;

	public void setDao(IOrderDao dao)
	{
		this.dao = dao;
	}

	@Override
	public List<Order> queryOrderOnPage(int page, String companyId)
	{
		return dao.queryOrderByPage(page, companyId);
	}

	@Override
	public List<Order> queryOrderAll(String orderId, String companyId)
	{
		return dao.queryOrder(orderId, companyId);
	}

	@Override
	public Order queryOrder(String orderId)
	{
		return dao.queryOrderByOrderId(orderId);
	}

	@Override
	public Product queryProduct(Order order)
	{
		return dao.queryProductByProductId(order);
	}

	@Override
	public Company queryBuyer(Order order)
	{
		return dao.queryBuyerByCompanyId(order);
	}

	@Override
	public Company querySeller(Order order)
	{
		return dao.querySellerByCompanyId(order);
	}

	@Override
	public List<Order> queryAppointedOrder(String orderId, int page, String companyId)
	{
		return dao.queryAppointedOrderByOrderId(orderId, page, companyId);
	}

	@Override
	public boolean updateReceiptPath(Order order)
	{
		return dao.updateReceiptPath(order);
	}

	@Override
	public boolean orderCreate(Order order)
	{
		return dao.insertOrder(order);
	}

	@Override
	public Product queryProduct(int productId)
	{
		return dao.queryProductByProductId1(productId);
	}

	@Override
	public Company queryCompany(String companyId)
	{
		return dao.queryCompanyByCompanyId(companyId);
	}

	@Override
	public Order queryCompanyIdByOrderId(String orderId)
	{
		return dao.queryCompanyIdByOrderId(orderId);
	}

	@Override
	public boolean insertWayBill(WaybillInfo waybill)
	{
		return dao.insertWaybill(waybill);
	}

	@Override
	public String queryOrderIdById(String orderid)
	{
		return dao.queryOrderIdById(orderid);
	}

	@Override
	public void updateOrderStatus(String orderId, int orderState)
	{
		dao.updateOrderStatus(orderId, orderState);
	}

}
