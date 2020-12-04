package com.isscollege.gdce.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.isscollege.gdce.dao.IUserDao;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.service.IRegisterService;

@Service
public class RegisterServiceImpl implements IRegisterService
{
	private static final Logger LOGGER = Logger.getLogger(RegisterServiceImpl.class);
	@Autowired
	private IUserDao iUserDao;

	public RegisterServiceImpl()
	{
	}

	public void setiUserDao(IUserDao iUserDao)
	{
		this.iUserDao = iUserDao;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor =
			{ Exception.class })
	public boolean registerCompanyTx(Company company, User user)
	{
		boolean result = false;
		try
		{
			int insertcompany = iUserDao.insertCompany(company);
			int addaccountant = iUserDao.addAccountant(company);
			int updateUser = iUserDao.updateUserloginstateByName(user);
			if (updateUser == 0)
			{
				throw new RuntimeException("企业信息更新失败");
			}
			result = (insertcompany == 0 || addaccountant == 0);
		} catch (Exception e)
		{
			LOGGER.info("企业信息更新失败", e);
			throw new RuntimeException("企业信息更新失败");
		}
		return result;
	}

	@Override
	public boolean addCompany(Company company)
	{
		return iUserDao.insertCompany(company) != 0;

	}

	@Override
	public boolean addUser(User user)
	{
		return iUserDao.insertUser(user) != 0;
	}

	@Override
	public boolean updateUserloginstateByName(User user)
	{
		return iUserDao.updateUserloginstateByName(user) != 0;
	}

	@Override
	public boolean ajaxValidateLoginname(String name)
	{
		return (iUserDao.ajaxValidateLoginname(name) == null);
	}

	@Override
	public boolean ajaxValidateCompanyId(String companyId)
	{

		return iUserDao.ajaxValidateCompanyId(companyId) != null;
	}

	@Override
	public boolean addManager(User user)
	{
		boolean result = false;
		if (iUserDao.queryUserByName(user.getName()) == null)
		{
			result = iUserDao.addManager(user) != 0;
		}
		return result;
	}

	@Override
	public List<User> queryManager()
	{
		return iUserDao.queryManager();
	}

	@Override
	public int queryLevelById(String id)
	{
		return iUserDao.queryLevelById(id);
	}

	@Override
	public boolean deleteManager(String id)
	{
		boolean result = false;
		int level = -1;
		level = iUserDao.queryLevelById(id);
		result = (level == -1 || level == 0 || level == 2 || level == 3 || level == 4) ? false
				: iUserDao.deleteManager(id) != 0;
		return result;
	}

	@Override
	public boolean updateCompanyByCompany(Company company, String companyId)
	{
		Map praMap = new HashMap();
		praMap.put("company", company);
		praMap.put("companyId", companyId);
		return iUserDao.updateCompany(praMap) != 0;
	}

	@Override
	public boolean ajaxValidateUsername(String username)
	{
		return (iUserDao.ajaxValidateUsername(username) == null);
	}

	@Override
	public boolean ajaxValidatePhoneNumber(String phoneNumber)
	{
		return iUserDao.ajaxValidatePhoneNumber(phoneNumber) == null;

	}

	@Override
	public boolean ajaxValidateEmail(String email)
	{

		return (iUserDao.ajaxValidateEmail(email) == null);
	}

	@Override
	public boolean updateAccountant(Company company, String accountantName)
	{
		Map praMap = new HashMap();
		praMap.put("company", company);
		praMap.put("accountantName", accountantName);
		return iUserDao.updateAccountant(praMap) != 0;
	}

	@Override
	public boolean addAccountant(Company company)
	{
		return iUserDao.addAccountant(company) != 0;
	}

	@Override
	public boolean saveEnterpriseQualification(Company company, String companyId)
	{
		Map praMap = new HashMap();
		praMap.put("company", company);
		praMap.put("companyId", companyId);
		return iUserDao.saveEnterpriseQualification(praMap) != 0;
	}

	@Override
	public Company queryCompanyByCompanyID(String number)
	{
		return iUserDao.queryCompanyByCompanyID(number);
	}

	@Override
	public boolean findcompanyId(String companyId)
	{
		return (iUserDao.findcompanyId(companyId) != null);
	}

	@Override
	public List<User> getMUserList(int offset, int limit, String sort, String order) {
		return iUserDao.getMUserInfoList(offset, limit, sort, order);
	}

	@Override
	public int getMUserListTotal(String sort, String orde) {
		return iUserDao.getMUserInfoListTotal(sort, orde);
	}
}
