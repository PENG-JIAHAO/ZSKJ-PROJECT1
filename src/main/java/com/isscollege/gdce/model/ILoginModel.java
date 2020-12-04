package com.isscollege.gdce.model;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;

import java.util.List;

public interface ILoginModel
{
	User login(User user);

	boolean logout(User user);

	boolean ajaxValidateLoginname(String name);

	boolean ajaxValidateLoginpassword(String name, String password);

	boolean ajaxValidateLoginState(String name);

	Company queryCompanyByCompanyID(String companyId);

	Company queryAccountantByAccountantName(String accountantName);

	List<User> getRememberMeUser();
}
