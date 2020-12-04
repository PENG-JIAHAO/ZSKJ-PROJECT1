package com.isscollege.gdce.dao;

import java.util.List;
import com.isscollege.gdce.domain.CoalSalesReport;

public interface IReportDao
{
	List<CoalSalesReport> getReportInfo(String date);
}