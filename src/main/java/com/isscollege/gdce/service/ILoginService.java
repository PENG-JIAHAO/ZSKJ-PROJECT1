package com.isscollege.gdce.service;

import com.isscollege.gdce.domain.User;

import com.isscollege.gdce.domain.Company;

import java.util.List;

public interface ILoginService
{
	User login(User user);

	boolean logout(User user);

	boolean ajaxValidateLoginname(String name);

	boolean ajaxValidateLoginpassword(String name, String password);

	public boolean ajaxValidateLoginState(String name);

	Company queryCompanyByCompanyID(String companyId);

	Company queryAccountantByAccountantName(String accountantName);

	List<User> getRememberMeUser();
}
