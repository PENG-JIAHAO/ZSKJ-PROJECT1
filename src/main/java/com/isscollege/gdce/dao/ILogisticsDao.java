package com.isscollege.gdce.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Repository;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.LogisticsInfo;
import com.isscollege.gdce.domain.LogisticsPrice;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.WaybillInfo;
import com.isscollege.gdce.domain.Order;

@Repository
public interface ILogisticsDao
{
	List<Company> queryLogisticsCompany();

	List<LogisticsPrice> queryLogisticsPrice(String startingPlace, String destination);

	List<WaybillInfo> queryWaybillOnPage(@Param("page") int Page, @Param("state") String state,
			@Param("userid") String userid);

	List<WaybillInfo> queryWaybillOnPageByTwoState(@Param("page") int Page, @Param("state") String state,
			@Param("state1") String state1, @Param("userid") String userid);

	List<WaybillInfo> queryWaybillByState(@Param("state") String state, @Param("userid") String userid);

	List<WaybillInfo> queryWaybillByTwoState(@Param("state") String state, @Param("state1") String state1,
			@Param("userid") String userid);

	Company queryCompanyBywaybillCompanyid(@Param("waybillCompanyid") String waybillCompanyid);

	List<LogisticsPrice> countCost(String startingPlace, String destination, double weight);

	List<Double> getsumcost(List<LogisticsPrice> logisticspricelist, double weight);

	List<LogisticsInfo> queryLogisticsByWaybillId(@Param("waybillId") String waybillId);

	WaybillInfo queryWaybillInfoByWaybillId(@Param("waybillId") String waybillId);

	Product queryProductByOrderId(@Param("orderId") String orderId);

	boolean updateWaybillState(@Param("Cstate") String Cstate, @Param("waybillId") String waybillId);

	Integer insertLogisticsInfo(LogisticsInfo logisticsInfo);

	Integer updateOrderState(@Param("changeState") int changeState, @Param("orderId") String orderId);

	String queryWaybillByOrderId(String orderId);;

	List<Order> queryOrderAll(String userid);

	List<Order> queryOrderOnPage(@Param("page") int page, @Param("userid") String userid);
}
