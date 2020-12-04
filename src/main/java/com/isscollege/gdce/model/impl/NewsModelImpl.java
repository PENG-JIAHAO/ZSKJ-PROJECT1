package com.isscollege.gdce.model.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.NewsPageBean;
import com.isscollege.gdce.model.INewsModel;
import com.isscollege.gdce.service.INewsService;

@Component
public class NewsModelImpl implements INewsModel
{
	private static final Logger LOGGER = Logger.getLogger(NewsModelImpl.class);
	@Autowired
	private INewsService service;

	@Override
	public boolean addNews(News news)
	{
		return service.addNews(news);
	}

	public boolean updateNews(News news)
	{
		return service.updateNews(news);
	}

	@Override
	public List<News> getAllNews(String type, int page)
	{
		return service.getAllNews(type, page);
	}

	@Override
	public List<News> getNewsByType(String type)
	{
		return service.getNewsByType(type);
	}

	@Override
	public NewsPageBean findPageBean(int currentPage, int currentCount, String type)
	{
		return service.findPageBean(currentPage, currentCount, type);
	}

	@Override
	public News getNewsByTitle(String title)
	{
		return service.getNewsByTitle(title);
	}

	@Override
	public News newsDisplay(String title)
	{
		return service.newsDisplay(title);
	}

	@Override
	public NewsPageBean adminPageBean(int currentPage, int currentCount, String type)
	{
		return service.adminPageBean(currentPage, currentCount, type);
	}

	@Override
	public boolean deleteNews(String title)
	{
		return service.deleteNews(title);
	}
}
