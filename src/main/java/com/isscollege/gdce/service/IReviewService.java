package com.isscollege.gdce.service;

import java.util.List;

import com.isscollege.gdce.domain.*;
import org.apache.ibatis.annotations.Param;

public interface IReviewService
{
	List<Product> queryProductByReviewState(int page, int size);
	List<Product> queryProductByReviewStatenotpass(int page, int size);

	List<Product> queryProductByState(int reviewState,int page,int size);
	void updateProductReviewState(int productId, int proStats, int curStats);
	/*改动*/
	void updateProductRecordID(String recordId, int productId);

	List<Company> queryCompanyByReviewState(int page, int size);

	List<Company> queryCompanyByState(int reviewState,int page, int size);

	List<Company> queryCompanyByReviewStatenotpass(int page, int size);

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


	int getAdsInfoListTotal(int reviewState,String sort,String order);

	List<Product> getProductList( int reviewState,int offset,int limit, String sort,String order);

	int getProductInfoListTotal(int reviewState,String sort,String order);

	List<News> getNewsList(int reviewState,int offset, int limit, String sort, String order);

	int getNewsListTotal(int reviewState,String sort,String order);

	//浏览经销商表
	List<Company> getCompanyInfo(int groupNum,int offset, int limit, String sort, String order);
	//浏览经销商设备表
	List<equipment> getCompanyEquipment(String company_Id,int offset, int limit, String sort, String order);
	//浏览所有设备表
	List<equipment> getAllEquipment(int offset, int limit, String sort, String order);
	//浏览所以经销商表
	List<Company> getAllCompanyInfo(int offset, int limit, String sort, String order);
	//浏览经销商数量
	int getCompanyListTotal(int groupNum,String sort,String order);
	//浏览经销商设备数量
	int getCompanyEquipmentListTotal(String company_Id,String sort,String order);
	//浏览所有设备数量
	int getAllEquipmentListTotal(String sort,String order);
	//浏览所以经销商设备数量
	int getAllCompanyListTotal(String sort,String order);
	//删除经销商
	boolean deleteCompany(String company_Id);
	//新增经销商
	boolean addNewCompany(Company newcompany);


	//获取记录信息
	List<OperateRecord> selectOperateRecordByRecordID(String rid);
	//获取记录数量
	int getRecordInfoListTotal(String recordId, String sort, String order);
	//获取记录ID
	String getProductRecordIdByProductId(int productId);

	String getCompanyRecordIdByCompanyId(String companyId);

	int addOperateRecord(OperateRecord vr);

	News queryNewsByID(int Id);

	//浏览经销商表
	List<Shop> getShopInfo(int groupNum,int offset, int limit, String sort, String order);
	//浏览经销商设备表
	List<equipment> getShopEquipment(String shop_id,int offset, int limit, String sort, String order);
	//浏览所以经销商表
	List<Shop> getAllShopInfo(int offset, int limit, String sort, String order);
	//浏览经销商数量
	int getShopListTotal(int groupNum,String sort,String order);
	//浏览经销商设备数量
	int getShopEquipmentListTotal(String shop_id,String sort,String order);
	//浏览所以经销商设备数量
	int getAllShopListTotal(String sort,String order);
	//删除经销商
	boolean deleteShop(String shop_id);
	//新增经销商
	boolean addNewShop(Shop newshop);




}
