package com.isscollege.gdce.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.isscollege.gdce.model.IOrderModel;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.isscollege.gdce.domain.LogisticsInfo;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.domain.WaybillInfo;
import com.isscollege.gdce.model.ILogisticsModel;

/*
 * 物流管理
 */
@Controller
@RequestMapping("/logistics")
public class LogisticsController
{
    private static final Logger LOGGER = Logger.getLogger(LogisticsController.class);
    private static final String OBLIGATION_TYPE = "待付款";
    private static final String SHIP_TYPE = "待发货";
    private static final String RECEIVE_TYPE = "待收货";
    private static final String CHECK_TYPE = "待验收";
    private static final String FINISH_TYPE = "完成";
    private static final String SIGNED_TYPE = "已签收";
    private static final String TRANSPORT_TYPE = "运输中";
    private static final String SIGNIN_TYPE = "待签收";
    private static final String SHIP_STATE = "0";
    private static final String TRANSPORT_STATE = "1";
    private static final String SIGNIN_STATE = "2";
    private static final String SIGNED_STATE = "3";
    private static final String BUYER = "1";
    private static final String SELLER = "2";
    private static final String TRANSPORTER = "3";

    private static int pageSize = 9;

    @Autowired
    private ILogisticsModel logisticsModel = null;

    @Autowired
    IOrderModel orderModel;
    private String userId = null;
    private User user = null;
    private Map<Integer, String> orderState = null;

    @RequestMapping("/queryorder")
    public String queryOrder(HttpSession session, Model model, @RequestParam("page") int currentPage)
    {
        logistic(session);

        List<Order> orderList = logisticsModel.queryOrderOnPage((currentPage - 1) * pageSize, userId);
        List<Order> orderListAll = logisticsModel.queryOrderAll(userId);

        int totalPages = orderListAll.size() % pageSize == 0 ? orderListAll.size() / pageSize
                : orderListAll.size() / pageSize + 1;
        String[] orderStateArray = new String[pageSize];
        int orderListSize = orderList.size();
        boolean hasResult = orderListSize > 0;

        if (hasResult)
        {
            for (int i = 0; i < orderListSize; i++)
            {
                orderStateArray[i] = orderState.get(orderList.get(i).getOrderState());
            }
        }
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", currentPage);
        model.addAttribute("orderList", orderList);
        model.addAttribute("hasResult", hasResult);
        model.addAttribute("orderStateArray", orderStateArray);

        return "logistics/waybillorder";
    }

    // 如果forward参数的值为query,进入订单查询页
    @RequestMapping("/query")
    public String query(HttpSession session, Model model, String state1, @RequestParam("state") String waybillState,
                        @RequestParam("page") int currentPage) throws IOException
    {
        logistic(session);

        if (waybillState.equals(SHIP_STATE) || waybillState.equals(SIGNED_STATE))
        {
            return queryWaybillByState(model, state1, waybillState, currentPage);
        }
        if (waybillState.equals(TRANSPORT_STATE))
        {
            return queryWaybillByTwoState(model, state1, waybillState, currentPage);
        }
        return "logistics/waybillConfirm";
    }

    private String queryWaybillByState(Model model, String state1, @RequestParam("state") String waybillState,
                                       @RequestParam("page") int currentPage) throws IOException
    {
        List<WaybillInfo> waybillList = logisticsModel.queryWaybillOnPage((currentPage - 1) * pageSize,
                waybillState, userId);
        List<WaybillInfo> waybillListAll = logisticsModel.queryWaybillByState(waybillState, userId);
        int totalPages = waybillListAll.size() % pageSize == 0 ? waybillListAll.size() / pageSize
                : waybillListAll.size() / pageSize + 1;
        if (totalPages == 0)
        {
            totalPages = currentPage;
        }
        boolean hasResult = false;
        if (waybillList.size() > 0)
        {
            hasResult = true;
        }
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", currentPage);
        model.addAttribute("waybillList", waybillList);
        model.addAttribute("hasResult", hasResult);
        if (waybillState.equals(SHIP_STATE))
        {
            model.addAttribute("waybillstate", SHIP_TYPE);
            return "logistics/waybillConfirm";
        } else if (waybillState.equals(SIGNED_STATE))
        {
            model.addAttribute("waybillstate", SIGNED_TYPE);
            return "logistics/waybillFinish";
        }
        return "logistics/waybillConfirm";
    }

