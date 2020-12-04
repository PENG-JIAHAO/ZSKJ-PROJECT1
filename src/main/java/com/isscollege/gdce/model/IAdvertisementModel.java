package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.Advertisement;

public interface IAdvertisementModel
{
	// 向数据库添加一条Advertisement记录
	int addAdvertisement(Advertisement ad);
	public void updatemessage(Advertisement ad);
	List<Advertisement> getAdvertisment(int reviewState);
	Advertisement getAdsInfo(int id);
}
