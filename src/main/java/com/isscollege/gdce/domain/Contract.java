package com.isscollege.gdce.domain;

public class Contract
{
	// 主键
	private long id;
	// 合同编号
	private long contractId;
	// 买方编号
	private String buyerCompanyId;
	//卖方编号
	private String sellerCompanyId;
	//商品编号
	private long productId;
	//买方合同状态(true-已签 false-未签)
	private boolean buyerContractState;
	//卖方合同状态(true-已签 false-未签)
	private boolean sellerContractState;
	//创建时间
	private String createDate;
	//结束时间
	private String endDate;

	public Contract()
	{
	}

	public long getId()
	{
		return id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public long getContractId()
	{
		return contractId;
	}

	public void setContractId(long contractId)
	{
		this.contractId = contractId;
	}

	public String getBuyerCompanyId()
	{
		return buyerCompanyId;
	}

	public void setBuyerCompanyId(String buyerCompanyId)
	{
		this.buyerCompanyId = buyerCompanyId;
	}

	public String getSellerCompanyId()
	{
		return sellerCompanyId;
	}

	public void setSellerCompanyId(String sellerCompanyId)
	{
		this.sellerCompanyId = sellerCompanyId;
	}

	public long getProductId()
	{
		return productId;
	}

	public void setProductId(long productId)
	{
		this.productId = productId;
	}

	public boolean isBuyerContractState()
	{
		return buyerContractState;
	}

	public void setBuyerContractState(boolean buyerContractState)
	{
		this.buyerContractState = buyerContractState;
	}

	public boolean isSellerContractState()
	{
		return sellerContractState;
	}

	public void setSellerContractState(boolean sellerContractState)
	{
		this.sellerContractState = sellerContractState;
	}

	public String getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}


}
