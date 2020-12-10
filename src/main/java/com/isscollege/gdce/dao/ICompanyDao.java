package com.isscollege.gdce.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	List<Company> getCompanyList(@Param("reviewState")int reviewState,@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

	List<Company> getAllCompanyList(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

	int getCompanyInfoListTotal(@Param("reviewState")int reviewState,@Param("sort")String sort,@Param("order")String order);

	public boolean save(Company company);

	public boolean update(Company company);

	String getCompanyRecordIdByCompanyId(String companyId);

	int deleteSelect(String companyId);
}
