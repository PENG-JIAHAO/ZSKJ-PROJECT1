package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.NewsPageBean;
import com.isscollege.gdce.model.INewsModel;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.easymock.EasyMock;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.Model;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class NewsControllerTest
{
    private NewsController controller = null;
    private INewsModel newsModel = null;
    private Model model = null;
    private MockHttpServletRequest request = null;
    private MockHttpSession session = null;
    private static final int currentPage = 1;
    private static final int CURRENT_COUNT = 8;

    @Before
    public void setUp() throws Exception
    {
        controller = new NewsController();
        newsModel = EasyMock.createMock(INewsModel.class);
        ReflectionTestUtils.setField(controller, "newsModel", newsModel);
        model = EasyMock.createMock(Model.class);
        request = new MockHttpServletRequest();
        session = new MockHttpSession();
    }

    @Test
    public void should_deleteNews_is_success_when_title_is_not_empty()
    {
        //录入行为
        EasyMock.expect(newsModel.deleteNews("西班牙煤炭行业即将退出历史舞台")).andReturn(true);
        //记录回放
        EasyMock.replay(newsModel);
        //执行业务逻辑
        String nextPage = controller.deleteNews("西班牙煤炭行业即将退出历史舞台");
        EasyMock.verify(newsModel);
        //结果有效性检验
        assertEquals("news/newsManage", nextPage);
    }

    @Test
    public void should_modify_news_is_success_when_CreateDate_and_ReviewState_are_update()
    {
        //录入行为
        News news = new News();

        EasyMock.expect(newsModel.updateNews(news)).andReturn(true);
        //记录回放
        EasyMock.replay(newsModel);
        //执行业务逻辑
        String result = controller.modifyNews(news);
        //验证
        EasyMock.verify(newsModel);
        //结果有效性检验
        Assert.assertNotNull(news.getCreateDate());
        Assert.assertEquals(0, news.getReviewState());
        Assert.assertEquals("news/newsManage", result);
    }

    @Test
    public void should_getNewsByType_is_success_when_type_is_hgzc()
    {   //录入行为
        List<News> newsList = new ArrayList<News>();
        News news1 = new News();
        News news2 = new News();
        news1.setType("hgzc");
        news2.setType("hgzc");
        newsList.add(news1);
        newsList.add(news2);

        EasyMock.expect(newsModel.getNewsByType("hgzc")).andReturn(newsList);
        EasyMock.expect(model.addAttribute("news", newsList)).andReturn(model);
        //记录回放
        EasyMock.replay(newsModel, model);
        //执行业务逻辑
        String result = controller.getNewsByType("hgzc", model);
        //验证
        EasyMock.verify(newsModel, model);
        //结果有效性检验
        assertEquals("news/newsCenter", result);
    }

    @Test
    public void should_adminPageBean_is_success_when_currentPage_and_type_are_exist() throws Exception
    {
        //生成一个newsPageBean
        String testType = "hgzc";
        NewsPageBean newsPageBean = new NewsPageBean();
        newsPageBean.setCurrentPage(1);
        newsPageBean.setCurrentCount(8);

        //录入行为
        EasyMock.expect(newsModel.adminPageBean(1, 8, testType)).andReturn(newsPageBean);
        EasyMock.expect(model.addAttribute("pageBean", newsPageBean)).andReturn(model);
        EasyMock.expect(model.addAttribute("type", testType)).andReturn(model);

        //回放
        EasyMock.replay(newsModel, model);

        //执行业务
        String result = controller.adminPageBean("1", testType, model);

        //验证
        EasyMock.verify(newsModel, model);
        assertEquals("news/newsManage", result);
    }

    @Test
    public void should_addNews_is_success_when_news_and_title_are_not_null() throws UnsupportedEncodingException
    {
        //录入行为
        NewsPageBean pageBean = new NewsPageBean();
        News news = new News();
        news.setId(1);
        news.setSubmitDate("2019-01-04 10:34:02");
        news.setRecordID("AR2019-01-04 10:34:02");
        news.setCreateDate("2019-01-04 10:34:02");
        news.setReviewState(0);
        news.setContent("<p>&nbsp; 根据欧盟指令，自2019年1月1日起，西班牙所有不再盈利但仍获得公共资金补贴的煤矿必须停止生产，这意味着该国无利可图的煤炭行业走向了终结。<br />\\r\\n&nbsp; &nbsp;2016年，西班牙政府曾在欧盟的支持下宣布了一项计划，投资21.3亿欧元完成煤矿的关闭。而那些在截止日期前未停产的煤矿应当将资金交还。<br />\\r\\n10月份，西班牙社会党政府与工会达成协议，以确保工人获得提前退休等福利的机会，并拨款2.5亿欧元用于资助创业和重新利用废弃煤矿。<br />\\r\\n社会党政府预计，预计约有60%的工人会选择提前退休。<br />\\r\\n出于环保原因，欧盟希望尽早结束对煤矿的公共援助。去年12月初，德国关闭了最后一座煤矿，而西班牙将关闭煤矿日期一直延长至2018年底。<br />\\r\\n煤炭在西班牙能源需求的占比不足10%，该国使用的煤炭大多数来自进口。<br />\\r\\n&nbsp; 由于开采成本高昂，西班牙煤矿逐渐关闭。关闭的煤矿主要集中于阿斯图里亚斯、卡斯蒂利亚和莱昂以及阿拉贡的北部地区。<br />\\r\\n二十世纪50年代，西班牙煤炭行业雇佣人数约为10万人，但此后逐年下降，目前已降至约2000人。<br />\\r\\n&nbsp; 埃斯康迪达（La Escondida）是莱昂省西北部唯一一个正在运营的煤矿，该煤矿雇佣工人70名，每月产量7000吨。<br />\\r\\n该矿主反对关闭埃斯康迪达煤矿，并表示已经提出开发临近煤层的项目，但尚未获得该州政府资助。据预计，新项目煤炭储量达到数百万吨。<br />\\r\\n&nbsp; 据称，西班牙正朝着更加环保的方向发展。该国希望到2020年实现欧盟设定的可再生能源增加至20%，当前占比为17%。<br />\\r\\n若未能达到目标，或将引发欧盟诉讼和罚款。<br />\\r\\n&nbsp;</p>\\r\\n");
        news.setName("中国煤炭资源网");
        news.setTitle("西班牙煤炭行业即将退出历史舞台");
        request.setParameter("type", "hgzc");
        String type = request.getParameter("type");
        EasyMock.expect(newsModel.adminPageBean(1, 8, type)).andReturn(pageBean);
        EasyMock.expect(newsModel.addNews(news)).andReturn(true);
        EasyMock.expect(model.addAttribute("type", type)).andReturn(model);
        EasyMock.expect(model.addAttribute("pageBean", pageBean)).andReturn(model);
        //记录回放
        EasyMock.replay(newsModel, model);
        //执行业务逻辑
        String nextPage = controller.addNews(news, request, model);
        //验证
        EasyMock.verify(newsModel, model);
        //结果有效性检测
        assertEquals("news/newsManage", nextPage);
    }

    @Test
    public void should_addNews_is_fail_when_news_is_not_null_and_title_is_null() throws UnsupportedEncodingException
    {
        //录入行为
        News news = new News();
        news.setId(1);
        news.setSubmitDate("2019-01-04 10:34:02");
        news.setRecordID("AR2019-01-04 10:34:02");
        news.setCreateDate("2019-01-04 10:34:02");
        news.setReviewState(0);
        news.setContent("<p>&nbsp; 根据欧盟指令，自2019年1月1日起，西班牙所有不再盈利但仍获得公共资金补贴的煤矿必须停止生产，这意味着该国无利可图的煤炭行业走向了终结。<br />\\r\\n&nbsp; &nbsp;2016年，西班牙政府曾在欧盟的支持下宣布了一项计划，投资21.3亿欧元完成煤矿的关闭。而那些在截止日期前未停产的煤矿应当将资金交还。<br />\\r\\n10月份，西班牙社会党政府与工会达成协议，以确保工人获得提前退休等福利的机会，并拨款2.5亿欧元用于资助创业和重新利用废弃煤矿。<br />\\r\\n社会党政府预计，预计约有60%的工人会选择提前退休。<br />\\r\\n出于环保原因，欧盟希望尽早结束对煤矿的公共援助。去年12月初，德国关闭了最后一座煤矿，而西班牙将关闭煤矿日期一直延长至2018年底。<br />\\r\\n煤炭在西班牙能源需求的占比不足10%，该国使用的煤炭大多数来自进口。<br />\\r\\n&nbsp; 由于开采成本高昂，西班牙煤矿逐渐关闭。关闭的煤矿主要集中于阿斯图里亚斯、卡斯蒂利亚和莱昂以及阿拉贡的北部地区。<br />\\r\\n二十世纪50年代，西班牙煤炭行业雇佣人数约为10万人，但此后逐年下降，目前已降至约2000人。<br />\\r\\n&nbsp; 埃斯康迪达（La Escondida）是莱昂省西北部唯一一个正在运营的煤矿，该煤矿雇佣工人70名，每月产量7000吨。<br />\\r\\n该矿主反对关闭埃斯康迪达煤矿，并表示已经提出开发临近煤层的项目，但尚未获得该州政府资助。据预计，新项目煤炭储量达到数百万吨。<br />\\r\\n&nbsp; 据称，西班牙正朝着更加环保的方向发展。该国希望到2020年实现欧盟设定的可再生能源增加至20%，当前占比为17%。<br />\\r\\n若未能达到目标，或将引发欧盟诉讼和罚款。<br />\\r\\n&nbsp;</p>\\r\\n");
        news.setName("中国煤炭资源网");
        //执行业务逻辑
        String nextPage = controller.addNews(news, request, model);
        //结果有效性检测
        assertEquals("news/newsEdit", nextPage);
    }

    @Test
    public void should_addNews_is_fail_when_news_is_null_and_title_is_null() throws UnsupportedEncodingException
    {
        //执行业务逻辑
        String nextPage = controller.addNews(null, request, model);
        //结果有效性检测
        assertEquals("news/newsEdit", nextPage);
    }

    @Test
    public void should_findPageBean_is_success_when_type_is_hgzc() throws Exception
    {
        //构造数据
        String type = NewsController.MACROSCOPIC_POLICY;

        List<News> newsList = new ArrayList<News>();
        News news1 = new News();
        News news2 = new News();
        news1.setId(1);
        news1.setType(NewsController.MACROSCOPIC_POLICY);
        news2.setId(2);
        news2.setType(NewsController.MACROSCOPIC_POLICY);
        newsList.add(news1);
        newsList.add(news2);

        NewsPageBean newsPageBean = new NewsPageBean();
        newsPageBean.setCurrentPage(1);
        newsPageBean.setCurrentCount(8);
        newsPageBean.setNewsList(newsList);

        //录入行为
        EasyMock.expect(newsModel.findPageBean(1, 8, type)).andReturn(newsPageBean);
        EasyMock.expect(model.addAttribute("type", type)).andReturn(model);
        EasyMock.expect(model.addAttribute("newsList", newsPageBean.getNewsList())).andReturn(model);
        EasyMock.expect(model.addAttribute("pageBean", newsPageBean)).andReturn(model);
        EasyMock.expect(model.addAttribute("active1", NewsController.ACTIVE_CLASS)).andReturn(model);
        EasyMock.expect(model.addAttribute("active2", NewsController.NONE_CLASS)).andReturn(model);
        EasyMock.expect(model.addAttribute("active3", NewsController.NONE_CLASS)).andReturn(model);
        EasyMock.expect(model.addAttribute("active4", NewsController.NONE_CLASS)).andReturn(model);

        //回放
        EasyMock.replay(newsModel, model);

        //执行业务
        String result = controller.findPageBean(1, type, model, session);

        //验证
        EasyMock.verify(newsModel, model);

        assertNotNull(session.getAttribute("list"));
        assertEquals(2, ((List) (session.getAttribute("list"))).size());
        assertEquals("news/newsCenter", result);
    }

    @Test
    public void should_getNewsByTitle_is_success_when_title_is_not_null_and_manage_is_empty()
    {
        News news = new News();
        news.setId(1);
        news.setType("hgzc");
        news.setName("Jason");
        news.setContent("<h1>Jason is a handsome boy<h1>");

        EasyMock.expect(newsModel.getNewsByTitle("Jason No.1")).andReturn(news);
        EasyMock.expect(model.addAttribute("id", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("type", "宏观政策")).andReturn(model);
        EasyMock.expect(model.addAttribute("username", "Jason")).andReturn(model);
        EasyMock.expect(model.addAttribute("newstitle", "Jason No.1")).andReturn(model);
        EasyMock.expect(model.addAttribute("content", "<h1>Jason is a handsome boy<h1>")).andReturn(model);

        EasyMock.replay(newsModel, model);
        String nextPage = controller.getNewsByTitle(model, "Jason No.1", null);
        EasyMock.verify(newsModel, model);

        assertEquals("news/newsView", nextPage);
    }

    @Test
    public void should_getNewsByTitle_is_success_when_title_is_not_null_and_manage_is_not_empty()
    {
        News news = new News();
        news.setId(1);
        news.setType("hgzc");
        news.setName("Jason");
        news.setContent("<h1>Jason is a handsome boy<h1>");

        EasyMock.expect(newsModel.getNewsByTitle("Jason No.1")).andReturn(news);
        EasyMock.expect(model.addAttribute("id", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("type", "宏观政策")).andReturn(model);
        EasyMock.expect(model.addAttribute("username", "Jason")).andReturn(model);
        EasyMock.expect(model.addAttribute("newstitle", "Jason No.1")).andReturn(model);
        EasyMock.expect(model.addAttribute("content", "<h1>Jason is a handsome boy<h1>")).andReturn(model);

        EasyMock.replay(newsModel, model);
        String nextPage = controller.getNewsByTitle(model, "Jason No.1", "true");
        EasyMock.verify(newsModel, model);

        assertEquals("news/newsModify", nextPage);
    }

    @Test
    public void should_queryNew_is_success_when_page_is_1_and_type_is_hgzc()
    {
        int pageIndex = 1;
        List<News> newsList = new ArrayList<>();
        News news1 = new News();
        News news2 = new News();
        news1.setType("hgzc");
        news2.setType("hgzc");
        newsList.add(news1);
        newsList.add(news2);

        EasyMock.expect(newsModel.getAllNews("hgzc", pageIndex)).andReturn(newsList);
        EasyMock.expect(model.addAttribute("newsAll", newsList)).andReturn(model);

        EasyMock.replay(newsModel, model);
        String result = controller.queryNews("hgzc", "1", model);
        EasyMock.verify(newsModel, model);
        assertEquals("news/newsManage", result);

    }

    @Test
    public void should_newsDisplay_is_success_when_type_is_hgzc() throws Exception
    {
        //构造数据
        session.setAttribute("list",new Object());
        News news = new News();

        //录入行为
        EasyMock.expect(newsModel.newsDisplay("西班牙煤炭行业即将退出历史舞台")).andReturn(news);
        EasyMock.expect(model.addAttribute("list",session.getAttribute("list"))).andReturn(model);
        EasyMock.expect(model.addAttribute("n", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("type", "宏观政策")).andReturn(model);
        EasyMock.expect(model.addAttribute("news", news)).andReturn(model);

        //回放
        EasyMock.replay(newsModel,model);
        //执行业务逻辑
        String info = controller.newsDisplay("西班牙煤炭行业即将退出历史舞台","宏观政策",1,model,session);
        //验证
        EasyMock.verify(newsModel,model);
        //结果有效性检测
        assertEquals("news/newsDisplay",info);
    }

    @Test
    public void should_newsDisplay_is_success_when_type_is_other() throws Exception
    {
        //构造数据
        session.setAttribute("list",new Object());
        News news = new News();

        //录入行为
        EasyMock.expect(newsModel.newsDisplay("西班牙煤炭行业即将退出历史舞台")).andReturn(news);
        EasyMock.expect(model.addAttribute("list",session.getAttribute("list"))).andReturn(model);
        EasyMock.expect(model.addAttribute("n", 2)).andReturn(model);
        EasyMock.expect(model.addAttribute("type", "市场金融")).andReturn(model);
        EasyMock.expect(model.addAttribute("news", news)).andReturn(model);

        //回放
        EasyMock.replay(newsModel,model);
        //执行业务逻辑
        String info = controller.newsDisplay("西班牙煤炭行业即将退出历史舞台","市场金融",2,model,session);
        //验证
        EasyMock.verify(newsModel,model);
        //结果有效性检测
        assertEquals("news/newsDisplay",info);
    }
}


