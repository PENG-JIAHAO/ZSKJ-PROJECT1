package com.isscollege.gdce.domain;

public class Order
{	private int id;
	// 订单号(时间戳+卖家企业机构代码编号后四位：2018080110034455)
	private String orderId;
	// 交易金额
	private float tradePrice;
	// 商品编号
	private int productId;
	// 买方编号（对应企业编号）
	private String buyerCompanyId;
	// 卖方编号（对应企业编号）
	private String sellerCompanyId;
	// 订单状态（0-代付款 1-代发货 2-待收货 3-待验收 4-完成）
	private int orderState;
	// 回执单存放路径（/imgs/order/receipt/买家编号（后四位）+订单编号
	private String receiptPath;
	// 创建时间
	private String createDate;
	// 结束时间（默认15个工作日）
	private String endDate;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getOrderId()
	{
		return orderId;
	}

	public void setOrderId(String orderId)
	{
		this.orderId = orderId;
	}

	public float getTradePrice()
	{
		return tradePrice;
	}

	public void setTradePrice(float tradePrice)
	{
		this.tradePrice = tradePrice;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
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

	public int getOrderState() { return orderState; }

	public void setOrderState(int orderState) { this.orderState = orderState; }

	public String getReceiptPath()
	{
		return receiptPath;
	}

	public void setReceiptPath(String receiptPath)
	{
		this.receiptPath = receiptPath;
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
