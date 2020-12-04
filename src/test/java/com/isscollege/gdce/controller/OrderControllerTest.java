package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.*;
import com.isscollege.gdce.model.IOrderModel;
import com.isscollege.gdce.model.impl.LogisticsModelImpl;
import com.isscollege.gdce.model.impl.OrderModelImpl;
import com.isscollege.gdce.util.FileUtil;
import org.apache.commons.fileupload.FileUploadException;
import org.easymock.EasyMock;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.mock.web.*;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;

import java.io.*;
import java.util.*;

import static org.junit.Assert.*;

public class OrderControllerTest
{
    private Model model = null;
    private OrderController orderController = null;
    private OrderModelImpl orderModel = null;
    private LogisticsModelImpl logisticsModel = null;
    private MockHttpServletRequest request = null;
    private MockHttpServletResponse response = null;
    private MockHttpSession session = null;
    private MultipartHttpServletRequest multipartHttpServletRequest = null;
    private ServletContext servletContext = null;

    @Before
    public void setUp() throws Exception
    {
        session = new MockHttpSession();
        request = new MockHttpServletRequest();
        orderController = new OrderController();
        response = new MockHttpServletResponse();

        //创建代理对象（模拟对象行为）
        model = EasyMock.createMock(Model.class);
        multipartHttpServletRequest = new MockMultipartHttpServletRequest();
        servletContext = EasyMock.createMock(ServletContext.class);
        logisticsModel = EasyMock.createMock(LogisticsModelImpl.class);
        orderModel = EasyMock.createMock(OrderModelImpl.class);

        //通过反射机制动态注入bean对象
        ReflectionTestUtils.setField(orderController, "ordermodel", orderModel);
        ReflectionTestUtils.setField(orderController, "logisticsmodel", logisticsModel);
        ReflectionTestUtils.setField(multipartHttpServletRequest, "session", session);
        ReflectionTestUtils.setField(session, "servletContext", servletContext);
    }

    @Test
    public void should_orderCreate_success_when_state_is_true()
    {
        //初始化数据
        String buyerCompanyId = "123456";
        String sellerCompanyId = "654321";
        int productId = 123;
        Product product = new Product();
        Contract contract = new Contract();
        Company buyerCompany = new Company();
        Company sellerCompany = new Company();
        contract.setBuyerCompanyId(buyerCompanyId);
        contract.setSellerCompanyId(sellerCompanyId);
        contract.setProductId(productId);
        session.setAttribute("contract", contract);
        //录入行为
        EasyMock.expect(orderModel.queryProduct(productId)).andReturn(product);
        EasyMock.expect(orderModel.queryCompany(buyerCompanyId)).andReturn(buyerCompany);
        EasyMock.expect(orderModel.queryCompany(sellerCompanyId)).andReturn(sellerCompany);
        EasyMock.expect(orderModel.orderCreate(EasyMock.isA(Order.class))).andReturn(true);
        //记录回放
        EasyMock.replay(orderModel);
        //执行业务逻辑
        String result = orderController.orderCreate(session, model);
        EasyMock.verify(orderModel);
        //结果有效性检验
        assertEquals(result, "order/orderCreation");
    }

    @Test
    public void should_orderCreate_fail_when_state_is_false()
    {
        //初始化数据
        String buyerCompanyId = "123456";
        String sellerCompanyId = "654321";
        int productId = 123;
        Product product = new Product();
        Contract contract = new Contract();
        Company buyerCompany = new Company();
        Company sellerCompany = new Company();
        contract.setBuyerCompanyId(buyerCompanyId);
        contract.setSellerCompanyId(sellerCompanyId);
        contract.setProductId(productId);
        session.setAttribute("contract", contract);
        //录入行为
        EasyMock.expect(orderModel.queryProduct(productId)).andReturn(product);
        EasyMock.expect(orderModel.queryCompany(buyerCompanyId)).andReturn(buyerCompany);
        EasyMock.expect(orderModel.queryCompany(sellerCompanyId)).andReturn(sellerCompany);
        EasyMock.expect(orderModel.orderCreate(EasyMock.isA(Order.class))).andReturn(false);
        //记录回放
        EasyMock.replay(orderModel);
        //执行业务逻辑
        String result = orderController.orderCreate(session, model);
        EasyMock.verify(orderModel);
        //结果有效性检验
        assertEquals(result, "result");
    }

