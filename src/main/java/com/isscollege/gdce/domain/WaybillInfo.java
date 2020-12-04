package com.isscollege.gdce.domain;

public class WaybillInfo
{
	// 运单号
	private String waybillId;
	// 企业机构代码
	private String waybillCompanyId;
	// 创建时间
	private String createTime;
	// 结束时间
	private String endTime;
	// 订单号
	private String orderId;
	// 运单状态
	private String waybillState;

	public String getWaybillId()
	{
		return waybillId;
	}

	public void setWaybillId(String waybillId)
	{
		this.waybillId = waybillId;
	}

	public String getWaybillCompanyId()
	{
		return waybillCompanyId;
	}

	public void setWaybillCompanyId(String waybillCompanyId)
	{
		this.waybillCompanyId = waybillCompanyId;
	}

	public String getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(String createTime)
	{
		this.createTime = createTime;
	}

	public String getEndTime()
	{
		return endTime;
	}

	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}

	public String getOrderId()
	{
		return orderId;
	}

	public void setOrderId(String orderId)
	{
		this.orderId = orderId;
	}

	public String getWaybillState()
	{
		return waybillState;
	}

	public void setWaybillState(String waybillState)
	{
		this.waybillState = waybillState;
	}

}
