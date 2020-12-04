package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.domain.WaybillInfo;
import com.isscollege.gdce.model.ILogisticsModel;
import com.isscollege.gdce.model.IOrderModel;
import com.isscollege.gdce.domain.LogisticsInfo;
import org.easymock.EasyMock;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.Model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class LogisticsControllerTest
{
    private LogisticsController logisticsController = null;
    private MockHttpSession session = null;
    private ILogisticsModel logisticsModel = null;
    private IOrderModel orderModel = null;
    private Model model = null;

    @Before
    public void setUp()
    {
        logisticsController = new LogisticsController();
        //创建代理对象
        session = new MockHttpSession();
        model = EasyMock.createMock(Model.class);
        logisticsModel = EasyMock.createMock(ILogisticsModel.class);
        orderModel = EasyMock.createMock(IOrderModel.class);
        //注入
        ReflectionTestUtils.setField(logisticsController, "logisticsModel", logisticsModel);
        ReflectionTestUtils.setField(logisticsController, "orderModel", orderModel);
        ReflectionTestUtils.setField(logisticsController, "userId", null);
    }

    @Test
    public void should_query_success_when_waybillState_is_SHIP_STATE() throws IOException
    {
        //模拟数据
        String state1 = "";
        int currentPage = 0;
        String waybillState = "0";//待发货
        User user = new User();
        WaybillInfo w1 = new WaybillInfo();
        WaybillInfo w2 = new WaybillInfo();
        List<WaybillInfo> waybillList = new ArrayList<>();
        List<WaybillInfo> waybillListAll = new ArrayList<>();
        waybillList.add(w1);
        waybillList.add(w2);
        waybillListAll.addAll(waybillList);
        session.setAttribute("currentUser", user);
        //记录期待
        EasyMock.expect(logisticsModel.queryWaybillOnPage((currentPage - 1) * 9, waybillState, null)).andReturn(waybillList);
        EasyMock.expect(logisticsModel.queryWaybillByState(waybillState, null))
                .andReturn(waybillListAll);
        int totalPages = waybillListAll.size() % 9 == 0 ? waybillListAll.size() / 9
                : waybillListAll.size() / 9 + 1;
        EasyMock.expect(model.addAttribute("totalPages", totalPages)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillstate", "待发货")).andReturn(model);
        //回放
        EasyMock.replay(model, logisticsModel);
        //执行逻辑
        String result = logisticsController.query(session, model, state1, waybillState, currentPage);
        //验证
        EasyMock.verify(model, logisticsModel);
        //结果有效性校验
        Assert.assertEquals("logistics/waybillConfirm", result);
    }

    @Test
    public void should_query_success_when_waybillState_is_SIGNED_STATE() throws IOException
    {
        //模拟数据
        String state1 = "";
        int currentPage = 0;
        String waybillState = "3";//已签收
        User user = new User();
        WaybillInfo w1 = new WaybillInfo();
        WaybillInfo w2 = new WaybillInfo();
        List<WaybillInfo> waybillList = new ArrayList<>();
        List<WaybillInfo> waybillListAll = new ArrayList<>();
        waybillList.add(w1);
        waybillList.add(w2);
        waybillListAll.addAll(waybillList);
        session.setAttribute("currentUser", user);
        //记录期待
        EasyMock.expect(logisticsModel.queryWaybillOnPage((currentPage - 1) * 9, waybillState, null)).andReturn(waybillList);
        EasyMock.expect(logisticsModel.queryWaybillByState(waybillState, null))
                .andReturn(waybillListAll);
        int totalPages = waybillListAll.size() % 9 == 0 ? waybillListAll.size() / 9
                : waybillListAll.size() / 9 + 1;
        EasyMock.expect(model.addAttribute("totalPages", totalPages)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillstate", "已签收")).andReturn(model);
        //回放
        EasyMock.replay(model, logisticsModel);
        //执行逻辑
        String result = logisticsController.query(session, model, state1, waybillState, currentPage);
        //验证
        EasyMock.verify(model, logisticsModel);
        //结果有效性校验
        Assert.assertEquals("logistics/waybillFinish", result);
    }


    @Test
    public void should_query_success_when_waybillState_is_TRANSPORT_STATE() throws IOException
    {
        //模拟数据
        String state1 = "";
        int currentPage = 0;
        String waybillState = "1";//运输中
        User user = new User();
        WaybillInfo w1 = new WaybillInfo();
        WaybillInfo w2 = new WaybillInfo();
        List<WaybillInfo> waybillList = new ArrayList<>();
        List<WaybillInfo> waybillListAll = new ArrayList<>();
        waybillList.add(w1);
        waybillList.add(w2);
        waybillListAll.addAll(waybillList);
        session.setAttribute("currentUser", user);
        //记录期待
        EasyMock.expect(logisticsModel.queryWaybillOnPageByTwoState((currentPage - 1) * 9,
                waybillState, state1, null)).andReturn(waybillList);
        EasyMock.expect(logisticsModel.queryWaybillByTwoState(waybillState, state1, null))
                .andReturn(waybillListAll);
        int totalPages = waybillListAll.size() % 9 == 0 ? waybillListAll.size() / 9
                : waybillListAll.size() / 9 + 1;
        EasyMock.expect(model.addAttribute("waybillStateArray", new String[9])).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", totalPages)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        //回放
        EasyMock.replay(model, logisticsModel);
        //执行逻辑
        String result = logisticsController.query(session, model, state1, waybillState, currentPage);
        //验证
        EasyMock.verify(model, logisticsModel);
        //结果有效性校验
        Assert.assertEquals("logistics/waybillTransport", result);
    }

    @Test
    public void should_query_fail_when_waybillState_is_incorrect() throws IOException
    {
        //模拟数据
        String state1 = "";
        int currentPage = 0;
        String waybillState = "";//无状态
        User user = new User();
        session.setAttribute("currentUser", user);
        //执行逻辑
        String result = logisticsController.query(session, model, state1, waybillState, currentPage);
        //结果有效性校验
        Assert.assertEquals("logistics/waybillConfirm", result);
    }

    @Test
    public void should_queryOrder_is_success_when_currentPage_is_1_and_orderListAllSize_is_0() throws Exception
    {
        User user = new User("tester", "123", false);
        user.setCompanyId("123");
        user.setPermission("1");
        session.setAttribute("currentUser", user);

        List<Order> orderList = new ArrayList<>();
        List<Order> orderListAll = new ArrayList<>();
        String[] orderStateArray = new String[9];

        EasyMock.expect(logisticsModel.queryOrderOnPage(0, user.getCompanyId())).andReturn(orderList);
        EasyMock.expect(logisticsModel.queryOrderAll(user.getCompanyId())).andReturn(orderListAll);
        EasyMock.expect(model.addAttribute("totalPages", 0)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderList", orderList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", false)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderStateArray", orderStateArray)).andReturn(model);

        EasyMock.replay(logisticsModel, model);
        String nextPage = logisticsController.queryOrder(session, model, 1);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillorder", nextPage);
        Assert.assertEquals(user, session.getAttribute("currentUser"));
    }

    @Test
    public void should_queryOrder_is_success_when_currentPage_is_1_and_orderListAllSize_is_not_over_9() throws Exception
    {
        User user = new User("logistics", "123", false);
        user.setCompanyId("91130302MA07RJW223");
        user.setPermission("3");
        session.setAttribute("currentUser", user);

        List<Order> orderList = new ArrayList<>();

        List<Order> orderListAll = new ArrayList<>();
        String[] orderStateArray = new String[9];

        Order order0 = new Order();
        order0.setOrderState(0);
        orderStateArray[0] = "待付款";
        orderList.add(order0);
        orderListAll.add(order0);

        Order order1 = new Order();
        order1.setOrderState(1);
        orderStateArray[1] = "待发货";
        orderList.add(order1);
        orderListAll.add(order1);

        EasyMock.expect(logisticsModel.queryOrderOnPage(0, user.getCompanyId())).andReturn(orderList);
        EasyMock.expect(logisticsModel.queryOrderAll(user.getCompanyId())).andReturn(orderListAll);
        EasyMock.expect(model.addAttribute("totalPages", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderList", orderList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderStateArray", orderStateArray)).andReturn(model);

        EasyMock.replay(logisticsModel, model);
        String nextPage = logisticsController.queryOrder(session, model, 1);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillorder", nextPage);
        Assert.assertEquals(user, session.getAttribute("currentUser"));
    }

    @Test
    public void should_queryOrder_is_success_when_currentPage_is_1_and_orderListAllSize_is_over_9() throws Exception
    {
        User user = new User("buyer1", "123", false);
        user.setCompanyId("911308037825919000");
        user.setPermission("1");
        session.setAttribute("currentUser", user);

        List<Order> orderList = new ArrayList<>();
        List<Order> orderListAll = new ArrayList<>();
        String[] orderStateArray = new String[9];

        Order order0 = new Order();
        order0.setOrderState(0);
        orderStateArray[0] = "待付款";
        orderList.add(order0);
        orderListAll.add(order0);

        Order order1 = new Order();
        order1.setOrderState(1);
        orderStateArray[1] = "待发货";
        orderList.add(order1);
        orderListAll.add(order1);

        Order order2 = new Order();
        order2.setOrderState(2);
        orderStateArray[2] = "待收货";
        orderList.add(order2);
        orderListAll.add(order2);

        Order order3 = new Order();
        order3.setOrderState(3);
        orderStateArray[3] = "待验收";
        orderList.add(order3);
        orderListAll.add(order3);

        Order order4 = new Order();
        order4.setOrderState(4);
        orderStateArray[4] = "完成";
        orderList.add(order4);
        orderListAll.add(order4);

        Order order5 = new Order();
        order5.setOrderState(0);
        orderStateArray[5] = "待付款";
        orderList.add(order5);
        orderListAll.add(order5);

        Order order6 = new Order();
        order6.setOrderState(1);
        orderStateArray[6] = "待发货";
        orderList.add(order6);
        orderListAll.add(order6);

        Order order7 = new Order();
        order7.setOrderState(2);
        orderStateArray[7] = "待收货";
        orderList.add(order7);
        orderListAll.add(order7);

        Order order8 = new Order();
        order8.setOrderState(3);
        orderStateArray[8] = "待验收";
        orderList.add(order8);
        orderListAll.add(order8);

        Order order9 = new Order();
        orderListAll.add(order9);

        EasyMock.expect(logisticsModel.queryOrderOnPage(0, user.getCompanyId())).andReturn(orderList);
        EasyMock.expect(logisticsModel.queryOrderAll(user.getCompanyId())).andReturn(orderListAll);
        EasyMock.expect(model.addAttribute("totalPages", 2)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderList", orderList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderStateArray", orderStateArray)).andReturn(model);

        EasyMock.replay(logisticsModel, model);
        String nextPage = logisticsController.queryOrder(session, model, 1);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillorder", nextPage);
        Assert.assertEquals(user, session.getAttribute("currentUser"));
    }

    @Test
    public void should_queryOrder_is_success_when_currentPage_is_2_and_orderListAllSize_is_over_9() throws Exception
    {
        User user = new User("buyer1", "123", false);
        user.setCompanyId("911308037825919000");
        user.setPermission("1");
        session.setAttribute("currentUser", user);

        List<Order> orderList = new ArrayList<>();
        List<Order> orderListAll = new ArrayList<>();
        String[] orderStateArray = new String[9];

        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());
        orderListAll.add(new Order());

        Order order = new Order();
        order.setOrderState(0);
        orderStateArray[0] = "待付款";
        orderList.add(order);
        orderListAll.add(order);

        EasyMock.expect(logisticsModel.queryOrderOnPage(9, user.getCompanyId())).andReturn(orderList);
        EasyMock.expect(logisticsModel.queryOrderAll(user.getCompanyId())).andReturn(orderListAll);
        EasyMock.expect(model.addAttribute("totalPages", 2)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", 2)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderList", orderList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("orderStateArray", orderStateArray)).andReturn(model);

        EasyMock.replay(logisticsModel, model);
        String nextPage = logisticsController.queryOrder(session, model, 2);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillorder", nextPage);
        Assert.assertEquals(user, session.getAttribute("currentUser"));
    }

    @Test
    public void should_updateWaybillState_is_success_when_waybillId_is_not_null_and_orderId_is_not_null()
    {
        //录入行为
        String waybillId = "20190104101857W223";
        String orderId = "2019010410184393";
        EasyMock.expect(logisticsModel.updateWaybillState("3", waybillId)).andReturn(true);
        orderModel.updateOrderStatus(orderId, 4);
        EasyMock.expectLastCall();
        //记录回放
        EasyMock.replay(logisticsModel, orderModel);
        //执行业务逻辑
        String result = logisticsController.updateWaybillOrderState(waybillId, orderId);
        EasyMock.verify(logisticsModel, orderModel);
        //结果有效性检验
        Assert.assertEquals("redirect:follow?&waybillId=20190104101857W223&orderId=2019010410184393", result);
    }

    @Test
    public void should_changeState_is_success_when_updateWaybillState_is_true()
    {
        //构造数据
        String waybillState = "1";
        String waybillId = "123";
        int currentPage = 10;
        User user = new User();
        List<WaybillInfo> waybillList = new ArrayList<>();
        waybillList.add(new WaybillInfo());//使waybillList的size()大于0，覆盖分支
        List<WaybillInfo> waybillListAll = new ArrayList<>();//使waybillListAll的size()为0，覆盖分支
        session.setAttribute("currentUser", user);
        //期待返回
        EasyMock.expect(logisticsModel.updateWaybillState("2", waybillId)).andReturn(true);
        EasyMock.expect(logisticsModel.queryWaybillOnPage(81, waybillState, null)).andReturn(waybillList);
        EasyMock.expect(logisticsModel.queryWaybillByState(waybillState, null)).andReturn(waybillListAll);
        EasyMock.expect(model.addAttribute("msg", "运单确认成功")).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", 10)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", 10)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillstate", "待发货")).andReturn(model);
        //回放
        EasyMock.replay(logisticsModel, model);
        //执行逻辑
        String result = logisticsController.changeState(session, model, waybillId, waybillState, currentPage);
        //验证
        EasyMock.verify(logisticsModel, model);
        //结果有效性校验
        Assert.assertEquals("logistics/waybillConfirm", result);
    }

    @Test
    public void should_changeState_is_fail_when_updateWaybillState_is_false()
    {
        //构造数据
        String waybillState = "2";
        String waybillId = "123";
        int currentPage = 10;
        User user = new User();
        List<WaybillInfo> waybillList = new ArrayList<>();//使waybillList的size()为0，不进入if语句
        List<WaybillInfo> waybillListAll = new ArrayList<>();//使waybillListAll的size()为9，不进入if语句
        for (int i = 0; i < 9; i++)
        {
            waybillListAll.add(new WaybillInfo());
        }
        session.setAttribute("currentUser", user);
        //期待返回
        EasyMock.expect(logisticsModel.updateWaybillState("3", waybillId)).andReturn(false);
        EasyMock.expect(logisticsModel.queryWaybillOnPage(81, waybillState, null)).andReturn(waybillList);
        EasyMock.expect(logisticsModel.queryWaybillByState(waybillState, null)).andReturn(waybillListAll);
        EasyMock.expect(model.addAttribute("msg", "运单确认失败")).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("page", 10)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", false)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillstate", "待发货")).andReturn(model);
        //回放
        EasyMock.replay(logisticsModel, model);
        //执行逻辑
        String result = logisticsController.changeState(session, model, waybillId, waybillState, currentPage);
        //验证
        EasyMock.verify(logisticsModel, model);
        //结果有效性校验
        Assert.assertEquals("logistics/waybillConfirm", result);
    }


    @Test
    public void should_insert_no_result_when_logisticsInfo_getLocation_is_null_and_totalPages_is_0()
    {
        User user = new User();
        user.setCompanyId("911308037825919000");
        session.setAttribute("currentUser", user);
        LogisticsInfo logisticsInfo = new LogisticsInfo();
        logisticsInfo.setLocation("");

        String waybillState = "0";
        String state1 = "0";

        List<WaybillInfo> waybillListAll = new ArrayList<>();
        List<WaybillInfo> waybillList = new ArrayList<>();

        int currentPage = 3;

        EasyMock.expect(logisticsModel.queryWaybillByTwoState
                ("0", "0", user.getCompanyId())).andReturn(waybillListAll);
        EasyMock.expect(logisticsModel.queryWaybillOnPageByTwoState
                (18, waybillState, state1, user.getCompanyId())).andReturn(waybillList);

        EasyMock.expect(model.addAttribute("resultMessage", "")).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", false)).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", 3)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillStateArray", new String[9])).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);

        EasyMock.replay(logisticsModel, model);

        String result = logisticsController.insert(session, model, logisticsInfo, state1, waybillState, 3);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillTransport", result);
    }

    @Test
    public void should_insert_no_result_when_logisticsInfo_getContent_is_null_and_totalPages_is_1()
    {
        User user = new User();
        user.setCompanyId("911308037825919000");
        session.setAttribute("currentUser", user);

        LogisticsInfo logisticsInfo = new LogisticsInfo();
        logisticsInfo.setLocation("3");
        logisticsInfo.setContent("");

        String waybillState = "0";
        String state1 = "0";

        WaybillInfo waybillInfo = new WaybillInfo();
        List<WaybillInfo> waybillListAll = new ArrayList<>();
        for (int i = 0; i < 9; i++)
        {
            waybillListAll.add(waybillInfo);
        }
        List<WaybillInfo> waybillList = new ArrayList<>();

        int currentPage = 3;

        EasyMock.expect(logisticsModel.queryWaybillByTwoState
                ("0", "0", user.getCompanyId())).andReturn(waybillListAll);
        EasyMock.expect(logisticsModel.queryWaybillOnPageByTwoState
                (18, waybillState, state1, user.getCompanyId())).andReturn(waybillList);

        EasyMock.expect(model.addAttribute("resultMessage", "")).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", false)).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillStateArray", new String[9])).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);

        EasyMock.replay(logisticsModel, model);

        String result = logisticsController.insert(session, model, logisticsInfo, state1, waybillState, 3);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillTransport", result);
    }

    @Test
    public void should_insert_no_result_when_logisticsInfo_getSubmitUser_is_null_and_totalPages_is_1_and_waybillList_size_bigger_than_0()
    {

        User user = new User();
        user.setCompanyId("911308037825919000");
        session.setAttribute("currentUser", user);

        LogisticsInfo logisticsInfo = new LogisticsInfo();
        logisticsInfo.setLocation("3");
        logisticsInfo.setContent("4");
        logisticsInfo.setSubmitUser("");

        String waybillState = "0";
        String state1 = "0";

        WaybillInfo waybillInfo = new WaybillInfo();
        List<WaybillInfo> waybillListAll = new ArrayList<>();
        for (int i = 0; i < 9; i++)
        {
            waybillListAll.add(waybillInfo);
        }
        List<WaybillInfo> waybillList = new ArrayList<>();
        for (int i = 0; i < 2; i++)
        {
            waybillList.add(waybillInfo);
        }

        int currentPage = 3;

        EasyMock.expect(logisticsModel.queryWaybillByTwoState
                ("0", "0", user.getCompanyId())).andReturn(waybillListAll);
        EasyMock.expect(logisticsModel.queryWaybillOnPageByTwoState
                (18, waybillState, state1, user.getCompanyId())).andReturn(waybillList);

        EasyMock.expect(model.addAttribute("resultMessage", "")).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillStateArray", new String[9])).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);

        EasyMock.replay(logisticsModel, model);

        String result = logisticsController.insert(session, model, logisticsInfo, state1, waybillState, 3);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillTransport", result);
    }

    @Test
    public void should_insert_success_when_logisticsInfo_get_is_not_null_and_totalPages_is_1_and_waybillList_size_bigger_than_0()
    {
        User user = new User();
        user.setCompanyId("911308037825919000");
        session.setAttribute("currentUser", user);

        LogisticsInfo logisticsInfo = new LogisticsInfo();
        logisticsInfo.setLocation("3");
        logisticsInfo.setContent("4");
        logisticsInfo.setSubmitUser("3");

        String waybillState = "0";
        String state1 = "0";

        WaybillInfo waybillInfo = new WaybillInfo();
        List<WaybillInfo> waybillListAll = new ArrayList<>();
        for (int i = 0; i < 9; i++)
        {
            waybillListAll.add(waybillInfo);
        }
        List<WaybillInfo> waybillList = new ArrayList<>();
        for (int i = 0; i < 2; i++)
        {
            waybillList.add(waybillInfo);
        }

        int currentPage = 3;

        EasyMock.expect(logisticsModel.insertLogisticsInfo(logisticsInfo)).andReturn(true);

        EasyMock.expect(logisticsModel.queryWaybillByTwoState
                ("0", "0", user.getCompanyId())).andReturn(waybillListAll);
        EasyMock.expect(logisticsModel.queryWaybillOnPageByTwoState
                (18, waybillState, state1, user.getCompanyId())).andReturn(waybillList);

        EasyMock.expect(model.addAttribute("resultMessage", "提交成功")).andReturn(model);
        EasyMock.expect(model.addAttribute("hasResult", true)).andReturn(model);
        EasyMock.expect(model.addAttribute("totalPages", 1)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillList", waybillList)).andReturn(model);
        EasyMock.expect(model.addAttribute("waybillStateArray", new String[9])).andReturn(model);
        EasyMock.expect(model.addAttribute("page", currentPage)).andReturn(model);

        EasyMock.replay(logisticsModel, model);

        String result = logisticsController.insert(session, model, logisticsInfo, state1, waybillState, 3);
        EasyMock.verify(logisticsModel, model);

        Assert.assertEquals("logistics/waybillTransport", result);
    }
}