    @Test
    public void should_getLogisticName_success_when_companyList_is_not_null()
    {
        //初始化数据
        List<Company> companyList = new ArrayList<>();
        Company company = new Company();
        company.setCompanyId("9113080378259190000");
        company.setCompanyName("国电承德热电有限公司");
        company.setLegalPerson("郝剑宇");
        company.setLegalPersonId("612321198701215000");
        companyList.add(company);
        String orderId = "2019010410184393";
        //录入行为
        EasyMock.expect(logisticsModel.queryLogisticsCompany()).andReturn(companyList);
        EasyMock.expect(model.addAttribute("companylist", companyList)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderId", orderId)).andReturn(model);
        //记录回放
        EasyMock.replay(logisticsModel, model);
        //执行业务逻辑
        String result = orderController.getLogisticName(orderId, model);
        EasyMock.verify(logisticsModel, model);
        //结果有效性检验
        assertEquals(result, "order/waybillProduce");
    }

    @Test
    public void should_getLogisticName_fail_when_companyList_is_null()
    {
        //初始化数据
        String orderId = "2019010410184393";
        //录入行为
        EasyMock.expect(logisticsModel.queryLogisticsCompany()).andReturn(null);
        EasyMock.expect(model.addAttribute("orderId", orderId)).andReturn(model);
        //记录回放
        EasyMock.replay(logisticsModel, model);
        //执行业务逻辑
        String result = orderController.getLogisticName(orderId, model);
        EasyMock.verify(logisticsModel, model);
        //结果有效性检验
        assertEquals(result, "order/waybillProduce");
    }

    @Test
    public void should_queryPrice_success()
    {
        //初始化数据
        request.setParameter("startingPlace", "天津");
        request.setParameter("destination", "上海");
        request.setParameter("orderId", "5678");

        Order order = new Order();
        order.setOrderId("5678");
        order.setProductId(123);

        Product product = new Product();
        product.setProductId(123);
        product.setQuantity(456.5f);

        List<LogisticsPrice> logisticsPriceList = new ArrayList<>();
        LogisticsPrice logisticsPrice = new LogisticsPrice();
        logisticsPrice.setDestination("上海");
        logisticsPrice.setPrice(100);
        logisticsPrice.setStartingPlace("天津");
        logisticsPrice.setWaybillCompanyId("12321");
        logisticsPrice.setWeight("100");
        logisticsPriceList.add(logisticsPrice);

        //录入行为
        EasyMock.expect(orderModel.queryCompanyIdByOrderId("5678")).andReturn(order);
        EasyMock.expect(orderModel.queryProduct(order.getProductId())).andReturn(product);
        EasyMock.expect(logisticsModel.priceGuide("天津", "上海", product.getQuantity())).andReturn(logisticsPriceList);
        EasyMock.expect(logisticsModel.sumcost(logisticsPriceList, product.getQuantity())).andReturn(new ArrayList<>(Arrays.asList(10000.1, 10000.2)));

        //记录回放
        EasyMock.replay(logisticsModel, orderModel);

        //执行业务逻辑
        orderController.queryPrice(request, response);
        EasyMock.verify(logisticsModel, orderModel);
    }

    @Test
    public void should_uploadImg_success_when_updateReceiptPath_is_true() throws IOException, FileUploadException
    {
        new File("src/test/resources/imgs/order/receipt/90002019010410184393.png").delete();
        //录入数据
        String orderId = "2019010410184393";

        Order order = new Order();
        order.setOrderId("2019010410184393");
        order.setTradePrice(270);
        order.setProductId(22);
        order.setBuyerCompanyId("911308037825919000");
        order.setSellerCompanyId("914113306672048026");
        order.setOrderState(0);

        Product product = new Product();
        product.setProductId(1);
        product.setProductState(1);
        product.setQuantity(100);
        product.setLowPower(3000);
        product.setPrice(100);
        product.setFullSulfur(100);
        product.setSrcAddress("山西");

        Company seller = new Company();
        seller.setCompanyId("9113080378259190000");
        seller.setCompanyName("国电承德热电有限公司");
        seller.setLegalPerson("郝剑宇");
        seller.setLegalPersonId("612321198701215000");

        Company buyer = new Company();
        buyer.setCompanyId("9113080378259191111");
        buyer.setCompanyName("承德热电有限公司");
        buyer.setLegalPerson("郝剑");
        buyer.setLegalPersonId("6123211987012111111");

        File file = new File("src/test/resources/imgs/ad/001.PNG");
        MultipartFile multipartFile = new MockMultipartFile(file.getName(), new FileInputStream(file));
        MultiValueMap<String, MultipartFile> multiFileMap = new LinkedMultiValueMap<>();
        multiFileMap.add("filename", multipartFile);
        ReflectionTestUtils.setField(multipartHttpServletRequest, "multipartFiles", multiFileMap);
        request = (MockHttpServletRequest) multipartHttpServletRequest;
        request.setParameter("photo", "12.png");
        //录入行为
        EasyMock.expect(orderModel.queryOrder(orderId)).andReturn(order);
        EasyMock.expect(orderModel.updateReceiptPath(order)).andReturn(true);
        EasyMock.expect(orderModel.queryProduct(order)).andReturn(product);
        EasyMock.expect(orderModel.queryBuyer(order)).andReturn(buyer);
        EasyMock.expect(orderModel.querySeller(order)).andReturn(seller);
        EasyMock.expect(servletContext.getRealPath("")).andReturn("D:/src/test/resources/a/b");
        EasyMock.expect(model.addAttribute("orderId", order.getOrderId())).andReturn(model);
        EasyMock.expect(model.addAttribute("result", "上传回执单成功")).andReturn(model);
        EasyMock.expect(model.addAttribute("order", order)).andReturn(model);
        EasyMock.expect(model.addAttribute("product", product)).andReturn(model);
        EasyMock.expect(model.addAttribute("buyer", buyer)).andReturn(model);
        EasyMock.expect(model.addAttribute("seller", seller)).andReturn(model);
        EasyMock.expect(model.addAttribute("path", "imgs/order/receipt/90002019010410184393.png")).andReturn(model);
        //记录回放
        EasyMock.replay(orderModel, servletContext, model);
        //执行业务逻辑
        orderController.uploadImg(orderId, model, multipartHttpServletRequest, response);
        EasyMock.verify(orderModel, servletContext, model);
        //结果有效性检验
        assertTrue(new File("src/test/resources/imgs/order/receipt/90002019010410184393.png").exists());
    }

    @Test
    public void should_uploadImg_success_when_updateReceiptPath_is_false() throws IOException, FileUploadException
    {
        new File("src/test/resources/imgs/order/receipt/90002019010410184393.png").delete();
        //录入数据
        String orderId = "2019010410184393";

        Order order = new Order();
        order.setOrderId("2019010410184393");
        order.setTradePrice(270);
        order.setProductId(22);
        order.setBuyerCompanyId("911308037825919000");
        order.setSellerCompanyId("914113306672048026");
        order.setOrderState(0);

        Product product = new Product();
        product.setProductId(1);
        product.setProductState(1);
        product.setQuantity(100);
        product.setLowPower(3000);
        product.setPrice(100);
        product.setFullSulfur(100);
        product.setSrcAddress("山西");

        Company seller = new Company();
        seller.setCompanyId("9113080378259190000");
        seller.setCompanyName("国电承德热电有限公司");
        seller.setLegalPerson("郝剑宇");
        seller.setLegalPersonId("612321198701215000");

        Company buyer = new Company();
        buyer.setCompanyId("9113080378259191111");
        buyer.setCompanyName("承德热电有限公司");
        buyer.setLegalPerson("郝剑");
        buyer.setLegalPersonId("6123211987012111111");

        File file = new File("src/test/resources/imgs/ad/001.PNG");
        MultipartFile multipartFile = new MockMultipartFile(file.getName(), new FileInputStream(file));
        MultiValueMap<String, MultipartFile> multiFileMap = new LinkedMultiValueMap<>();
        multiFileMap.add("filename", multipartFile);
        ReflectionTestUtils.setField(multipartHttpServletRequest, "multipartFiles", multiFileMap);
        request = (MockHttpServletRequest) multipartHttpServletRequest;
        request.setParameter("photo", "12.png");
        //录入行为
        EasyMock.expect(orderModel.queryOrder(orderId)).andReturn(order);
        EasyMock.expect(orderModel.updateReceiptPath(order)).andReturn(false);
        EasyMock.expect(orderModel.queryProduct(order)).andReturn(product);
        EasyMock.expect(orderModel.queryBuyer(order)).andReturn(buyer);
        EasyMock.expect(orderModel.querySeller(order)).andReturn(seller);
        EasyMock.expect(servletContext.getRealPath("")).andReturn("D:/src/test/resources/a/b");
        EasyMock.expect(model.addAttribute("orderId", order.getOrderId())).andReturn(model);
        EasyMock.expect(model.addAttribute("result", "上传回执单失败")).andReturn(model);
        EasyMock.expect(model.addAttribute("order", order)).andReturn(model);
        EasyMock.expect(model.addAttribute("product", product)).andReturn(model);
        EasyMock.expect(model.addAttribute("buyer", buyer)).andReturn(model);
        EasyMock.expect(model.addAttribute("seller", seller)).andReturn(model);
        EasyMock.expect(model.addAttribute("path", "imgs/order/receipt/90002019010410184393.png")).andReturn(model);
        //记录回放
        EasyMock.replay(orderModel, servletContext, model);
        //执行业务逻辑
        orderController.uploadImg(orderId, model, multipartHttpServletRequest, response);
        EasyMock.verify(orderModel, servletContext, model);
        //结果有效性检验
        assertTrue(new File("src/test/resources/imgs/order/receipt/90002019010410184393.png").exists());
    }

    @Test
    public void should_updateOrderState_fail_when_order_is_null()
    {
        String nextPage = orderController.updateOrderState(null, model);
        assertEquals("order/orderDetail", nextPage);
    }

    @Test
    public void should_updateOrderState_success_when_order_is_not_null()
    {
        Order order = new Order();
        order.setOrderState(2);
        Product product = new Product();
        Company buyer = new Company();
        Company seller = new Company();

        EasyMock.expect(orderModel.queryOrder("2019010410184393")).andReturn(order).times(6);
        orderModel.updateOrderStatus("2019010410184393", 2);
        EasyMock.expect(orderModel.queryProduct(order)).andReturn(product);
        EasyMock.expect(orderModel.queryBuyer(order)).andReturn(buyer);
        EasyMock.expect(orderModel.querySeller(order)).andReturn(seller);

        EasyMock.expect(model.addAttribute("order", order)).andReturn(model);
        EasyMock.expect(model.addAttribute("product", product)).andReturn(model);
        EasyMock.expect(model.addAttribute("buyer", buyer)).andReturn(model);
        EasyMock.expect(model.addAttribute("seller", seller)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderState", "待收货")).andReturn(model);

        EasyMock.replay(model, orderModel);
        String nextPage = orderController.updateOrderState("2019010410184393", model);
        EasyMock.verify(model, orderModel);

        assertEquals("order/orderDetail", nextPage);
    }

    @Test
    public void should_detail_fail_when_order_is_null()
    {
        //初始化数据
        Order order = new Order();
        order.setOrderId("2019010410184393");
        String orderID = "0";
        //录入行为
        EasyMock.expect(orderModel.queryOrder(orderID)).andReturn(null);
        //记录回放
        EasyMock.replay(orderModel);
        //执行业务逻辑
        String str = orderController.detail("0", model);
        EasyMock.verify(orderModel);
        //结果有效性验证
        assertEquals("order/orderDetail", str);


    }

    @Test
    public void should_detail_success_when_orderId_is_not_null()
    {   //初始化数据
        Order order = new Order();
        order.setOrderId("2019010410184393");
        order.setOrderState(1);
        String orderID = order.getOrderId();
        Company company = new Company();
        Product product = new Product();
        HashMap orderState = new HashMap();
        orderState.put(1, "待发货");

        //录入行为
        EasyMock.expect(orderModel.queryOrder(orderID)).andReturn(order);
        EasyMock.expect(orderModel.querySeller(order)).andReturn(company);
        EasyMock.expect(orderModel.queryBuyer(order)).andReturn(company);
        EasyMock.expect(orderModel.queryProduct(order)).andReturn(product);

        EasyMock.expect(model.addAttribute("order", order)).andReturn(model);
        EasyMock.expect(model.addAttribute("product", product)).andReturn(model);
        EasyMock.expect(model.addAttribute("buyer", company)).andReturn(model);
        EasyMock.expect(model.addAttribute("seller", company)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderState", orderState.get(order.getOrderState()))).andReturn(model);
        //记录回放
        EasyMock.replay(orderModel, model);
        //执行业务逻辑
        String str = orderController.detail(orderID, model);

        EasyMock.verify(orderModel, model);

        //结果有效性验证
        assertEquals("order/orderDetail", str);

    }

    @After
    public void tearDown() throws Exception
    {
        new File("src/test/resources/imgs/order/receipt/90002019010410184393.png").delete();
    }
}