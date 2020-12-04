package com.isscollege.gdce.domain;

public class Advertisement
{
	// 广告主键id
	private int id;
	// 企业机构代码
	private String companyId;
	// 广告位 1-4
	private int position;
	// 邮箱
	private String email;
	// 广告图片存放路径（/imgs/ads/企业机构代码+时间戳）
	private String adsImgPath;
	// 广告超链地址
	private String adsURL;
	// 备注
	private String note;
	// 广告投放时间时间
	private String releaseDate;
	// 广告截止时间
	private String endDate;
	// 金额
	private double price;
	// 广告审核状态 0-待审核 1-通过 2-未通过
	private int reviewState;
	// 各个属性的set和get
	private String submitDate;
	//审核提交时间
	private String recordID;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(String companyId)
	{
		this.companyId = companyId;
	}

	public int getPosition()
	{
		return position;
	}

	public void setPosition(int position)
	{
		this.position = position;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getAdsImgPath()
	{
		return adsImgPath;
	}

	public void setAdsImgPath(String adsImgPath)
	{
		this.adsImgPath = adsImgPath;
	}

	public String getAdsURL()
	{
		return adsURL;
	}

	public void setAdsURL(String adsURL)
	{
		this.adsURL = adsURL;
	}

	public String getNote()
	{
		return note;
	}

	public void setNote(String note)
	{
		this.note = note;
	}

	public String getReleaseDate()
	{
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate)
	{
		this.releaseDate = releaseDate;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}

	public double getPrice()
	{
		return price;
	}

	public void setPrice(double price)
	{
		this.price = price;
	}

	public int getReviewState()
	{
		return reviewState;
	}

	public void setReviewState(int reviewState)
	{
		this.reviewState = reviewState;
	}

	public void setSubmitDate(String submitDate) { this.submitDate = submitDate; }

	public void setRecordID(String recordID) { this.recordID = recordID; }

	public String getSubmitDate() { return submitDate; }

	public String getRecordID() { return recordID; }
}
