package com.isscollege.gdce.dao;

import java.util.List;

import com.isscollege.gdce.domain.User;
import org.apache.ibatis.annotations.Param;
import com.isscollege.gdce.domain.Shop;
import com.isscollege.gdce.domain.Company;

public interface ICompanyDao
{
	void updateCompanyReviewState(@Param("curStats") int curStats, @Param("companyId") String companyId);

	void updateCompanyRecordID(@Param("recordId") String recordId, @Param("companyId") String companyId);

	List<Company> queryCompanyByReviewState(@Param("page") int page, @Param("size") int size);

	List<Company> getAllCompanyInfo();

	List<Company> queryCompanyByReviewStatenotpass(@Param("page") int page, @Param("size") int size);

	List<Company> queryCompanyByState(@Param("reviewState")int reviewState,@Param("page")int page,@Param("size")int size);

	Company queryCompanyByCompanyID(String companyId);

	//浏览经销商表
	List<Company> getCompanyInfo(@Param("groupNum")int groupNum,@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
	//浏览所有经销商表
	List<Company> getAllCompanyInfo(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
	//浏览经销商表总数
	int getCompanyInfoListTotal(@Param("groupNum")int groupNum,@Param("sort")String sort,@Param("order")String order);
	//浏览所有经销商设备总数
	int getAllCompanyInfoListTotal(@Param("sort")String sort,@Param("order")String order);
	//删除经销商
	int deleteCompany(String company_Id);
	//新增经销商
	int addNewCompany(Company newcompany);

	public boolean save(Company company);

	public boolean update(Company company);

	String getCompanyRecordIdByCompanyId(String companyId);

	//浏览设备使用商表
	List<Shop> getShopInfo(@Param("groupNum")int groupNum,@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
	//浏览所有设备使用商表
	List<Shop> getAllShopInfo(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
	//浏览设备使用商表总数
	int getShopInfoListTotal(@Param("groupNum")int groupNum,@Param("sort")String sort,@Param("order")String order);
	//浏览所有设备使用商设备总数
	int getAllShopInfoListTotal(@Param("sort")String sort,@Param("order")String order);
	//删除设备使用商
	int deleteShop(String shop_id);
	//新增设备使用商
	int addNewShop(Shop newshop);



}
