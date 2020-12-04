package com.isscollege.gdce.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.IUserDao;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.service.ILoginService;

@Service
public class LoginServiceImpl implements ILoginService
{
	private static final Logger LOGGER = Logger.getLogger(LoginServiceImpl.class);
	@Autowired
	private IUserDao iUserDao = null;

	public LoginServiceImpl()
	{
	}

	public void setiUserDao(IUserDao iUserDao)
	{
		this.iUserDao = iUserDao;
	}

	@Override
	public User login(User user)
	{

		User loginUser = iUserDao.queryUserByName(user.getName());
		if ((loginUser != null) && (loginUser.getPassword().equals(user.getPassword())))
		{
			loginUser = iUserDao.queryUserByName(user.getName());
		}

		return loginUser;
	}

	@Override
	public boolean logout(User user)
	{

		return iUserDao.updateUserloginstateByName(user) != 0;

	}

	// 登录用户名验证
	@Override
	public boolean ajaxValidateLoginname(String name)
	{

		// 修改内容：去掉getname()
		return (iUserDao.ajaxValidateLoginname(name) != null);

	}

	@Override
	public boolean ajaxValidateLoginpassword(String name, String password)
	{

		Map praMap = new HashMap();
		praMap.put("name", name);
		praMap.put("password", password);
		return (iUserDao.ajaxValidateLoginpassword(praMap) != null);

	}

	@Override
	public boolean ajaxValidateLoginState(String name)
	{
		return (iUserDao.ajaxValidateLoginState(name) != null);
	}

	@Override
	public Company queryCompanyByCompanyID(String companyId)
	{
		Company company = iUserDao.queryCompanyByCompanyID(companyId);
		return company == null ? new Company() : company;
	}

	@Override
	public Company queryAccountantByAccountantName(String accountantName)
	{
		return iUserDao.queryAccountantByAccountantName(accountantName);
	}

	@Override
	public List<User> getRememberMeUser() {
		return iUserDao.queryUserByRemember();
	}
}
