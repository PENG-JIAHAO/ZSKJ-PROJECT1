package com.isscollege.gdce.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;

@Repository
public interface IUserDao
{
	User queryUserByName(String name);

	User queryUserByCompanyId(String companyId);

	int insertUser(User user);

	int insertCompany(Company company);

	User ajaxValidateLoginname(String name);

	Company ajaxValidateCompanyId(String companyId);

	User ajaxValidateLoginpassword(Map parMap);

	User ajaxValidateLoginState(String name);

	int updateUserloginstateByName(User user);

	List<User> queryManager();

	int addManager(User manager);

	int deleteManager(String id);

	int queryLevelById(String id);

	Company queryCompanyByCompanyID(String Companyid);

	User ajaxValidateUsername(String username);

	User ajaxValidatePhoneNumber(String phoneNumber);

	User ajaxValidateEmail(String email);

	User queryUserByUserName(String username);

	User queryUserByPhonenumber(String phonenumber);

	User queryUserByEmail(String email);

	int updateAccountant(Map parMap);

	int addAccountant(Company company);

	int saveEnterpriseQualification(Map parMap);

	int updateCompany(Map parMap);

	Company queryAccountantByAccountantName(String accountantName);

	Company findcompanyId(String companyId);

    List<User> queryUserByRemember();
	List<User> getMUserInfoList(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

	int getMUserInfoListTotal(@Param("sort")String sort,@Param("order")String order);
}
