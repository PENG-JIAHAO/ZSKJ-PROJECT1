package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;

public interface IOrderModel
{

	String queryOrderIdById(String orderid);

	// 查询订单表，得到订单详情页所需的信息
	Order queryOrder(String orderId);

	// 查询产品表，得到订单详情页所需的信息
	Product queryProduct(Order order);

	// 查询企业表，得到订单详情页所需的买方信息
	Company queryBuyer(Order order);

	// 查询企业表，得到订单详情页所需的卖方信息
	Company querySeller(Order order);

	// 查询订单表，得到八个当前订单，用于分页（一页八个）
	List<Order> queryOrderOnPage(int page, String companyId);

	// 查询当前用户的所有订单
	List<Order> queryOrderAll(String orderId, String companyId);

	// 查询订单表，得到指定订单编号的订单
	List<Order> queryAppointedOrder(String orderId, int page, String companyId);

	boolean updateReceiptPath(Order order);

	boolean orderCreate(Order order);

	Product queryProduct(int productId);

	Company queryCompany(String companyId);

	// 根据订单号查询 Order 对象
	Order queryCompanyIdByOrderId(String orderId);

	// 运单
	boolean insertWayBill(WaybillInfo waybill);

	void updateOrderStatus(String orderId, int orderState);

}
