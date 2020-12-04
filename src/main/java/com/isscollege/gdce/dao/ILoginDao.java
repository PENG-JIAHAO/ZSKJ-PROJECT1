package com.isscollege.gdce.dao;

import com.isscollege.gdce.domain.User;

public interface ILoginDao
{
	User queryUserByName(String name);
}
