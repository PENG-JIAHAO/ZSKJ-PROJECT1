package com.isscollege.gdce.dao;

import java.util.List;

import com.isscollege.gdce.domain.Company;
import org.apache.ibatis.annotations.Param;

import com.isscollege.gdce.domain.News;

public interface INewsDao
{

	int addNews(News news);

	boolean deleteNews(String title);

	void updateNewsReviewState(@Param("newsId") int newsId, @Param("curStats") int curStats);

	void updateNewsRecordID(@Param("newsId") int newsId, @Param("recordID") String recordID);

	int updateNews(News news);

	public News queryNewsByCompanyID(String companyId);

	List<News> getAllNewsInfo();

	List<News> getAllNews(@Param("type") String type, @Param("page") int page);

	List<News> queryNewsByReviewState(@Param("page") int page, @Param("size") int size);

	List<News> queryNewsByReviewStatenotpass(@Param("page") int page, @Param("size") int size);

	List<News> queryNewsByState(@Param("reviewState")int reviewState,@Param("page")int page,@Param("size")int size);

	List<News> getNewsByType(String type);

	int count(String type);

	List<News> findPageBeanForNews(@Param("index") int index, @Param("currentCount") int currentCount,
			@Param("type") String type);

	News getNewsByTitle(String title);

	News newsDisplay(String title);

	News queryNewsByID(@Param("id") int id);

	List<News> adminPageBeanForNews(@Param("index") int index, @Param("currentCount") int currentCount,
			@Param("type") String type);

	List<News> getNewsList(@Param("reviewState")int reviewState,@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

	int getNewsListTotal(@Param("reviewState")int reviewState,@Param("sort")String sort,@Param("order")String order);
}
