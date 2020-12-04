package com.isscollege.gdce.common.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.ILoginModel;

@Component
public class SessionListener implements HttpSessionListener
{
	@Autowired
	private ILoginModel model;

	public void sessionCreated(HttpSessionEvent se)
	{
		HttpSession session = se.getSession();
		session.setMaxInactiveInterval(1800);
	}

	public void sessionDestroyed(HttpSessionEvent se)
	{
		HttpSession session = se.getSession();
		User user = session.getAttribute("currentUser") == null ? new User()
				: (User) session.getAttribute("currentUser");
		boolean loginState = model.logout(user);
	}
}
