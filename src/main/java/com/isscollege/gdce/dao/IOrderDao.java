package com.isscollege.gdce.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;

public interface IOrderDao
{
	String queryOrderIdById(@Param("orderid") String orderid);

	// 使用orderId查询订单表，得到订单详情页所需的信息
	Order queryOrderByOrderId(String orderId);

	// 使用productId查询产品表，得到订单详情页所需的信息
	Product queryProductByProductId(Order order);

	// 使用CompanyId查询企业表，得到订单详情页所需的买方信息
	Company queryBuyerByCompanyId(Order order);

	// 使用CompanyId查询企业表，得到订单详情页所需的卖方信息
	Company querySellerByCompanyId(Order order);

	// 查询当前用户的订单，存在分页，传入page参数以查看不同页
	List<Order> queryOrderByPage(@Param("page") int page, @Param("companyId") String companyId);

	// 查询当前用户的所有订单
	List<Order> queryOrder(@Param("orderId") String orderId, @Param("companyId") String companyId);

	// 查询指定orderId的订单
	List<Order> queryAppointedOrderByOrderId(@Param("orderId") String orderId, @Param("page") int page,
											 @Param("companyId") String companyId);

	boolean updateReceiptPath(Order order);

	// 查询CompanyId
	Order queryCompanyIdByOrderId(String orderId);

	// 使用productId查询产品表，得到订单详情页所需的产品信息
	Product queryProductByProductId1(int productId);

	// 使用companyId查询产品表，得到订单详情页所需的企业信息
	Company queryCompanyByCompanyId(String companyId);

	// 在数据库中插入成功生成的订单
	boolean insertOrder(Order order);

	// 运单生成存入数据库
	boolean insertWaybill(WaybillInfo waybill);

	void updateOrderStatus(@Param("orderId") String orderId, @Param("orderState") int orderState);

	void updateWaybillStatus(@Param("orderId") String orderId, @Param("waybillState") int waybillState);

}
