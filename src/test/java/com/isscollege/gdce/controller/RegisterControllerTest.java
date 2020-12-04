package com.isscollege.gdce.controller;

import com.isscollege.gdce.model.IRegisterModel;
import org.easymock.EasyMock;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.util.ReflectionTestUtils;

import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

public class RegisterControllerTest {

    private MockHttpServletResponse response = null;
    private MockHttpServletRequest request = null;
    private IRegisterModel registerModel = null;
    private RegisterController registerController = null;

    @Before
    public void setUp()
    {
        response = new MockHttpServletResponse();
        request = new MockHttpServletRequest();
        registerController = new RegisterController();
        registerModel = EasyMock.createMock(IRegisterModel.class);
        ReflectionTestUtils.setField(registerController,"registerModel",registerModel);
    }

    @Test
    public void should_find_company_by_id_success_when_data_exists() throws Exception
    {
        PrintWriter writer = EasyMock.createMock(PrintWriter.class);
        ReflectionTestUtils.setField(response,"writer",writer);
        Map<String,String[]> parameters = new LinkedHashMap<String,String[]>();
        parameters.put("companyId", new String[]{"123456"});
        ReflectionTestUtils.setField(request,"parameters",parameters);
        EasyMock.expect(registerModel.findcompanyId(parameters.get("companyId")[0])).andReturn(true);
        writer.write("true");
        EasyMock.replay(registerModel,writer);
        ////运行测试并核对结果
        registerController.findCompanyId(request,response);
        EasyMock.verify(registerModel,writer);
        Assert.assertEquals("UTF-8",request.getCharacterEncoding());
        Assert.assertEquals("UTF-8",response.getCharacterEncoding());
        Assert.assertEquals("text/html;charset=UTF-8",response.getContentType());
    }

    @Test
    public void should_find_company_by_id_fail_when_data_is_not_exists() throws Exception
    {
        PrintWriter writer = EasyMock.createMock(PrintWriter.class);
        ReflectionTestUtils.setField(response,"writer",writer);
        Map<String,String[]> parameters = new LinkedHashMap<String,String[]>();
        parameters.put("companyId", new String[]{"123456"});
        ReflectionTestUtils.setField(request,"parameters",parameters);
        EasyMock.expect(registerModel.findcompanyId(parameters.get("companyId")[0])).andReturn(false);
        writer.write("false");
        EasyMock.replay(registerModel,writer);
        ////运行测试并核对结果
        registerController.findCompanyId(request,response);
        EasyMock.verify(registerModel,writer);
        Assert.assertEquals("UTF-8",request.getCharacterEncoding());
        Assert.assertEquals("UTF-8",response.getCharacterEncoding());
        Assert.assertEquals("text/html;charset=UTF-8",response.getContentType());
    }

    @Test
    public void should_delete_manager_success_when_result_is_true()
    {
        //构造数据
        String id = "dog123";
        request.setParameter("id",id);
        //录入行为
        EasyMock.expect(registerModel.deleteManager(request.getParameter("id"))).andReturn(true);
        //回放
        EasyMock.replay(registerModel);
        //执行逻辑
        registerController.deleteManager(request,response);
        //验证
        EasyMock.verify(registerModel);
        //结果有效性校验
        Assert.assertEquals("成功删除",request.getAttribute("msg"));
    }

    @Test
    public void should_delete_manager_fail_when_result_is_false()
    {
        //构造数据
        String id = "cat321";
        request.setParameter("id",id);
        //录入行为
        EasyMock.expect(registerModel.deleteManager(request.getParameter("id"))).andReturn(false);
        //回放
        EasyMock.replay(registerModel);
        //执行逻辑
        registerController.deleteManager(request,response);
        //验证
        EasyMock.verify(registerModel);
        //结果有效性校验
        Assert.assertEquals("删除失败",request.getAttribute("msg"));
    }

}
