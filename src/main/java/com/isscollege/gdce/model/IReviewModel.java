package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.*;
import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.OperateRecord;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.jute.Record;

public interface IReviewModel
{
	List<Product> queryProductByReviewState(int page, int size);
	List<Product> queryProductByReviewStatenotpass(int page, int size);
	List<Product> queryProductByState(int reviewState,int page,int size);
	void updateProductReviewState(int productId, int proStats, int curStats);
	/*改动*/void updateProductRecordID(String recordId, int productId);

	List<Advertisement> queryAdvertisementByReviewState(int page, int size);
	List<Advertisement> queryAdvertisementByReviewStatenotpass(int page, int size);

	List<Advertisement> queryAdvertisementByState(int reviewState,int page,int size);

	void updateAdvertisementReviewState(int advertisementId, int curStats);
	void updateAdvertisementRecordId(int adId, String recordId);

	List<Company> queryCompanyByReviewState(int page, int size);
	List<Company> queryCompanyByReviewStatenotpass(int page, int size);
	List<Company> queryCompanyByState(int reviewState,int page,int size);
	void updateCompanyReviewState(int curStats, String companyId);
	void updateCompanyRecordID(String recordId, String companyId);

	List<News> queryNewsByReviewState(int page, int size);
	List<News> queryNewsByReviewStatenotpass(int page, int size);
	List<News> queryNewsByState(int reviewState,int page,int size);
	void updateNewsReviewState(int newsId, int curStats);
	void updateNewsRecordID(int newsId, String recordID);

	Company queryCompanyByCompanyID(String CompanyId);


	User queryUserByCompanyId(String companyId);

	List<News> getAllNewsInfo();

	List<Company> getAllCompany();

	List<Product> getAllProductInfo();

	List<Advertisement> getAllAdsInfo();

	List<Advertisement> getAdsInfoList(int reviewState,int offset, int limit, String sort, String order);

	int getAdsInfoListTotal(int reviewState,String sort,String order);

	List<Product> getProductList(int reviewState,int offset, int limit, String sort,  String order);

	int getProductInfoListTotal(int reviewState,String sort,String order);

	//获取recordid
	String getProductRecordIdByProductId(int productId);

	String getCompanyRecordIdByCompanyId(String companyId);
	//获取记录信息
	List<OperateRecord> selectOperateRecordByRecordID(String rid);
	//获取记录数量
	int getRecordInfoListTotal(String recordId, String sort, String order);

	List<News> getNewsList(int reviewState,int offset, int limit, String sort, String order);

	int getNewsListTotal(int reviewState,String sort,String order);

	List<Company> getCompanyList(int reviewState,int offset, int limit, String sort, String order);

	List<Company> getAllCompanyList(int offset, int limit, String sort, String order);

	int getCompanyListTotal(int reviewState,String sort,String order);

	int addOperateRecord(OperateRecord vr);

	News queryNewsByID(int Id);

	boolean deleteCompany(String companyId);

}
