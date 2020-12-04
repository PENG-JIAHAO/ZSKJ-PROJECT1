package com.isscollege.gdce.model.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IRegisterModel;
import com.isscollege.gdce.service.IRegisterService;

@Component
public class RegisterModelImpl implements IRegisterModel
{
	private static final Logger LOGGER = Logger.getLogger(RegisterModelImpl.class);
	@Autowired
	private IRegisterService service;

	public RegisterModelImpl()
	{
	}

	public void setService(IRegisterService service)
	{
		this.service = service;
	}

	@Override
	public boolean companyTx(Company company, User user)
	{
		return service.registerCompanyTx(company, user);
	}

	@Override
	public boolean addUser(User user)
	{
		return service.addUser(user);
	}

	@Override
	public boolean updateUserloginstateByName(User user)
	{
		return service.updateUserloginstateByName(user);
	}

	@Override
	public boolean addCompany(Company company)
	{
		return service.addCompany(company);
	}

	@Override
	public boolean ajaxValidateLoginname(String name)
	{
		return service.ajaxValidateLoginname(name);
	}

	@Override
	public boolean ajaxValidateCompanyId(String companyId)
	{
		return service.ajaxValidateCompanyId(companyId);
	}

	@Override
	public boolean addManager(User user)
	{
		return service.addManager(user);
	}

	@Override
	public List<User> queryManager()
	{
		return service.queryManager();
	}

	@Override
	public boolean deleteManager(String id)
	{
		return service.deleteManager(id);
	}

	@Override
	public boolean updateCompany(Company company, String companyId)
	{
		return service.updateCompanyByCompany(company, companyId);
	}

	@Override
	public boolean ajaxValidateUsername(String username)
	{
		return service.ajaxValidateUsername(username);
	}

	@Override
	public boolean ajaxValidatePhoneNumber(String phoneNumber)
	{
		return service.ajaxValidatePhoneNumber(phoneNumber);
	}

	@Override
	public boolean ajaxValidateEmail(String email)
	{
		return service.ajaxValidateEmail(email);
	}

	@Override
	public boolean updateAccountant(Company company, String accountantName)
	{
		return service.updateAccountant(company, accountantName);
	}

	@Override
	public boolean addAccountant(Company company)
	{
		return service.addAccountant(company);
	}

	@Override
	public boolean saveEnterpriseQualification(Company company, String companyId)
	{
		return service.saveEnterpriseQualification(company, companyId);
	}

	@Override
	public Company queryCompanyByCompanyID(String number)
	{
		return service.queryCompanyByCompanyID(number);
	}

	@Override
	public boolean findcompanyId(String companyId)
	{
		return service.findcompanyId(companyId);
	}
	@Override
	public List<User> getMUserList(int offset, int limit, String sort, String order) {
		return service.getMUserList(offset, limit, sort, order);
	}

	@Override
	public int getMUserListTotal(String sort, String order) {
		return service.getMUserListTotal(sort, order);
	}
}
