package com.isscollege.gdce.controller;
import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IContractModel;
import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class ContractControllerTest
{
    private ContractController contractController = null;
    private MockHttpSession session = null;
    private MockHttpServletRequest request = null;
    private MockHttpServletResponse response = null;
    private IContractModel contractModel= null;

    @Before
    public void setUp() throws Exception {
        contractController = new ContractController();
        request = new MockHttpServletRequest();
        response = new MockHttpServletResponse();
        session = new MockHttpSession();
        contractModel = EasyMock.createMock(IContractModel.class);
        ReflectionTestUtils.setField(contractController,"contractModel",contractModel);
    }

    @Test
    public void should_ensurelist_is_success_when_state_is_not_zero() throws Exception
    {
        //构造数据
        int ensureId = 1;
        Contract contract1 = new Contract();
        contract1.setContractId(104101740);
        Contract contract2 = new Contract();
        contract2.setContractId(104101650);
        Contract contract3 = new Contract();
        contract3.setContractId(104105145);
        //模拟session中的合同列表
        List<Contract> contracts = new ArrayList<>();
        contracts.add(contract1);
        contracts.add(contract2);
        contracts.add(contract3);
        session.setAttribute("contracts",contracts);
        request.setSession(session);
        //模拟取出
        List<Contract> contractList = (List<Contract>) session.getAttribute("contracts");
        Contract contract = contractList.get(ensureId);
        //录入行为
        EasyMock.expect(contractModel.updateState(contract,
                Long.toString(contract.getContractId()))).andReturn(1); //期待state为非0时,合同签订成功
        //回放
        EasyMock.replay(contractModel);
        //执行逻辑
        contractController.ensurelist(ensureId,session,request,response);
        //验证
        EasyMock.verify(contractModel);
        //结果有效性验证
        assertNotEquals(request.getAttribute("message"),"合同签订失败，请重新确认");
    }

    
    @Test
    public void should_ensurelist_is_not_success_when_state_is_zero() throws Exception
    {
        //构造数据
        int ensureId = 1;
        Contract contract1 = new Contract();
        contract1.setContractId(104101740);
        Contract contract2 = new Contract();
        contract2.setContractId(104101650);
        Contract contract3 = new Contract();
        contract3.setContractId(104105145);
        //模拟session中的合同列表
        List<Contract> contracts = new ArrayList<>();
        contracts.add(contract1);
        contracts.add(contract2);
        contracts.add(contract3);
        session.setAttribute("contracts",contracts);
        request.setSession(session);
        //模拟取出
        List<Contract> contractList = (List<Contract>) session.getAttribute("contracts");
        Contract contract = contractList.get(ensureId);
        //录入行为
        EasyMock.expect(contractModel.updateState(contract,
                Long.toString(contract.getContractId()))).andReturn(0); //期待state为0时,合同签订失败
        //回放
        EasyMock.replay(contractModel);
        //执行逻辑
        contractController.ensurelist(ensureId,session,request,response);
        //验证
        EasyMock.verify(contractModel);
        //结果有效性验证
        assertEquals(request.getAttribute("message"),"合同签订失败，请重新确认");
    }



	@Test
    public void should_insertContract_fail_when_insert_is_error()
    {
        Contract contract = new Contract();
        session.setAttribute("contract",contract);
        //录入行为
        EasyMock.expect(contractModel.addContract(contract)).andReturn(false);
        //记录回放
        EasyMock.replay(contractModel);
        //执行业务逻辑
        String result = contractController.insertContract(session);
        EasyMock.verify(contractModel);
        //结果有效性检验
        assertEquals(result,"/trade/delist");
    }


	@Test
    public void should_insertContract_success_when_insert_success()
    {
        Contract contract = new Contract();
        session.setAttribute("contract",contract);
        //录入行为
        EasyMock.expect(contractModel.addContract(contract)).andReturn(true);
        //记录回放
        EasyMock.replay(contractModel);
        //执行业务逻辑
        String result = contractController.insertContract(session);
        EasyMock.verify(contractModel);
        //结果有效性检验
        assertEquals(result,"/contract/success");
    }



    @Test
    public void should_querylist_success_when_companyID_is_not_empty()
    {
        User user = new User();
        user.setCompanyId("123");
        session.setAttribute("currentUser",user);
        //录入行为
        EasyMock.expect(contractModel.querConstractById(((User) session.getAttribute("currentUser")).getCompanyId(), 0))
                .andReturn(new ArrayList<Contract>());

        //记录回放
        EasyMock.replay(contractModel);
        //执行业务逻辑
        contractController.querylist(1,session);
        EasyMock.verify(contractModel);
        //结果有效性检验
        assertEquals(session.getAttribute("hasResult"),true);
    }

    @Test
    public void should_querylist_fail_when_companyID_is_empty()
    {
        User user = new User();
        session.setAttribute("currentUser",user);
        contractController.querylist(1,session);
        //结果有效性检验
        assertNull(session.getAttribute("hasResult"));
    }

    @Test
    public void should_updateProductState_fail_when_product_is_empty()
    {
        User user = new User();
        session.setAttribute("product",user);
        EasyMock.replay(contractModel);
        //执行业务逻辑
        String result = contractController.updateProductState(session);
        EasyMock.verify(contractModel);
        //结果有效性校验
        assertEquals("index",result);
    }

    @Test
    public void should_updateProductState_success_when_product_isnot_empty()
    {
        Product product = new Product();
        session.setAttribute("product",product);
        //录入行为
        EasyMock.expect(contractModel.updateProductStatezero((Product)session.getAttribute("product"))).andReturn(true);
        //记录回放
        EasyMock.replay(contractModel);
        //执行业务逻辑
        String result = contractController.updateProductState(session);
        EasyMock.verify(contractModel);
        //结果有效性校验
        assertEquals("index",result);
    }
}