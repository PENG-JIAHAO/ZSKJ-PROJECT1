package com.isscollege.gdce.service;

import java.util.List;

import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.NewsPageBean;

public interface INewsService
{

	boolean addNews(News news);

	List<News> getAllNews(String type, int page);

	List<News> getNewsByType(String type);

	NewsPageBean findPageBean(int currentPage, int currentCount, String type);

	News getNewsByTitle(String title);

	boolean updateNews(News news);

	News newsDisplay(String title);

	NewsPageBean adminPageBean(int currentPage, int currentCount, String type);

	boolean deleteNews(String title);
}
