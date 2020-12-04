package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.ILoginModel;
import org.easymock.EasyMock;

import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;


public class LoginControllerTest
{
    private User user = null;
    private LoginController controller = null;
    private ILoginModel iLoginModel = null;
    private MockHttpServletRequest request = null;
    private MockHttpSession session = null;
    private MockHttpServletResponse response = null;

    @Before
    public void setUp() throws Exception
    {
        response = new MockHttpServletResponse();
        session = new MockHttpSession();
        request = new MockHttpServletRequest();
        controller = new LoginController();
        request.setSession(session);
        //创建代理对象（模拟对象行为）
        iLoginModel = EasyMock.createMock(ILoginModel.class);
        //通过反射机制动态注入bean对象
        ReflectionTestUtils.setField(controller, "loginModel", iLoginModel);
    }

    @Test
    public void should_doLogin_is_success_when_name_is_admin_and_password_is_admin_and_verifyCode_is_dog() throws ServletException, IOException
    {
        //录入行为
        user = new User("admin", "admin", true);
        user.setPermission("4");
        request.setCharacterEncoding("UTF-8");
        request.setParameter("name", "admin");
        request.setParameter("password", "admin");
        request.setParameter("verifyCode", "dog");
        session.setAttribute("vCode", "dog");
        EasyMock.expect(iLoginModel.ajaxValidateLoginname(request.getParameter("name"))).andReturn(true);
        EasyMock.expect(iLoginModel.ajaxValidateLoginpassword(request.getParameter("name"),
                request.getParameter("password"))).andReturn(true);
        EasyMock.expect(iLoginModel.login(EasyMock.isA(User.class)))
                .andReturn(user);
        //记录回放
        EasyMock.replay(iLoginModel);
        controller.doLogin(request, response, session);
        //执行业务逻辑
        EasyMock.verify(iLoginModel);
        //结果有效性检验
        assertNull(request.getAttribute("errors"));
    }

    @Test
    public void should_doLoginout_is_success() throws ServletException, IOException
    {
        assertEquals("index", controller.doLoginout(session));
    }

    @Test
    public void should_doLogin_failed_when_username_is_null_and_password_is_null_and_verify_code_is_null() throws Exception
    {
        user = new User("admin", "admin", true);
        request.setCharacterEncoding("UTF-8");
        session.setAttribute("vCode", "code");
        controller.doLogin(request, response, session);
        Map<String, String> errorsMap = (HashMap<String, String>) request.getAttribute("errors");
        assertEquals(3, errorsMap.size());
        assertEquals("用户名不能为空！", errorsMap.get("loginname"));
        assertEquals("密码不能为空！", errorsMap.get("loginpass"));
        assertEquals("验证码不能为空！", errorsMap.get("verifyCode"));
    }

    @Test
    public void should_doLogin_failed_when_username_not_exists_and_password_is_wrong_and_verify_code_is_wrong() throws Exception
    {
        user = new User("admin", "admin", true);
        request.setCharacterEncoding("UTF-8");
        request.setParameter("name", "wrongname");
        request.setParameter("password", "wrongpassword");
        request.setParameter("verifyCode", "wrongcode");
        session.setAttribute("vCode", "code");
        EasyMock.expect(iLoginModel.ajaxValidateLoginname(request.getParameter("name"))).andReturn(false);
        EasyMock.expect(iLoginModel.ajaxValidateLoginpassword(request.getParameter("name"), request.getParameter("password"))).andReturn(false);
        EasyMock.replay(iLoginModel);
        controller.doLogin(request, response, session);
        EasyMock.verify(iLoginModel);
        Map<String, String> errorsMap = (HashMap<String, String>) request.getAttribute("errors");
        assertEquals(3, errorsMap.size());
        assertEquals("用户名不存在！", errorsMap.get("loginname"));
        assertEquals("密码不正确！", errorsMap.get("loginpass"));
        assertEquals("验证码错误！", errorsMap.get("verifyCode"));
    }

    @Test
    public void should_doLogin_failed_and_username_saved_when_username_is_correct_and_password_is_wrong_and_verify_code_is_right_and_isremember_is_true() throws Exception
    {
        user = new User("admin", "admin", true);
        request.setCharacterEncoding("UTF-8");
        request.setParameter("name", "admin");
        request.setParameter("password", "wrongpassword");
        request.setParameter("rememberMe", "on");
        request.setParameter("verifyCode", "code");
        session.setAttribute("vCode", "code");
        EasyMock.expect(iLoginModel.ajaxValidateLoginname(request.getParameter("name"))).andReturn(true);
        EasyMock.expect(iLoginModel.ajaxValidateLoginpassword(request.getParameter("name"), request.getParameter("password"))).andReturn(false);
        EasyMock.replay(iLoginModel);
        controller.doLogin(request, response, session);
        EasyMock.verify(iLoginModel);
        Map<String, String> errorsMap = (HashMap<String, String>) request.getAttribute("errors");
        assertEquals(1, errorsMap.size());
        assertEquals("密码不正确！", errorsMap.get("loginpass"));
        assertNotNull(response.getCookie("username"));
        assertEquals(request.getParameter("name"), response.getCookie("username").getValue());
    }

}
