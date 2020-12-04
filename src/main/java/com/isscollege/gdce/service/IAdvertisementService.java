package com.isscollege.gdce.service;

import java.util.List;

import com.isscollege.gdce.domain.Advertisement;
import org.apache.ibatis.annotations.Param;

public interface IAdvertisementService
{
	int addAdvertisement(Advertisement ad);
	void updatemessage(Advertisement ad);
	List<Advertisement> queryAdvertisementByState(int reviewState);
	Advertisement getAdsInfo(int id);
	int deleteAdsInfo(int id);
	Advertisement getInfoByCompanyId(String companyId);
}
