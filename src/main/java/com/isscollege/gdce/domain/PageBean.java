package com.isscollege.gdce.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean
{	//1。当前页
	private int currentPage;

	//2.当前新闻条数
	private int currentCount;
	//3.总新闻数
	private int totalCount;
	//4.总页数
	private int totalPage;
	//5.封装的数据
	private List<News> newsList=new ArrayList();
	public int getCurrentPage()
	{
		return currentPage;
	}
	public void setCurrentPage(int currentPage)
	{
		this.currentPage = currentPage;
	}
	public int getCurrentCount()
	{
		return currentCount;
	}
	public void setCurrentCount(int currentCount)
	{
		this.currentCount = currentCount;
	}
	public int getTotalCount()
	{
		return totalCount;
	}
	public void setTotalCount(int totalCount)
	{
		this.totalCount = totalCount;
	}
	public int getTotalPage()
	{
		return totalPage;
	}
	public void setTotalPage(int totalPage)
	{
		this.totalPage = totalPage;
	}
	public List<News> getNewsList()
	{
		return newsList;
	}
	public void setNewsList(List<News> newsList)
	{
		this.newsList = newsList;
	}


}