    private String queryWaybillByTwoState(Model model, String state1, @RequestParam("state") String waybillState,
                                          @RequestParam("page") int currentPage) throws IOException
    {
        List<WaybillInfo> waybillList = logisticsModel.queryWaybillOnPageByTwoState((currentPage - 1) * pageSize,
                waybillState, state1, userId);
        List<WaybillInfo> waybillListAll = logisticsModel.queryWaybillByTwoState(waybillState, state1, userId);
        int totalPages = waybillListAll.size() % pageSize == 0 ? waybillListAll.size() / pageSize
                : waybillListAll.size() / pageSize + 1;
        if (totalPages == 0)
        {
            totalPages = currentPage;
        }
        String[] waybillStateArray = new String[pageSize];
        boolean hasResult = false;
        if (waybillList.size() > 0)
        {
            hasResult = true;
        }
        model.addAttribute("waybillStateArray", waybillStateArray);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", currentPage);
        model.addAttribute("waybillList", waybillList);
        model.addAttribute("hasResult", hasResult);
        return "logistics/waybillTransport";
    }

    @RequestMapping("/changestate")
    public String changeState(HttpSession session, Model model, String waybillId,
                              @RequestParam("state") String waybillState, @RequestParam("page") int currentPage)
    {
        boolean hasResult = false;
        String msg = "";

        logistic(session);

        int changeState = Integer.parseInt(waybillState) + 1;
        String Cstate = "" + changeState;

        boolean result = logisticsModel.updateWaybillState(Cstate, waybillId);
        msg = result ? "运单确认成功" : "运单确认失败";

        List<WaybillInfo> waybillList = logisticsModel.queryWaybillOnPage((currentPage - 1) * pageSize, waybillState,
                userId);
        List<WaybillInfo> waybillListAll = logisticsModel.queryWaybillByState(waybillState, userId);
        int totalPages = waybillListAll.size() % pageSize == 0 ? waybillListAll.size() / pageSize
                : waybillListAll.size() / pageSize + 1;
        if (totalPages == 0)
        {
            totalPages = currentPage;
        }
        if (waybillList.size() > 0)
        {
            hasResult = true;
        }
        model.addAttribute("msg", msg);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", currentPage);
        model.addAttribute("waybillList", waybillList);
        model.addAttribute("hasResult", hasResult);
        model.addAttribute("waybillstate", SHIP_TYPE);

        return "logistics/waybillConfirm";
    }

    // 如果forward参数的值为follow,进入运单物流展示页
    @RequestMapping("/follow")
    public String follow(HttpSession session, Model model, String orderId, String waybillId)
    {
        logistic(session);

        if (user.getPermission().equals(BUYER) || user.getPermission().equals(SELLER))
        {
            waybillId = logisticsModel.queryWaybillByOrderId(orderId);
        } else if (user.getPermission().equals(TRANSPORTER))
        {
            // 获取前端传输的运单号
            waybillId = StringUtils.defaultString(waybillId);
        }
        // 调用获取物流信息方法
        getlogisticsinfo(model, waybillId);
        try
        {
            // 调用获取商品信息方法
            getProductInfo(model, waybillId);
        } catch (SQLException e)
        {
            LOGGER.error("sql语句异常", e);
        }
        model.addAttribute("orderId", orderId);
        // 跳转到物流信息跟踪页面
        return "logistics/logisticsQuery";
    }

    @RequestMapping("/insert")
    public String insert(HttpSession session, Model model, LogisticsInfo logisticsInfo, String state1,
                         @RequestParam("state") String waybillState, @RequestParam("page") int currentPage)
    {
        String resultMessage = "";

        logistic(session);

        if (!logisticsInfo.getLocation().equals("") && !logisticsInfo.getContent().equals("")
                && !logisticsInfo.getSubmitUser().equals(""))
        {
            logisticsInfo.setUpdateDate(new Date(System.currentTimeMillis()).toString());
            resultMessage = logisticsModel.insertLogisticsInfo(logisticsInfo) ? "提交成功" : "提交失败";
        }
        List<WaybillInfo> waybillList = logisticsModel.queryWaybillOnPageByTwoState
                ((currentPage - 1) * pageSize, waybillState, state1, userId);
        List<WaybillInfo> waybillListAll = logisticsModel.queryWaybillByTwoState(waybillState, state1, userId);
        int totalPages = waybillListAll.size() % pageSize == 0 ? waybillListAll.size() / pageSize
                : waybillListAll.size() / pageSize + 1;
        totalPages = totalPages == 0 ? currentPage : totalPages;

        String[] waybillStateArray = new String[pageSize];
        boolean hasResult = waybillList.size() > 0;
        model.addAttribute("resultMessage", resultMessage);
        model.addAttribute("waybillStateArray", waybillStateArray);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", currentPage);
        model.addAttribute("waybillList", waybillList);
        model.addAttribute("hasResult", hasResult);
        return "logistics/waybillTransport";
    }

