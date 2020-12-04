package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.ITradeModel;
import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.Assert.*;

public class TradeControllerTest
{
    private TradeController controller = null;
    private ITradeModel tradeModel = null;
    private MockHttpSession session = null;

    @Before
    public void setUp()
    {
        controller = new TradeController();
        session = new MockHttpSession();
        //创建代理对象（模拟对象行为）
        tradeModel = EasyMock.createMock(ITradeModel.class);
        //通过反射机制动态注入bean对象
        ReflectionTestUtils.setField(controller, "tradeModel", tradeModel);
    }

    @Test
    public void should_checkDelist_is_success() throws Exception
    {
        Product product = new Product();
        //录入行为
        EasyMock.expect(tradeModel.getProductInfoById(1)).andReturn(product);
        //记录回放
        EasyMock.replay(tradeModel);
        //执行业务逻辑
        String result = controller.checkDelist(1, session);
        EasyMock.verify(tradeModel);
        //结果有效性检验
        assertEquals(session.getAttribute("product"), product);
        assertEquals("trade/delist", result);
    }

    @Test
    public void should_productToContract_is_success_when_product_is_not_null_and_cueerntUser_is_not_null() throws Exception
    {
        String sellerCompanyId = "914113306672048026";
        Product product = new Product();
        product.setProductId(1);
        product.setUserName("seller1");
        User currentUser = new User();
        currentUser.setCompanyId(sellerCompanyId);
        Contract contract = new Contract();
        contract.setBuyerCompanyId(currentUser.getCompanyId());
        contract.setProductId(product.getProductId());
        session.setAttribute("product", product);
        session.setAttribute("currentUser", currentUser);
        session.setAttribute("contract", contract);
        session.setMaxInactiveInterval(60 * 60);

        EasyMock.expect(tradeModel.updateProductState(product.getProductId())).andReturn(true);
        EasyMock.expect(tradeModel.getCompanyIdByName(product.getUserName())).andReturn(sellerCompanyId);

        EasyMock.replay(tradeModel);
        String nextJumpPage = controller.productToContract(session, contract);
        EasyMock.verify(tradeModel);

        assertEquals("914113306672048026", sellerCompanyId);
        assertEquals("/contract/contract", nextJumpPage);
    }

    @Test
    public void should_productToContract_is_success_when_product_is_not_null_and_cueerntUser_is_null() throws Exception
    {
        Contract contract = new Contract();
        Product product = new Product();
        product.setProductId(1);
        product.setUserName("seller1");

        session.setAttribute("product", product);
        session.setAttribute("currentUser", null);
        session.setAttribute("contract", null);

        assertEquals("/contract/contract", controller.productToContract(session, contract));
    }
}
