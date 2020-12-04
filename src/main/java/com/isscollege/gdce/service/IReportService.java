package com.isscollege.gdce.service;

import java.util.List;

import com.isscollege.gdce.domain.CoalSalesReport;

public interface IReportService
{
	List<CoalSalesReport> getReportInfo(String date);
}