    @RequestMapping("/changeOrderId")
    public String changeOrderId(HttpSession session, Model model, String waybillid, String state1, String orderId,
                                @RequestParam("state") String waybillState, @RequestParam("page") int currentPage)
    {
        String msg = "";
        String Cstate = SIGNIN_STATE;

        logistic(session);


        boolean result1 = logisticsModel.updateWaybillState(Cstate, waybillid);
        msg = result1 ? "运单确认成功" : "运单确认失败";

        List<WaybillInfo> waybillList = logisticsModel.queryWaybillOnPageByTwoState((currentPage - 1) * pageSize,
                waybillState, state1, userId);
        List<WaybillInfo> waybillListAll = logisticsModel.queryWaybillByTwoState(waybillState, state1, userId);
        int totalPages = waybillListAll.size() % pageSize == 0 ? waybillListAll.size() / pageSize
                : waybillListAll.size() / pageSize + 1;
        if (totalPages == 0)
        {
            totalPages = currentPage;
        }
        String[] waybillStateArray = new String[pageSize];
        boolean hasResult = waybillList.size() > 0;
        model.addAttribute("waybillStateArray", waybillStateArray);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", currentPage);
        model.addAttribute("waybillList", waybillList);
        model.addAttribute("hasResult", hasResult);
        return "logistics/waybillTransport";
    }

    // 通过运单号获取物流信息方法
    public void getlogisticsinfo(Model model, String waybillId)
    {
        List<LogisticsInfo> logisticsinfo;

        // 通过运单号获取物流信息
        logisticsinfo = logisticsModel.queryLogisticsInfo(waybillId);

        // 如果信息获取成功，将数据返回到前端
        if (logisticsinfo != null)
        {
            model.addAttribute("logisticsinfo", logisticsinfo);
            model.addAttribute("test1", "success");
        }
    }

    // 通过运单号获取商品相关信息方法
    public void getProductInfo(Model model, String waybillId) throws SQLException
    {
        String waybillState = "";
        // 通过运单id获取相应的运单信息
        WaybillInfo waybillinfo = logisticsModel.queryWaybillInfoByWaybillId(waybillId);
        // 如果返回的运单数据不为空
        if (waybillinfo != null)
        {
            // 获取物流商企业机构代码
            String waybillCompanyId = StringUtils.defaultString(waybillinfo.getWaybillCompanyId(), "--");
            // 获取订单号
            String orderId = StringUtils.defaultString(waybillinfo.getOrderId(), "--");
            // 通过物流商企业机构代码获取物流商公司名称
            String companyName = null;
            if (logisticsModel.queryCompanyInfo(waybillCompanyId) != null)
            {
                companyName = StringUtils
                        .defaultString(logisticsModel.queryCompanyInfo(waybillCompanyId).getCompanyName(), "--");
            }
            // 通过订单号获取所运商品信息
            Product product = logisticsModel.queryProductByOrderId(orderId);
            // 获取运单状态
            if (waybillinfo.getWaybillState().equals(SHIP_STATE))
                waybillState = SHIP_TYPE;
            else if (waybillinfo.getWaybillState().equals(TRANSPORT_STATE))
                waybillState = TRANSPORT_TYPE;
            else if (waybillinfo.getWaybillState().equals(SIGNIN_STATE))
                waybillState = SIGNIN_TYPE;
            else if (waybillinfo.getWaybillState().equals(SIGNED_STATE))
                waybillState = SIGNED_TYPE;
            // 将相关信息返回
            model.addAttribute("waybillId", waybillId);
            model.addAttribute("companyName", companyName);
            model.addAttribute("product", product);
            model.addAttribute("waybillState", waybillState);
            model.addAttribute("test2", "success");
        }
    }

    // 用户确认签收订单
    @RequestMapping("/updateWaybillState")
    public String updateWaybillOrderState(String waybillId, String orderId)
    {
        logisticsModel.updateWaybillState(SIGNED_STATE, waybillId);
        orderModel.updateOrderStatus(orderId, 4);
        return "redirect:follow?&waybillId=" + waybillId + "&orderId=" + orderId;
    }

    private void logistic(HttpSession session)
    {
        orderState = new HashMap<>();
        orderState.put(0, OBLIGATION_TYPE);
        orderState.put(1, SHIP_TYPE);
        orderState.put(2, RECEIVE_TYPE);
        orderState.put(3, CHECK_TYPE);
        orderState.put(4, FINISH_TYPE);

        user = (User) session.getAttribute("currentUser");
        userId = user.getCompanyId();
    }
}
