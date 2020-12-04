package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IProductModel;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.ArrayList;

import com.isscollege.gdce.model.ITradeModel;
import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.Model;

import static org.junit.Assert.*;

public class ProductControllerTest
{
    private ProductController productController = null;
    private IProductModel productModel = null;
    private MockHttpSession session = null;
    private MockHttpServletRequest request = null;
    private ITradeModel iTradeModel = null;

    @Before
    public void setUp()
    {
        this.session = new MockHttpSession();
        this.productController = new ProductController();
        //创建代理对象（模拟对象行为）
        this.productModel = EasyMock.createMock(IProductModel.class);
        this.request = new MockHttpServletRequest();
        this.iTradeModel = EasyMock.createMock(ITradeModel.class);
        //通过反射机制动态注入bean对象
        ReflectionTestUtils.setField(productController, "productModel", productModel);
        ReflectionTestUtils.setField(productController,"detailModel",iTradeModel);
    }

    @Test
    public void should_updateProduct_is_fail_when_productsList_is_null()
    {
        EasyMock.expect(productModel.getIndexProductInfo()).andReturn(null);

        EasyMock.replay(productModel);
        String nextPage = productController.updateProduct(1, null, null);
        EasyMock.verify(productModel);

        assertEquals("product/updateProduct", nextPage);
    }

    @Test
    public void should_updateProduct_is_success_when_productsList_is_not_null_and_id_is_1()
    {
        Model model = EasyMock.createMock(Model.class);
        List<Product> productsList = new ArrayList<>();
        Product product1 = new Product();
        Product product2 = new Product();
        Product product3 = new Product();

        product1.setId(1);
        product1.setProductState(1);
        product1.setProductState(1);
        product1.setQuantity(100.00f);
        product1.setLowPower(3000);
        product1.setPrice(120.00f);
        product1.setFullMoisture(10.00f);
        product1.setFullSulfur(26.00f);
        product1.setSrcAddress("山西");
        product1.setVolatiles("26-30");
        product1.setUserName("seller1");
        product1.setReviewState(1);
        product1.setCarriage(20.00f);
        product1.setPortAddress("秦皇岛");
        product1.setDryPowder(26.00f);

        product2.setId(2);
        product2.setProductState(2);
        product2.setProductState(2);
        product2.setQuantity(5.00f);
        product2.setLowPower(3100);
        product2.setPrice(110.00f);
        product2.setFullMoisture(1.20f);
        product2.setFullSulfur(23.00f);
        product2.setSrcAddress("内蒙");
        product2.setVolatiles("15-28");
        product2.setUserName("seller1");
        product2.setReviewState(1);
        product2.setCarriage(22.00f);
        product2.setPortAddress("秦皇岛");
        product2.setDryPowder(26.00f);

        product3.setId(3);
        product3.setProductState(3);
        product3.setProductState(0);
        product3.setQuantity(6.00f);
        product3.setLowPower(2800);
        product3.setPrice(130.00f);
        product3.setFullMoisture(1.30f);
        product3.setFullSulfur(15.00f);
        product3.setSrcAddress("惠农");
        product3.setVolatiles("23-27");
        product3.setUserName("seller1");
        product3.setReviewState(1);
        product3.setCarriage(25.00f);
        product3.setPortAddress("秦皇岛");
        product3.setDryPowder(26.00f);

        productsList.add(product1);
        productsList.add(product2);
        productsList.add(product3);

        EasyMock.expect(productModel.getIndexProductInfo()).andReturn(productsList);
        EasyMock.expect(model.addAttribute("product", product1)).andReturn(model);

        EasyMock.replay(model, productModel);
        String nextPage = productController.updateProduct(1, model, session);
        EasyMock.verify(model, productModel);

        assertEquals(1, session.getAttribute("id"));
        assertEquals("product/updateProduct", nextPage);
    }

    @Test
    public void should_updateProduct_is_fail_when_productsList_is_not_null_but_id_is_4()
    {
        List<Product> productsList = new ArrayList<>();
        Product product1 = new Product();
        Product product2 = new Product();
        Product product3 = new Product();

        product1.setId(1);
        product1.setProductState(1);
        product1.setProductState(1);
        product1.setQuantity(100.00f);
        product1.setLowPower(3000);
        product1.setPrice(120.00f);
        product1.setFullMoisture(10.00f);
        product1.setFullSulfur(26.00f);
        product1.setSrcAddress("山西");
        product1.setVolatiles("26-30");
        product1.setUserName("seller1");
        product1.setReviewState(1);
        product1.setCarriage(20.00f);
        product1.setPortAddress("秦皇岛");
        product1.setDryPowder(26.00f);

        product2.setId(2);
        product2.setProductState(2);
        product2.setProductState(2);
        product2.setQuantity(5.00f);
        product2.setLowPower(3100);
        product2.setPrice(110.00f);
        product2.setFullMoisture(1.20f);
        product2.setFullSulfur(23.00f);
        product2.setSrcAddress("内蒙");
        product2.setVolatiles("15-28");
        product2.setUserName("seller1");
        product2.setReviewState(1);
        product2.setCarriage(22.00f);
        product2.setPortAddress("秦皇岛");
        product2.setDryPowder(26.00f);

        product3.setId(3);
        product3.setProductState(3);
        product3.setProductState(0);
        product3.setQuantity(6.00f);
        product3.setLowPower(2800);
        product3.setPrice(130.00f);
        product3.setFullMoisture(1.30f);
        product3.setFullSulfur(15.00f);
        product3.setSrcAddress("惠农");
        product3.setVolatiles("23-27");
        product3.setUserName("seller1");
        product3.setReviewState(1);
        product3.setCarriage(25.00f);
        product3.setPortAddress("秦皇岛");
        product3.setDryPowder(26.00f);

        productsList.add(product1);
        productsList.add(product2);
        productsList.add(product3);

        EasyMock.expect(productModel.getIndexProductInfo()).andReturn(productsList);

        EasyMock.replay(productModel);
        String nextPage = productController.updateProduct(4, null, null);
        EasyMock.verify(productModel);

        assertEquals("product/updateProduct", nextPage);
    }

