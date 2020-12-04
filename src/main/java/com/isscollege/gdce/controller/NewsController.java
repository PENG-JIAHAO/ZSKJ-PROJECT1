package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.NewsPageBean;
import com.isscollege.gdce.model.INewsModel;
import com.isscollege.gdce.util.RIDUtil;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * 咨询管理
 */

@Controller
@RequestMapping("/news")
public class NewsController
{
    private static final Logger LOGGER = Logger.getLogger(NewsController.class);
    @Autowired
    private INewsModel newsModel;
    private static final int CURRENT_COUNT = 8;
    private static final int currentPage = 1;
    public static final String MACROSCOPIC_POLICY = "hgzc";
    public static final String MARKET_ANALYSIS = "scfx";
    public static final String POWER_INDUSTRY = "dlhy";
    public static final String COAL_PRICE = "mtjg";
    public static final String NONE_CLASS = "none";
    public static final String ACTIVE_CLASS = "active";
    private Map<String, String> typeMap = new HashMap<String, String>();

    private Map<String, String> informationTypeMap = new HashMap<String, String>();

    {
        informationTypeMap.put(MACROSCOPIC_POLICY, "宏观政策");
        informationTypeMap.put(MARKET_ANALYSIS, "市场分析");
        informationTypeMap.put(POWER_INDUSTRY, "电力行业");
        informationTypeMap.put(COAL_PRICE, "煤炭价格");
    }

    @RequestMapping("/addNews")
    public String addNews(News news, HttpServletRequest Request, Model model)
    {
        if (null == news || StringUtils.isEmpty(news.getTitle()))
        {
            return "news/newsEdit";
        }

        news.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        news.setReviewState(0);
        news.setSubmitDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        news.setRecordID(RIDUtil.getRID());
        newsModel.addNews(news);

        String type = Request.getParameter("type");
        NewsPageBean pageBean = newsModel.adminPageBean(currentPage, CURRENT_COUNT, type);
        model.addAttribute("type", type);
        model.addAttribute("pageBean", pageBean);

        return "news/newsManage";
    }

    @RequestMapping("/getNewsByTitle")
    public String getNewsByTitle(Model model, String title, String manager)
    {
        //encode url后台编码
        try
    {
            title = java.net.URLDecoder.decode(title, "UTF-8");
            News news = newsModel.getNewsByTitle(title);

            model.addAttribute("id", news.getId());
            model.addAttribute("type", informationTypeMap.get(news.getType()));
            model.addAttribute("username", news.getName());
            model.addAttribute("newstitle", title);
            model.addAttribute("content", news.getContent());
        } catch (UnsupportedEncodingException e)
        {
            LOGGER.error("title编码异常", e);
        }

        return manager == null ? "news/newsView" : "news/newsModify";
    }

    @RequestMapping("/modifyNews")
    public String modifyNews(News news)
    {
        news.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        news.setReviewState(0);
        newsModel.updateNews(news);
        return "news/newsManage";
    }

    @RequestMapping("/queryNews")
    public String queryNews(String type, String page0, Model model)
    {
        model.addAttribute("newsAll", newsModel.getAllNews(type, NumberUtils.toInt(page0)));
        return "news/newsManage";
    }

    @RequestMapping("/getNewsByType")
    public String getNewsByType(String type, Model model)
    {
        model.addAttribute("news", newsModel.getNewsByType(type));
        return "news/newsCenter";
    }

    @RequestMapping("/findPageBean")
    public String findPageBean(Integer currentPage, String type, Model model, HttpSession session)
    {
        //每一次都对四个咨询的CLASS赋 "none"
        typeMap.put(MACROSCOPIC_POLICY, NONE_CLASS);
        typeMap.put(MARKET_ANALYSIS, NONE_CLASS);
        typeMap.put(POWER_INDUSTRY, NONE_CLASS);
        typeMap.put(COAL_PRICE, NONE_CLASS);

        //传入一个咨询type去激活相应的CLASS为"active"
        typeMap.put(type, ACTIVE_CLASS);

        NewsPageBean pageBean = newsModel.findPageBean(currentPage, CURRENT_COUNT, type);

        model.addAttribute("type", type);
        model.addAttribute("newsList", pageBean.getNewsList());
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("active1", typeMap.get(MACROSCOPIC_POLICY));
        model.addAttribute("active2", typeMap.get(MARKET_ANALYSIS));
        model.addAttribute("active3", typeMap.get(POWER_INDUSTRY));
        model.addAttribute("active4", typeMap.get(COAL_PRICE));

        session.setAttribute("list", pageBean.getNewsList());
        return "news/newsCenter";
    }

    @RequestMapping("/newsDisplay")
    public String newsDisplay(String title, String type,Integer n,Model model,HttpSession session)
    {
        News news = newsModel.newsDisplay(title);
        model.addAttribute("list",session.getAttribute("list"));
        model.addAttribute("n",n);
        model.addAttribute("news", news);
        model.addAttribute("type", informationTypeMap.get(type) == null ? type:informationTypeMap.get(type));
        return "news/newsDisplay";
    }

    @RequestMapping("/adminPageBean")
    public String adminPageBean(String currentPage, String type, Model model)
    {
        int currentPageNum = NumberUtils.toInt(currentPage);
        model.addAttribute("pageBean", newsModel.adminPageBean(currentPageNum, CURRENT_COUNT, type));
        model.addAttribute("type", type);
        return "news/newsManage";
    }

    @RequestMapping("/deleteNews")
    public String deleteNews(String title)
    {
        newsModel.deleteNews(title);
        return "news/newsManage";
    }

}
