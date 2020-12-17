package com.isscollege.gdce.dao;

import java.util.List;

import com.isscollege.gdce.domain.User;
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

	//��������̱�
	List<Company> getCompanyInfo(@Param("groupNum")int groupNum,@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
	//������о����̱�
	List<Company> getAllCompanyInfo(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
	//��������̱�����
	int getCompanyInfoListTotal(@Param("groupNum")int groupNum,@Param("sort")String sort,@Param("order")String order);
	//������о������豸����
	int getAllCompanyInfoListTotal(@Param("sort")String sort,@Param("order")String order);

	public boolean save(Company company);

	public boolean update(Company company);

	String getCompanyRecordIdByCompanyId(String companyId);

	int deleteCompany(String company_Id);

	int addNewCompany(Company newcompany);
}
