package com.isscollege.gdce.domain;

public class Company
{
	// 企业机构代码
	private String companyId = "";
	// 企业名称
	private String companyName = "";
	// 法人
	private String legalPerson = "";
	// 法人身份证号
	private String legalPersonId = "";
	// 会计姓名
	private String accountantName = "";
	// 公司注册地址
	private String companyAddress = "";
	// 公司邮箱
	private String companyEmail = "";
	// 传真
	private String companyFax = "";
	// 邮政编码
	private String postalCode = "";
	// 注册资金
	private float registerMoney = 0.0f;
	// 经营许可证
	private String bussionLicense = "";
	// 税务登记号
	private String taxRegisterId = "";
	// 开户银行
	private String openBank = "";
	// 煤源存放地
	private String goodsAddress = "";
	// 运输方式保证能力
	private String transportStyle = "";
	//公司简介
	private String companyProfile = "";
	// 税务登记证照片存放路径（/imgs/taxRegisterCode/税务登记证+时间戳）
	private String taxRegisterCodePath = "";
	// 组织机构代码照片存放路径（/imgs/companyCode/企业机构代码+时间戳）
	private String companyCodePath = "";
	// 开户银行许可证照片存放路径（/imgs/bankAccountCode/开户银行许可证+时间戳）
	private String bankAccountCodePath = "";
	// 法人身份证照片存放路径（/imgs/legalPersonCode/法人身份证+时间戳）
	private String legalPersonCodePath = "";
	// 经营许可证照片存放路径（/imgs/bussionLicenseCode/经营许可证+时间戳）
	private String bussionLicenseCodePath = "";
	// 联系方式
	private String phoneNumber = "";
	// 银行账户
	private String bankAccount = "";
	// 营业执照
	private String openLicenseId = "";
	// 营业执照存放路径（/imgs/openLicense/企业机构代码+时间戳）
	private String openLicensePath = "";
	// 审核状态 0-待审核 1-通过 2-未通过
	private int reviewState = 0;
	// 会计电话
	private String phone = "";
	// 会计邮箱
	private String email = "";
	//审核提交时间
	private String submitDate = "";
	//记录编号
	private String recordID = "";
	//审核建议
	private String recordAdvice = "";

	public String getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(String companyId)
	{
		this.companyId = companyId;
	}

	public String getLegalPerson()
	{
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson)
	{
		this.legalPerson = legalPerson;
	}

	public String getLegalPersonId()
	{
		return legalPersonId;
	}

	public void setLegalPersonId(String legalPersonId)
	{
		this.legalPersonId = legalPersonId;
	}

	public String getCompanyAddress()
	{
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress)
	{
		this.companyAddress = companyAddress;
	}

	public String getCompanyEmail()
	{
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail)
	{
		this.companyEmail = companyEmail;
	}

	public String getCompanyFax()
	{
		return companyFax;
	}

	public void setCompanyFax(String companyFax)
	{
		this.companyFax = companyFax;
	}

	public String getPostalCode()
	{
		return postalCode;
	}

	public void setPostalCode(String postalCode)
	{
		this.postalCode = postalCode;
	}

	public float getRegisterMoney()
	{
		return registerMoney;
	}

	public void setRegisterMoney(float registerMoney)
	{
		this.registerMoney = registerMoney;
	}

	public String getBussionLicense()
	{
		return bussionLicense;
	}

	public void setBussionLicense(String bussionLicense)
	{
		this.bussionLicense = bussionLicense;
	}

	public String getTaxRegisterId()
	{
		return taxRegisterId;
	}

	public void setTaxRegisterId(String taxRegisterId)
	{
		this.taxRegisterId = taxRegisterId;
	}

	public String getOpenBank()
	{
		return openBank;
	}

	public void setOpenBank(String openBank)
	{
		this.openBank = openBank;
	}

	public String getGoodsAddress()
	{
		return goodsAddress;
	}

	public void setGoodsAddress(String goodsAddress)
	{
		this.goodsAddress = goodsAddress;
	}

	public String getTransportStyle()
	{
		return transportStyle;
	}

	public void setTransportStyle(String transportStyle)
	{
		this.transportStyle = transportStyle;
	}

	public String getTaxRegisterCodePath()
	{
		return taxRegisterCodePath;
	}

	public void setTaxRegisterCodePath(String taxRegisterCodePath)
	{
		this.taxRegisterCodePath = taxRegisterCodePath;
	}

	public String getCompanyCodePath()
	{
		return companyCodePath;
	}

	public void setCompanyCodePath(String companyCodePath)
	{
		this.companyCodePath = companyCodePath;
	}

	public String getBankAccountCodePath()
	{
		return bankAccountCodePath;
	}

	public void setBankAccountCodePath(String bankAccountCodePath)
	{
		this.bankAccountCodePath = bankAccountCodePath;
	}

	public String getLegalPersonCodePath()
	{
		return legalPersonCodePath;
	}

	public void setLegalPersonCodePath(String legalPersonCodePath)
	{
		this.legalPersonCodePath = legalPersonCodePath;
	}

	public String getBussionLicenseCodePath()
	{
		return bussionLicenseCodePath;
	}

	public void setBussionLicenseCodePath(String bussionLicenseCodePath)
	{
		this.bussionLicenseCodePath = bussionLicenseCodePath;
	}

	public String getPhoneNumber()
	{
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}

	public String getBankAccount()
	{
		return bankAccount;
	}

	public void setBankAccount(String bankAccount)
	{
		this.bankAccount = bankAccount;
	}

	public String getOpenLicenseId()
	{
		return openLicenseId;
	}

	public void setOpenLicenseId(String openLicenseId)
	{
		this.openLicenseId = openLicenseId;
	}

	public String getOpenLicensePath()
	{
		return openLicensePath;
	}

	public void setOpenLicensePath(String openLicensePath)
	{
		this.openLicensePath = openLicensePath;
	}

	public int getReviewState()
	{
		return reviewState;
	}

	public void setReviewState(int reviewState)
	{
		this.reviewState = reviewState;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getCompanyProfile()
	{
		return companyProfile;
	}

	public void setCompanyProfile(String companyProfile)
	{
		this.companyProfile = companyProfile;
	}

	public String getAccountantName()
	{
		return accountantName;
	}

	public void setAccountantName(String accountantName)
	{
		this.accountantName = accountantName;
	}

	public String getCompanyName()
	{
		return companyName;
	}

	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}

	public void setSubmitDate(String submitDate) { this.submitDate = submitDate; }

	public String getRecordID() {return recordID;}

	public void setRecordID(String recordID) { this.recordID = recordID; }

	public void setRecordAdvice(String recordAdvice){this.recordAdvice=recordAdvice;}

	public String getReviewAdvice() { return  recordAdvice; }


}
