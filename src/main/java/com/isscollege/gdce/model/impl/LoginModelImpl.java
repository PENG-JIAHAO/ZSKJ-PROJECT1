package com.isscollege.gdce.model.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.ILoginModel;
import com.isscollege.gdce.service.ILoginService;

import java.util.List;

@Component
public class LoginModelImpl implements ILoginModel
{
	private static final Logger LOGGER = Logger.getLogger(LoginModelImpl.class);
	@Autowired
	private ILoginService service = null;

	public LoginModelImpl()
	{
	}

	public void setService(ILoginService service)
	{
		this.service = service;
	}

	@Override
	public User login(User user)
	{
		return service.login(user);
	}

	@Override
	public boolean logout(User user)
	{
		return service.logout(user);
	}

	@Override
	public boolean ajaxValidateLoginname(String name)
	{
		return service.ajaxValidateLoginname(name);
	}

	@Override
	public boolean ajaxValidateLoginpassword(String name, String password)
	{
		return service.ajaxValidateLoginpassword(name, password);
	}

	@Override
	public boolean ajaxValidateLoginState(String name)
	{
		return service.ajaxValidateLoginState(name);
	}

	@Override
	public Company queryCompanyByCompanyID(String companyId)
	{
		return service.queryCompanyByCompanyID(companyId);
	}

	@Override
	public Company queryAccountantByAccountantName(String accountantName)
	{
		return service.queryAccountantByAccountantName(accountantName);
	}

	@Override
	public List<User> getRememberMeUser() {
		return service.getRememberMeUser();
	}
}
