package com.isscollege.gdce.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.IReportDao;
import com.isscollege.gdce.domain.CoalSalesReport;
import com.isscollege.gdce.service.IReportService;

@Service
public class ReportServiceImpl implements IReportService
{
	private static final Logger LOGGER = Logger.getLogger(ReportServiceImpl.class);
	@Autowired
	private IReportDao dao;

	// 去掉了一个参数String type
	public List<CoalSalesReport> getReportInfo(String date)
	{
		List<CoalSalesReport> reportList = dao.getReportInfo(date);
		return reportList == null ? new ArrayList<CoalSalesReport>() : reportList;
	}
}