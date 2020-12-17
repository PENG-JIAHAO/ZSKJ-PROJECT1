package com.isscollege.gdce.model.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.model.IOrderModel;
import com.isscollege.gdce.service.IOrderService;

@Component(value = "orderModel")
public class OrderModelImpl implements IOrderModel
{
	private static final Logger LOGGER = Logger.getLogger(OrderModelImpl.class);
	@Autowired
	@Qualifier("orderService")
	private IOrderService service;

	public void setService(IOrderService service)
	{
		this.service = service;
	}

	@Override
	public List<Order> queryOrderOnPage(int page, String companyId)
	{
		return service.queryOrderOnPage(page, companyId);
	}

	@Override
	public List<Order> queryOrderAll(String orderId, String companyId)
	{
		return service.queryOrderAll(orderId, companyId);
	}

	@Override
	public Order queryOrder(String orderId)
	{
		return service.queryOrder(orderId);
	}

	@Override
	public Product queryProduct(Order order)
	{
		return service.queryProduct(order);
	}

	@Override
	public Company queryBuyer(Order order)
	{
		return service.queryBuyer(order);
	}

	@Override
	public Company querySeller(Order order)
	{
		return service.querySeller(order);
	}

	@Override
	public List<Order> queryAppointedOrder(String orderId, int page, String companyId)
	{
		return service.queryAppointedOrder(orderId, page, companyId);
	}

	@Override
	public boolean updateReceiptPath(Order order)
	{

		return service.updateReceiptPath(order);
	}

	@Override
	public boolean orderCreate(Order order)
	{
		return service.orderCreate(order);
	}

	@Override
	public Product queryProduct(int productId)
	{
		return service.queryProduct(productId);
	}

	@Override
	public Company queryCompany(String companyId)
	{
		return service.queryCompany(companyId);
	}

	@Override
	public Order queryCompanyIdByOrderId(String orderId)
	{
		return service.queryCompanyIdByOrderId(orderId);
	}


	@Override
	public String queryOrderIdById(String orderid)
	{
		return service.queryOrderIdById(orderid);

	}

	@Override
	public void updateOrderStatus(String orderId, int orderState)
	{
		service.updateOrderStatus(orderId, orderState);
	}

}
