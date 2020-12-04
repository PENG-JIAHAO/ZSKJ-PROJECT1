package com.isscollege.gdce.model.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.CoalSalesReport;
import com.isscollege.gdce.model.IReportModel;
import com.isscollege.gdce.service.IReportService;

@Component
public class ReportModelImpl implements IReportModel
{
	private static final Logger LOGGER = Logger.getLogger(ReportModelImpl.class);
	@Autowired
	private IReportService service;

	public List<CoalSalesReport> getReportInfo(String date)
	{
		return service.getReportInfo(date);
	}
}
