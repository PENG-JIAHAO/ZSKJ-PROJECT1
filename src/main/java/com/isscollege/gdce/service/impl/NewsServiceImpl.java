package com.isscollege.gdce.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.INewsDao;
import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.NewsPageBean;
import com.isscollege.gdce.service.INewsService;

@Service
public class NewsServiceImpl implements INewsService
{
	private static final Logger LOGGER = Logger.getLogger(NewsServiceImpl.class);
	@Autowired
	private INewsDao dao;

	public void setDao(INewsDao dao)
	{
		this.dao = dao;
	}

	@Override
	public boolean addNews(News news)
	{
		return dao.addNews(news) > 0;
	}

	@Override
	public News getNewsByTitle(String title)
	{
		return dao.getNewsByTitle(title);
	}

	@Override
	public boolean updateNews(News news)
	{
		return dao.updateNews(news) > 0;
	}

	@Override
	public List<News> getAllNews(String type, int page)
	{
		return dao.getAllNews(type, page);
	}

	@Override
	public List<News> getNewsByType(String type)
	{
		return dao.getNewsByType(type);
	}

	@Override
	public NewsPageBean findPageBean(int currentPage, int currentCount, String type)
	{
		NewsPageBean pageBean = new NewsPageBean();
		// 1.当前页
		pageBean.setCurrentPage(currentPage);
		// 2.当前页数量
		pageBean.setCurrentCount(currentCount);
		// 3.总记录数
		int totalCount = dao.count(type);
		pageBean.setTotalCount(totalCount);
		// 4.分多少页
		int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
		pageBean.setTotalPage(totalPage);
		// 5.每页显示的数据
		int index = (currentPage - 1) * currentCount;
		List<News> newsList = dao.findPageBeanForNews(index, currentCount, type);

		pageBean.setNewsList(newsList);

		return pageBean;
	}

	@Override
	public News newsDisplay(String title)
	{
		News news = dao.newsDisplay(title);
		return news;
	}

	@Override
	public NewsPageBean adminPageBean(int currentPage, int currentCount, String type)
	{
		NewsPageBean pageBean = new NewsPageBean();
		// 1.当前页
		pageBean.setCurrentPage(currentPage);
		// 2.当前页数量
		pageBean.setCurrentCount(currentCount);
		// 3.总记录数
		int totalCount = dao.count(type);
		pageBean.setTotalCount(totalCount);

		int totalPage = (int) Math.ceil(1.0 * totalCount / currentCount);
		pageBean.setTotalPage(totalPage);
		// 5.每页显示的数据
		int index = (currentPage - 1) * currentCount;
		List<News> newsList = dao.adminPageBeanForNews(index, currentCount, type);
		pageBean.setNewsList(newsList);
		return pageBean;
	}

	@Override
	public boolean deleteNews(String title)
	{
		return dao.deleteNews(title);
	}
}
