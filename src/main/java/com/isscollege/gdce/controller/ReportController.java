package com.isscollege.gdce.controller;

import com.isscollege.gdce.model.IReportModel;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/*
 * 报表
 */
@Controller
@RequestMapping("/report")
public class ReportController {
    private static final Logger LOGGER = Logger.getLogger(ReportController.class);
    @Autowired
    private IReportModel reportModel;

    @RequestMapping("/index")
    public String reportIndex(Model model, HttpServletRequest request)
	{
        int year = NumberUtils.toInt(request.getParameter("year"));
        if (year > 0)
        {
            model.addAttribute("reportone", reportModel.getReportInfo("%" + year + "-01" + "%"));
            model.addAttribute("reporttwo", reportModel.getReportInfo("%" + year + "-02" + "%"));
            model.addAttribute("reportthree", reportModel.getReportInfo("%" + year + "-03" + "%"));
            model.addAttribute("reportfour", reportModel.getReportInfo("%" + year + "-04" + "%"));
            model.addAttribute("reportfive", reportModel.getReportInfo("%" + year + "-05" + "%"));
            model.addAttribute("reportsix", reportModel.getReportInfo("%" + year + "-06" + "%"));
            model.addAttribute("reportseven", reportModel.getReportInfo("%" + year + "-07" + "%"));
            model.addAttribute("reporteight", reportModel.getReportInfo("%" + year + "-08" + "%"));
            model.addAttribute("reportnine", reportModel.getReportInfo("%" + year + "-09" + "%"));
            model.addAttribute("reportten", reportModel.getReportInfo("%" + year + "-10" + "%"));
            model.addAttribute("reportele", reportModel.getReportInfo("%" + year + "-11" + "%"));
            model.addAttribute("reporttev", reportModel.getReportInfo("%" + year + "-12" + "%"));
        }
        return "report/reportIndex";
    }
}

