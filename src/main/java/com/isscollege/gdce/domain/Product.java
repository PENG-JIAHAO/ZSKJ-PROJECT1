package com.isscollege.gdce.domain;

import org.apache.commons.lang3.math.NumberUtils;

public class Product
{	
	private int id=0;
	private int productId;
	private int productState;
	private float quantity;
	private int lowPower;
	private float price;
	private float fullSulfur;
	private float fullMoisture;
	private String srcAddress;
	private String volatiles;
	private String userName;
	private int reviewState=0;
	private float carriage=0.0f;
	private String portAddress=null;
	private float dryPowder=0.0f;
	private String OffProductInfo=null;
	private String submitDate;
	private String recordID;
	public Product()
	{
		
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getProductId()
	{
		return productId;
	}

	public void setProductId(int productId)
	{
		this.productId = productId;
	}

	public int getProductState()
	{
		return productState;
	}

	public void setProductState(int productState)
	{
		this.productState = productState;
	}

	public float getQuantity()
	{
		return quantity;
	}

	public void setQuantity(float quantity)
	{
		this.quantity = quantity;
	}

	public int getLowPower()
	{
		return lowPower;
	}

	public void setLowPower(int lowPower)
	{
		this.lowPower = lowPower;
	}

	public float getPrice()
	{
		return price;
	}

	public void setPrice(float price)
	{
		this.price = price;
	}

	public float getFullSulfur()
	{
		return fullSulfur;
	}

	public void setFullSulfur(float fullSulfur)
	{
		this.fullSulfur = fullSulfur;
	}

	public String getSrcAddress()
	{
		return srcAddress;
	}

	public void setSrcAddress(String srcAddress)
	{
		this.srcAddress = srcAddress;
	}

	public float getFullMoisture()
	{
		return fullMoisture;
	}

	public void setFullMoisture(float fullMoisture)
	{
		this.fullMoisture = fullMoisture;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getVolatiles()
	{
		return volatiles;
	}

	public void setVolatiles(String volatiles)
	{
		this.volatiles = volatiles;
	}

	public int getReviewState()
	{
		return reviewState;
	}

	public void setReviewState(int reviewState)
	{
		this.reviewState = reviewState;
	}

	public float getCarriage()
	{
		return carriage;
	}

	public void setCarriage(float carriage)
	{
		this.carriage = carriage;
	}

	public String getPortAddress()
	{
		return portAddress;
	}

	public void setPortAddress(String portAddress)
	{
		this.portAddress = portAddress;
	}

	public float getDryPowder()
	{
		return dryPowder;
	}

	public void setDryPowder(float dryPowder)
	{
		this.dryPowder = dryPowder;
	}

	public void setOffProductInfo(String offProductInfo) {
	    	this.OffProductInfo = offProductInfo;
	}

	public String getOffProductInfo() {
		return OffProductInfo;
	}

	public void setSubmitDate(String submitDate){ this.submitDate=submitDate; }

	public void setRecordID(String recordID) { this.recordID = recordID; }

	public String getRecordID() { return recordID; }

	public String getSubmitDate() { return submitDate; }
}
