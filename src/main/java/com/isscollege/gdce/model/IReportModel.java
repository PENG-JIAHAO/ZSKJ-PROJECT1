package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.CoalSalesReport;

public interface IReportModel
{
	List<CoalSalesReport> getReportInfo(String date);
}
