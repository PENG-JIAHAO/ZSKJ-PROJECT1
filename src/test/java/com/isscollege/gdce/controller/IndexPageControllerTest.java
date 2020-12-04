package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IProductModel;
import org.apache.jute.Index;
import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class IndexPageControllerTest
{
    private MockHttpServletRequest request = null;
    private MockHttpServletResponse response = null;
    private MockHttpSession session = null;
    private IndexPageController controller = null;
    private IProductModel iProductModel = null;

    @Before
    public void setUp()
    {
        request = new MockHttpServletRequest();
        response = new MockHttpServletResponse();
        session = new MockHttpSession();
        controller = new IndexPageController();

        iProductModel = EasyMock.createMock(IProductModel.class);
        ReflectionTestUtils.setField(controller,"productModel",iProductModel);
    }
    
    @Test
    public void should_showView_is_success_when_user_dose_not_exist() throws Exception
    {
        //构造数据
        List<Product> productInfoList = new ArrayList<Product>();
        Product pro1 = new Product();
        Product pro2 = new Product();
        pro1.setId(2);
        pro1.setProductState(1);
        pro2.setId(3);
        pro2.setProductState(1);
        productInfoList.add(pro1);
        productInfoList.add(pro2);

        //传入空的用户，期待url返回"/jsp/index.jsp"，而非"/jsp/product/managing"
        User user = null;
        session.setAttribute("currentUser",user);
        request.setSession(session);

        //录入行为
        EasyMock.expect(iProductModel.getIndexProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAllProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getPublishedProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAuditingProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getUnderProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getNotPassProductInfo()).andReturn(productInfoList);
        //回放
        EasyMock.replay(iProductModel);
        //执行逻辑
        controller.showView(request,response);
        //验证
        EasyMock.verify(iProductModel);

        //验证set值是否满足预期
        List<Product> indexProductInfoList = (List<Product>)session.getAttribute("indexProductInfoList");
        assertEquals(productInfoList.size(),indexProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),indexProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),indexProductInfoList.get(1).getId());

        List<Product> allProductInfoList = (List<Product>)session.getAttribute("allProductInfoList");
        assertEquals(productInfoList.size(),allProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),allProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),allProductInfoList.get(1).getId());

        List<Product> auditingProductList = (List<Product>)session.getAttribute("auditingProductList");
        assertEquals(productInfoList.size(),auditingProductList.size());
        assertEquals(productInfoList.get(0).getId(),auditingProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),auditingProductList.get(1).getId());

        List<Product> publishedProductInfoList = (List<Product>)session.getAttribute("publishedProductInfoList");
        assertEquals(productInfoList.size(),publishedProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),publishedProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),publishedProductInfoList.get(1).getId());

        List<Product> underProductList = (List<Product>)session.getAttribute("underProductList");
        assertEquals(productInfoList.size(),underProductList.size());
        assertEquals(productInfoList.get(0).getId(),underProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),underProductList.get(1).getId());

        List<Product> notPassProductList = (List<Product>)session.getAttribute("notPassProductList");
        assertEquals(productInfoList.size(),notPassProductList.size());
        assertEquals(productInfoList.get(0).getId(),notPassProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),notPassProductList.get(1).getId());
    }

    @Test
    public void should_showView_is_success_when_user_does_exist_and_level_is_2() throws Exception
    {
        //构造数据
        List<Product> productInfoList = new ArrayList<Product>();
        Product pro1 = new Product();
        Product pro2 = new Product();
        pro1.setId(4);
        pro1.setProductState(0);
        pro2.setId(5);
        pro2.setProductState(2);
        productInfoList.add(pro1);
        productInfoList.add(pro2);

        //传入等级为2的用户——会员，期待url返回"/jsp/index.jsp"，而非"/jsp/product/managing"
        User user = new User();
        user.setLevel(2);
        session.setAttribute("currentUser",user);
        request.setSession(session);

        //录入行为
        EasyMock.expect(iProductModel.getIndexProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAllProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getPublishedProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAuditingProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getUnderProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getNotPassProductInfo()).andReturn(productInfoList);
        //回放
        EasyMock.replay(iProductModel);
        //执行逻辑
        controller.showView(request,response);
        //验证
        EasyMock.verify(iProductModel);

        //验证set值是否满足预期
        List<Product> indexProductInfoList = (List<Product>)session.getAttribute("indexProductInfoList");
        assertEquals(productInfoList.size(),indexProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),indexProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),indexProductInfoList.get(1).getId());

        List<Product> allProductInfoList = (List<Product>)session.getAttribute("allProductInfoList");
        assertEquals(productInfoList.size(),allProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),allProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),allProductInfoList.get(1).getId());

        List<Product> auditingProductList = (List<Product>)session.getAttribute("auditingProductList");
        assertEquals(productInfoList.size(),auditingProductList.size());
        assertEquals(productInfoList.get(0).getId(),auditingProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),auditingProductList.get(1).getId());

        List<Product> publishedProductInfoList = (List<Product>)session.getAttribute("publishedProductInfoList");
        assertEquals(productInfoList.size(),publishedProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),publishedProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),publishedProductInfoList.get(1).getId());

        List<Product> underProductList = (List<Product>)session.getAttribute("underProductList");
        assertEquals(productInfoList.size(),underProductList.size());
        assertEquals(productInfoList.get(0).getId(),underProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),underProductList.get(1).getId());

        List<Product> notPassProductList = (List<Product>)session.getAttribute("notPassProductList");
        assertEquals(productInfoList.size(),notPassProductList.size());
        assertEquals(productInfoList.get(0).getId(),notPassProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),notPassProductList.get(1).getId());
    }

    @Test
    public void should_showView_is_success_when_user_dose_exist_and_level_is_0() throws Exception
    {
        //构造数据
        List<Product> productInfoList= new ArrayList<Product>();
        Product pro1 = new Product();
        Product pro2 = new Product();
        pro1.setId(6);
        pro1.setProductState(1);
        pro2.setId(7);
        pro2.setProductState(1);
        productInfoList.add(pro1);
        productInfoList.add(pro2);

        //传入level为0的用户——超管，期待url返回"/jsp/product/managing"，而非"/jsp/index.jsp"
        User user = new User();
        user.setLevel(0);
        session.setAttribute("currentUser",user);
        request.setSession(session);

        //录入行为
        EasyMock.expect(iProductModel.getIndexProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAllProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getPublishedProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAuditingProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getUnderProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getNotPassProductInfo()).andReturn(productInfoList);
        //回放
        EasyMock.replay(iProductModel);
        //执行逻辑
        controller.showView(request,response);
        //验证
        EasyMock.verify(iProductModel);

        //验证set值是否满足预期
        List<Product> indexProductInfoList = (List<Product>)session.getAttribute("indexProductInfoList");
        assertEquals(productInfoList.size(),indexProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),indexProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),indexProductInfoList.get(1).getId());

        List<Product> allProductInfoList = (List<Product>)session.getAttribute("allProductInfoList");
        assertEquals(productInfoList.size(),allProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),allProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),allProductInfoList.get(1).getId());

        List<Product> auditingProductList = (List<Product>)session.getAttribute("auditingProductList");
        assertEquals(productInfoList.size(),auditingProductList.size());
        assertEquals(productInfoList.get(0).getId(),auditingProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),auditingProductList.get(1).getId());

        List<Product> publishedProductInfoList = (List<Product>)session.getAttribute("publishedProductInfoList");
        assertEquals(productInfoList.size(),publishedProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),publishedProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),publishedProductInfoList.get(1).getId());

        List<Product> underProductList = (List<Product>)session.getAttribute("underProductList");
        assertEquals(productInfoList.size(),underProductList.size());
        assertEquals(productInfoList.get(0).getId(),underProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),underProductList.get(1).getId());

        List<Product> notPassProductList = (List<Product>)session.getAttribute("notPassProductList");
        assertEquals(productInfoList.size(),notPassProductList.size());
        assertEquals(productInfoList.get(0).getId(),notPassProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),notPassProductList.get(1).getId());
    }

    @Test
    public void should_showView_is_success_when_user_dose_exist_and_level_is_1() throws Exception
    {
        //构造数据
        List<Product> productInfoList = new ArrayList<Product>();
        Product pro1 = new Product();
        Product pro2 = new Product();
        pro1.setId(8);
        pro1.setProductState(1);
        pro2.setId(9);
        pro2.setProductState(1);
        productInfoList.add(pro1);
        productInfoList.add(pro2);

        //传入level为1的用户——管理员，期待url返回"/jsp/product/managing"，而非"/jsp/index.jsp"
        User user = new User();
        user.setLevel(1);
        session.setAttribute("currentUser",user);
        request.setSession(session);

        //录入行为
        EasyMock.expect(iProductModel.getIndexProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAllProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getPublishedProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getAuditingProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getUnderProductInfo()).andReturn(productInfoList);
        EasyMock.expect(iProductModel.getNotPassProductInfo()).andReturn(productInfoList);
        //回放
        EasyMock.replay(iProductModel);
        //执行逻辑
        controller.showView(request,response);
        //验证
        EasyMock.verify(iProductModel);

        //验证set值是否满足预期
        List<Product> indexProductInfoList = (List<Product>)session.getAttribute("indexProductInfoList");
        assertEquals(productInfoList.size(),indexProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),indexProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),indexProductInfoList.get(1).getId());

        List<Product> allProductInfoList = (List<Product>)session.getAttribute("allProductInfoList");
        assertEquals(productInfoList.size(),allProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),allProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),allProductInfoList.get(1).getId());

        List<Product> auditingProductList = (List<Product>)session.getAttribute("auditingProductList");
        assertEquals(productInfoList.size(),auditingProductList.size());
        assertEquals(productInfoList.get(0).getId(),auditingProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),auditingProductList.get(1).getId());

        List<Product> publishedProductInfoList = (List<Product>)session.getAttribute("publishedProductInfoList");
        assertEquals(productInfoList.size(),publishedProductInfoList.size());
        assertEquals(productInfoList.get(0).getId(),publishedProductInfoList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),publishedProductInfoList.get(1).getId());

        List<Product> underProductList = (List<Product>)session.getAttribute("underProductList");
        assertEquals(productInfoList.size(),underProductList.size());
        assertEquals(productInfoList.get(0).getId(),underProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),underProductList.get(1).getId());

        List<Product> notPassProductList = (List<Product>)session.getAttribute("notPassProductList");
        assertEquals(productInfoList.size(),notPassProductList.size());
        assertEquals(productInfoList.get(0).getId(),notPassProductList.get(0).getId());
        assertEquals(productInfoList.get(1).getId(),notPassProductList.get(1).getId());
    }
}
