package com.isscollege.gdce.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.isscollege.gdce.domain.*;
import com.isscollege.gdce.model.ILoginModel;
import com.isscollege.gdce.model.IReviewModel;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController
{
    private static final Logger LOGGER = Logger.getLogger(LoginController.class);
    private static final long serialVersionUID = 1L;
    private final int SUPER_ADMIN = 0;
    private final String CONSULT_EDIT = "4";
    private final String REGISTER_AUDIT = "6";
    private final String CONSULT_AUDIT = "5";
    private final String TRADE_AUDIT = "7";
    private final String ADVERTISEMENT_AUDIT = "8";

    @Autowired
    private ILoginModel loginModel = null;

    @Autowired
    private IReviewModel reviewModel;

    @RequestMapping("/login")
    protected void doLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException
    {


        String name = StringUtils.defaultString(request.getParameter("name"));
        String password = StringUtils.defaultString(request.getParameter("password"));
        String cookieRememberUsernameStateFlag = StringUtils.defaultString(request.getParameter("rememberMe"));

        if (cookieRememberUsernameStateFlag.equals("on"))
        {

            Cookie userCookie = new Cookie("username", name);
            userCookie.setMaxAge(1 * 24 * 60 * 60);
            userCookie.setPath("/");
            response.addCookie(userCookie);
        }
        Map<String, String> loginForm = new HashMap<String, String>();
        loginForm.put("loginname", name);
        loginForm.put("loginpass", password);
        request.setAttribute("loginForm", loginForm);

        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setLoginState(true);

        Map<String, String> errors = new HashMap<String, String>();
        errors = validateLogin(request, request.getSession());
        if (errors.size() > 0)
        {
            request.setAttribute("errors", errors);
            try
            {
                request.getRequestDispatcher("/jsp/user/login.jsp").forward(request, response);
            }
            catch (ServletException | IOException e)
            {
                LOGGER.error("请求转发异常", e);
            }
            return;
        }
        Cookie cookie = new Cookie("JSESSIONID", URLEncoder.encode(request.getSession().getId(), "utf-8"));
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        cookie.setMaxAge(48 * 60 * 60);//2天
        response.addCookie(cookie);
        getLevelAndPermission(user, request, response, session);
    }

    /*
     * 获取登录的账号的level和permission
     */
    protected void getLevelAndPermission(User user, HttpServletRequest request, HttpServletResponse response,
                                         HttpSession session) throws ServletException, IOException
    {
        User loginUser = loginModel.login(user);
        session.setAttribute("currentUser", loginUser);
        String permission = loginUser.getPermission();
        if (loginUser.getPermission().equals(CONSULT_EDIT))
        {
            try
            {
                request.getRequestDispatcher("/news/adminPageBean?type=hgzc&&currentPage=1").forward(request, response);
            }
            catch (ServletException | IOException e)
            {
                LOGGER.error("请求转发异常", e);
            }
        }
        else if (permission.equals(ADVERTISEMENT_AUDIT) || permission.equals(CONSULT_AUDIT) || permission.equals(REGISTER_AUDIT) || permission.equals(TRADE_AUDIT) || loginUser.getLevel() == SUPER_ADMIN)
        {
            request.getRequestDispatcher("/manage").forward(request, response);

        }
        else
        {
            // 使用用户的企业机构代码获取用户公司对象
            String accountName = null;

            Company company = loginModel.queryCompanyByCompanyID(loginUser.getCompanyId());

            session.setAttribute("company", loginModel.queryCompanyByCompanyID(loginUser.getCompanyId()));

            Company company1 = null;

            company1 = loginModel.queryAccountantByAccountantName(accountName);

            session.setAttribute("company1", company1 != null ? company1 : new Company());
            try
            {
                response.sendRedirect(request.getContextPath());
            }
            catch (IOException e)
            {
                LOGGER.error("重定向异常", e);
            }
        }
    }

    protected void setDisplay(String s1, String s2, String s3, String s4, HttpSession session)
    {
        session.setAttribute(s1, "style='display:none'");
        session.setAttribute(s2, "style='display:none'");
        session.setAttribute(s3, "style='display:none'");
        session.setAttribute(s4, "style='display:0'");
    }

    @RequestMapping("/logout")
    protected String doLoginout(HttpSession session)
    {
        session.invalidate();
        return "index";
    }

    private Map<String, String> validateLogin(HttpServletRequest req, HttpSession session)
    {
        Map<String, String> errors = new HashMap<String, String>();
        /*
         * 1. 校验登录名
         */
        String loginname = StringUtils.defaultString(req.getParameter("name"));
        if (loginname.trim().isEmpty())
        {
            errors.put("loginname", "用户名不能为空！");
        }
        else if (!loginModel.ajaxValidateLoginname(loginname))
        {
            errors.put("loginname", "用户名不存在！");
        }
        /*
         * 2. 校验登录密码
         */
        String loginpass = StringUtils.defaultString(req.getParameter("password"));
        if (loginpass.trim().isEmpty())
        {
            errors.put("loginpass", "密码不能为空！");
        }
        else if (!loginModel.ajaxValidateLoginpassword(loginname, loginpass))
        {
            errors.put("loginpass", "密码不正确！");
        }

        String verifyCode = StringUtils.defaultString(req.getParameter("verifyCode"));
        String vcode = (String) session.getAttribute("vCode");
        if (verifyCode.trim().isEmpty())
        {
            errors.put("verifyCode", "验证码不能为空！");
        }
        else if (!verifyCode.equalsIgnoreCase(vcode))
        {
            errors.put("verifyCode", "验证码错误！");
        }
        return errors;
    }

    @RequestMapping("/getcheckedlist")
    public String checkListReview(@RequestParam(value = "param", defaultValue = "1") int param, Model model, HttpSession session)
    {
        User currentUser = (User) session.getAttribute("currentUser");
        String permission = currentUser.getPermission();
        if (permission.equals(CONSULT_AUDIT))
        {
            PageHelper.startPage(param, 10);
            List<News> allNewsList = reviewModel.getAllNewsInfo();
            PageInfo<News> info = new PageInfo<>(allNewsList);
            model.addAttribute("pageinfo", info);
        }
        else if (permission.equals(REGISTER_AUDIT))
        {
            PageHelper.startPage(param, 10);
            List<Company> allCompanyList = reviewModel.getAllCompany();
            PageInfo<Company> info = new PageInfo<>(allCompanyList);
            model.addAttribute("pageinfo", info);
        }
        else if (permission.equals(TRADE_AUDIT))
        {
            PageHelper.startPage(param, 10);
            List<Product> allProductInfoList = reviewModel.getAllProductInfo();
            PageInfo<Product> info = new PageInfo<>(allProductInfoList);
            model.addAttribute("pageinfo", info);
        }
        return "review/review";
    }

    @GetMapping("/getRememberMeUser")
    public void getRememberMeUser(HttpSession session)
    {

        List<User> user = loginModel.getRememberMeUser();
        Map<String, String> map = new HashMap<>();
        for (User user1 : user)
        {
            map.put(user1.getName(), user1.getPassword());
        }
        session.setAttribute("map", map);
    }
}
