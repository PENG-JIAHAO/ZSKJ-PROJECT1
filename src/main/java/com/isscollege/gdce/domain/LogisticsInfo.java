package com.isscollege.gdce.domain;

public class LogisticsInfo
{
	// 运单号
	private String waybillId;
	// 更新时间
	private String updateDate;
	// 提交人
	private String submitUser;
	// 地点
	private String location;
	// 内容
	private String content;

	public LogisticsInfo()
	{
	}

	public LogisticsInfo(String waybillId,String updateDate,
						 String submitUser,String location,String content)
	{
		this.waybillId = waybillId;
		this.updateDate = updateDate;
		this.submitUser = submitUser;
		this.location = location;
		this.content = content;
	}

	public void setWaybillId(String waybillId)
	{
		this.waybillId = waybillId;
	}

	public void setUpdateDate(String updateDate)
	{
		this.updateDate = updateDate;
	}

	public void setSubmitUser(String submitUser)
	{
		this.submitUser = submitUser;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getWaybillId()
	{
		return this.waybillId;
	}

	public String getUpdateDate()
	{
		return this.updateDate;
	}

	public String getSubmitUser()
	{
		return this.submitUser;
	}

	public String getLocation()
	{
		return this.location;
	}

	public String getContent()
	{
		return this.content;
	}
}
