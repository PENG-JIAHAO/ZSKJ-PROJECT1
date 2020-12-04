package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.CoalSalesReport;
import com.isscollege.gdce.model.IReportModel;
import org.apache.commons.lang3.math.NumberUtils;
import org.easymock.EasyMock;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;


public class ReportControllerTest
{
    private ReportController controller = null;
    private IReportModel reportModel = null;
    private Model model = null;
    private MockHttpServletRequest request = null;

    @Before
    public void setUp() throws Exception
    {
        controller = new ReportController();
        model = EasyMock.createMock(Model.class);
        reportModel = EasyMock.createMock(IReportModel.class);
        request = new MockHttpServletRequest();
        ReflectionTestUtils.setField(controller, "reportModel", reportModel);
    }

    @Test
    public void should_reportIndex_is_success_when_year_is_not_empty()
    {
        //模拟数据
        List<CoalSalesReport> coalSalesReportList = new ArrayList<>();
        CoalSalesReport coalSalesReport = new CoalSalesReport();
        coalSalesReport.setSumQuantity(120.00);
        coalSalesReport.setSumPrice(150.00);
        coalSalesReportList.add(coalSalesReport);
        request.setParameter("year", "2019");
        //获取数据
        int year = NumberUtils.toInt(request.getParameter("year"));
        //行为期待
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-01" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportone", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-02" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reporttwo", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-03" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportthree", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-04" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportfour", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-05" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportfive", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-06" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportsix", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-07" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportseven", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-08" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reporteight", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-09" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportnine", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-10" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportten", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-11" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reportele", coalSalesReportList)).andReturn(model);
        EasyMock.expect(reportModel.getReportInfo("%" + year + "-12" + "%")).andReturn(coalSalesReportList);
        EasyMock.expect(model.addAttribute("reporttev", coalSalesReportList)).andReturn(model);
        //记录回放
        EasyMock.replay(reportModel, model);
        //执行业务逻辑
        String result = controller.reportIndex(model, request);
        //验证
        EasyMock.verify(reportModel, model);
        //结果有效性检验
        Assert.assertEquals("report/reportIndex", result);
    }

    @Test
    public void should_reportIndex_is_success_when_year_is_empty()
    {
        request.setParameter("year", "");

        String result = controller.reportIndex(model, request);

        Assert.assertEquals("report/reportIndex", result);
    }
}