    @Test
    public void should_query_is_success_when_user_is_not_null()
    {
        User user = new User("admin", "admin", true);
        session.setAttribute("currentUser", user);
        //录入行为
        EasyMock.expect(productModel.getProductInfoByName(user.getName())).andReturn(new ArrayList<>());
        EasyMock.expect(productModel.getAuditingProductInfo()).andReturn(new ArrayList<>());
        //记录回放
        EasyMock.replay(productModel);
        //执行业务逻辑
        String result = productController.query(session);
        EasyMock.verify(productModel);
        //结果有效性检验
        assertEquals(session.getAttribute("productUserList"), new ArrayList<Product>());
        assertEquals(session.getAttribute("auditingProductList"), new ArrayList<Product>());
        assertEquals("product/managing", result);
    }

    @Test
    public void should_query_is_fail_when_user_is_null()
    {
        session.setAttribute("currentUser", null);
        //执行业务逻辑
        String result = productController.query(session);
        //结果有效性检验
        assertEquals("product/managing", result);
    }

    @Test
    public void should_insert_success_when_data_is_valid_and_max_product_id_exists() throws Exception
    {
        Product product = new Product();
        Product maxProduct = new Product();
        maxProduct.setProductId(20);

        session.setAttribute("currentUser", new User("admin", "admin", false));
        EasyMock.expect(productModel.getMaxProductId()).andReturn(maxProduct).times(2);
        EasyMock.expect(productModel.insertProduct(product)).andReturn(1);

        EasyMock.replay(productModel);
        String infoPage = productController.insert(product, session);
        EasyMock.verify(productModel);

        assertEquals(21, product.getProductId());
        assertEquals(1, product.getProductState());
        assertEquals(0, product.getReviewState());
        assertNotNull(product.getSubmitDate());
        assertNotNull(product.getRecordID());
        assertEquals("redirect:query", infoPage);
    }

    @Test
    public void should_insert_success_when_data_is_valid_and_max_product_id_not_exists() throws Exception
    {
        Product product = new Product();
        session.setAttribute("currentUser", new User("admin", "admin", false));

        EasyMock.expect(productModel.getMaxProductId()).andReturn(null);
        EasyMock.expect(productModel.insertProduct(product)).andReturn(0);

        EasyMock.replay(productModel);
        String infoPage = productController.insert(product, session);
        EasyMock.verify(productModel);

        assertEquals(1, product.getProductId());
        assertEquals(1, product.getProductState());
        assertEquals(0, product.getReviewState());
        assertNotNull(product.getSubmitDate());
        assertNotNull(product.getRecordID());
        assertEquals("redirect:query", infoPage);
    }

    @Test
    public void should_insert_continue_when_user_is_not_valid() throws Exception
    {
        session.setAttribute("currentUser", null);
        assertEquals("redirect:query", productController.insert(new Product(), session));
    }

    @Test
    public void should_update_is_success_when_user_is_not_null()
    {
        Product product = new Product();
        User currentUser = new User();

        currentUser.setName("张三");
        session.setAttribute("id", 2);
        session.setAttribute("currentUser", currentUser);

        EasyMock.expect(productModel.updateProduct(product)).andReturn(true);
        //记录回放
        EasyMock.replay(productModel);
        String nextPage = productController.update(product, session);
        //执行业务逻辑
        EasyMock.verify(productModel);
        //结果有效性检验
        assertEquals(2, product.getId());
        assertEquals("张三", product.getUserName());
        assertEquals(1, product.getProductState());
        assertEquals(0, product.getReviewState());
        assertEquals("redirect:query", nextPage);
    }

    @Test
    public void should_update_is_fail_when_user_is_null()
    {
        session.setAttribute("currentUser", null);
        //执行业务逻辑
        String nextPage = productController.update(new Product(), session);
        //结果有效性检验
        assertEquals("redirect:query", nextPage);
    }

    @Test
    public void should_productId_is_success_when_productId_is_1() throws UnsupportedEncodingException
    {
        //构造数据
        Product product = new Product();
        product.setId(1);
        String phoneNumber = "18918918918";
        request.setSession(session);
        //录入
        EasyMock.expect(iTradeModel.getProductInfoById(1)).andReturn(product);
        EasyMock.expect(iTradeModel.getPhoneNumber(1)).andReturn(phoneNumber);
        //记录回放
        EasyMock.replay(iTradeModel);
        //执行业务逻辑
        String result = productController.productId(1,request);
        //验证
        EasyMock.verify(iTradeModel);
        //结果有效性检验
        assertNotNull(session.getAttribute("product"));
        assertEquals(1,((Product)(session.getAttribute("product"))).getId());
        assertEquals(phoneNumber,session.getAttribute("phoneNumber"));

    }

}
