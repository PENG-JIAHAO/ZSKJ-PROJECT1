package com.isscollege.gdce.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.isscollege.gdce.util.FileUtil;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.LogisticsPrice;
import com.isscollege.gdce.domain.Order;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IOrderModel;
import com.isscollege.gdce.model.IReviewModel;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/order")
public class OrderController
{
    private static final Logger LOGGER = Logger.getLogger(OrderController.class);
    @Autowired
    private IOrderModel ordermodel;
    @Autowired
    private IReviewModel reviewmodel;

    private static final String UPLOAD_DIR = "imgs/order/receipt/";
    private String resultMessage;
    private Map<Integer, String> orderState;
    private static final String OBLIGATION_TYPE = "待付款";
    private static final String SHIP_TYPE = "待发货";
    private static final String RECEIVE_TYPE = "待收货";
    private static final String CHECK_TYPE = "待验收";
    private static final String FINISH_TYPE = "完成";
    private static final int OBLIGATION_STATE = 0;
    private static final int SHIP_STATE = 1;
    private static final int RECEIVE_STATE = 2;
    private static final int CHECK_STATE = 3;
    private static final int FINISH_STATE = 4;

    public OrderController()
    {
        orderState = new HashMap<>();
        orderState.put(OBLIGATION_STATE, OBLIGATION_TYPE);
        orderState.put(SHIP_STATE, SHIP_TYPE);
        orderState.put(RECEIVE_STATE, RECEIVE_TYPE);
        orderState.put(CHECK_STATE, CHECK_TYPE);
        orderState.put(FINISH_STATE, FINISH_TYPE);
    }

    @RequestMapping("/orderCreate")
    public String orderCreate(HttpSession httpSession, Model model)
    {
        int random = (int) ((Math.random() * 9 + 1) * 1000);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        // 生成订单时间
        Date date = new Date();
        String createDate = df.format(date);
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DATE, 15);
        // 无操作时订单自动结束时间
        String endDate = df.format(ca.getTime());
        Contract contract = (Contract) httpSession.getAttribute("contract");
        String orderId = new SimpleDateFormat("yyyyMMddHHmm").format(date) + random;// 生成订单编号

        int productId = (int) contract.getProductId();
        String buyerCompanyId = contract.getBuyerCompanyId();
        // //获取卖家企业编号
        String sellerCompanyId = contract.getSellerCompanyId();
        // 根据商品编号在数据库表查询获取对应的商品信息
        Product product = ordermodel.queryProduct(productId);
        // 根据买家编号在数据库表查询获取对应的买家信息
        Company BuyerCompany = ordermodel.queryCompany(buyerCompanyId);
        // 根据卖家编号在数据库表查询获取对应的卖家信息
        Company SellerCompany = ordermodel.queryCompany(sellerCompanyId);
        // 生成交易总金额
        float tradePrice = product.getPrice() * product.getQuantity();
        Order order = new Order();
        order.setOrderId(orderId);
        order.setTradePrice(tradePrice);
        order.setProductId(productId);
        order.setBuyerCompanyId(buyerCompanyId);
        order.setSellerCompanyId(sellerCompanyId);
        order.setOrderState(0);
        order.setReceiptPath("");
        order.setCreateDate(createDate);
        order.setEndDate(endDate);
        Boolean state = ordermodel.orderCreate(order);
        if (state)
        {
            httpSession.setAttribute("order", order);
            httpSession.setAttribute("product", product);
            httpSession.setAttribute("buyerCompany", BuyerCompany);
            httpSession.setAttribute("sellerCompany", SellerCompany);
            return "order/orderCreation";
        } else
        {
            String resultMessages = "订单创建失败";
            model.addAttribute("result", resultMessages);
            return "result";
        }
    }

    // 查询当前用户全部订单
    @RequestMapping("/query")
    public String query(HttpSession httpsession, int page, Map<Integer, String> orderState, Model model)
    {
        User user = (User) httpsession.getAttribute("currentUser");
        List<Order> orderList = ordermodel.queryOrderOnPage((page - 1) * 8, user.getCompanyId());
        List<Order> orderListAll = ordermodel.queryOrderAll("20", user.getCompanyId());
        int totalPages = orderListAll.size() % 8 == 0 ? orderListAll.size() / 8 : orderListAll.size() / 8 + 1;
        String[] orderStateArray = new String[8];
        boolean hasResult = false;
        boolean isAppointed = false;
        if (orderList.size() > 0)
        {
            hasResult = true;
            int i = 0;
            for (Order o : orderList)
            {
                orderStateArray[i] = orderState.get(o.getOrderState());
                i++;
            }
        }
        model.addAttribute("orderStateArray", orderStateArray);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", page);
        model.addAttribute("orderList", orderList);
        model.addAttribute("hasResult", hasResult);
        model.addAttribute("isAppointed", isAppointed);
        return "order/orderQuery";
    }

    // 查询订单详情
    @RequestMapping("/detail")
    public String detail(String orderId, Model model)
    {
        Order order = ordermodel.queryOrder(orderId);
        if (order != null)
        {
            model.addAttribute("order", order);
            model.addAttribute("product", ordermodel.queryProduct(order));
            model.addAttribute("buyer", ordermodel.queryBuyer(order));
            model.addAttribute("seller", ordermodel.querySeller(order));
            model.addAttribute("orderState", orderState.get(order.getOrderState()));
        }
        return "order/orderDetail";
    }

    // 查询订单详情
    @RequestMapping("/updateOrderState")
    public String updateOrderState(String orderId, Model model)
    {
        // 如果查询结果为null，则不进行复制，避免NullPointerException
        if (ordermodel.queryOrder(orderId) != null)
        {
            ordermodel.updateOrderStatus(orderId, RECEIVE_STATE);
            model.addAttribute("order", ordermodel.queryOrder(orderId));
            model.addAttribute("product", ordermodel.queryProduct(ordermodel.queryOrder(orderId)));
            model.addAttribute("buyer", ordermodel.queryBuyer(ordermodel.queryOrder(orderId)));
            model.addAttribute("seller", ordermodel.querySeller(ordermodel.queryOrder(orderId)));
            model.addAttribute("orderState", orderState.get(ordermodel.queryOrder(orderId).getOrderState()));
        }
        return "order/orderDetail";
    }

    // 查询指定订单，模糊查询
    @RequestMapping("/queryAppointedOrder")
    public String queryAppointedOrder(int page, String orderId, HttpServletRequest request, HttpSession httpSession, Model model,
                                      Map<Integer, String> orderState)
    {
        User user = (User) httpSession.getAttribute("currentUser");
        String str = request.getParameter("orderId");

        boolean hasResult = false;
        boolean isAppointed = true;
        List<Order> orderList = new ArrayList<>();

        List<Order> orderListAll = ordermodel.queryOrderAll(orderId, user.getCompanyId());

        orderList = ordermodel.queryAppointedOrder(orderId, (page - 1) * 8, user.getCompanyId());

        int totalPages = orderListAll.size() % 8 == 0 ? orderListAll.size() / 8 : orderListAll.size() / 8 + 1;
        String[] orderStateArray = new String[8];
        if (str.isEmpty())
        {
            hasResult = false;
        } else if (orderList.size() > 0)
        {
            hasResult = true;
            int i = 0;
            for (Order o : orderList)
            {
                o.getOrderId();
                orderStateArray[i] = orderState.get(o.getOrderState());
                i++;
            }
        }
        model.addAttribute("page", page);
        model.addAttribute("orderId", orderId);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("orderList", orderList);
        model.addAttribute("orderStateArray", orderStateArray);
        model.addAttribute("hasResult", hasResult);
        model.addAttribute("isAppointed", isAppointed);
        return "order/orderQuery";
    }

    @RequestMapping("/uploadImg")
    public String uploadImg(String orderId, Model model, HttpServletRequest request, HttpServletResponse response) throws FileUploadException
    {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultiValueMap<String, MultipartFile> multiFileMap = multipartRequest.getMultiFileMap();
        MultipartFile multipartFile = multiFileMap.getFirst("filename");
        String ext = "";
        String photoName = request.getParameter("photo");
        ext = photoName.substring(photoName.lastIndexOf("."));
        Order order = ordermodel.queryOrder(orderId);
        StringBuffer sb = new StringBuffer();
        String url = request.getSession().getServletContext().getRealPath("");
        String[] paths = url.split("/");
        for (int i = 1; i < paths.length - 2; i++)
        {
            sb.append(paths[i] + "/");
        }
        String realPath = sb.append(UPLOAD_DIR).toString();
        String companyId = order.getBuyerCompanyId();
        String orderId1 = order.getOrderId();
        String result = companyId.substring(companyId.length() - 4);
        String fileName = result + orderId1 + ext;
        String filePath = realPath + fileName;
        File realPathFile = new File(realPath);

        FileUtil.writeFile(realPathFile, filePath, multipartFile);

        order.setReceiptPath(UPLOAD_DIR + fileName);
        model.addAttribute("path", UPLOAD_DIR + fileName);
        resultMessage = ordermodel.updateReceiptPath(order) ? "上传回执单成功" : "上传回执单失败";
        model.addAttribute("orderId", order.getOrderId());
        model.addAttribute("result", resultMessage);
        model.addAttribute("order", order);
        model.addAttribute("product", ordermodel.queryProduct(order));
        model.addAttribute("buyer", ordermodel.queryBuyer(order));
        model.addAttribute("seller", ordermodel.querySeller(order));
        return "order/orderDetail";
    }

/*
    // 确认物流发货，生成运单
    @RequestMapping("/createWayBill")
    public String createWayBill(Model model, HttpServletRequest request, String orderId, String companyName)
    {
		*//*if (ordermodel.queryOrderIdById(orderId) != null)
		{
			model.addAttribute("error", "该订单已经存在！！");
			return "redirect:/order/getLogisticName?"+orderId;
		}*//*
        String startingplace = request.getParameter("startingplace");
        String destination = request.getParameter("destination");

        Order order = ordermodel.queryCompanyIdByOrderId(request.getParameter("orderId"));
        WaybillInfo waybill = new WaybillInfo();
        Product product = ordermodel.queryProduct(order.getProductId());
        float quantity = product.getQuantity();
        // 更改商品状态为已下架
        int productId = product.getProductId();
        reviewmodel.updateProductReviewState(productId, 1, 1);
        List<LogisticsPrice> logisticspricelist;
        List<Company> companylist = new ArrayList<>();
        List<Double> sumcostlist;

        logisticspricelist = logisticsmodel.priceGuide(startingplace, destination, quantity);
        for (int i = 0; i < logisticspricelist.size(); i++)
        {
            Company company = logisticsmodel.queryCompanyInfo(logisticspricelist.get(i).getWaybillCompanyId());
            companylist.add(company);
        }
        sumcostlist = logisticsmodel.sumcost(logisticspricelist, quantity);
        setWayBillConfirm(order, waybill, logisticspricelist);
        boolean state = ordermodel.insertWayBill(waybill);
        if (state)
        {
            model.addAttribute("orderId", order.getOrderId());
            model.addAttribute("quantity", quantity);
            model.addAttribute("startingplace", startingplace);
            model.addAttribute("destination", destination);
            model.addAttribute("companyName", companyName);
            model.addAttribute("logisticspricelist", logisticspricelist.get(0));
            model.addAttribute("sumcostlist", sumcostlist.get(0));
            return "order/confirm";
        }
        return "order/waybillProduce";
    }*/

/*    protected void setWayBillConfirm(Order order, WaybillInfo waybill, List<LogisticsPrice> logisticspricelist)
    {
        SimpleDateFormat dateformatContractIdTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String wayBillCreateTime = dateformatContractIdTime.format(System.currentTimeMillis());
        waybill.setCreateTime(wayBillCreateTime);
        String wayBillEndTime = dateformatContractIdTime.format(System.currentTimeMillis() + 86400000 * 15);
        waybill.setEndTime(wayBillEndTime);

        waybill.setOrderId(order.getOrderId());
        waybill.setWaybillCompanyId(logisticspricelist.get(0).getWaybillCompanyId());

        SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmss");
        String t = time.format(new Date());
        String l = logisticspricelist.get(0).getWaybillCompanyId();
        waybill.setWaybillId(t + l.substring(l.length() - 4, l.length()));
        waybill.setWaybillState("0");
    }*/

    // 发起物流时，将物流公司名称传过去。
/*
    @RequestMapping("/getLogisticName")
    public String getLogisticName(String orderId, Model model)
    {
        List<Company> companylist = logisticsmodel.queryLogisticsCompany();
        if (companylist != null)
        {
            model.addAttribute("companylist", companylist);
        }
        model.addAttribute("orderId", orderId);
        return "order/waybillProduce";
    }
*/

  /*  // 查询单价计算总价格
    @RequestMapping(value = "queryprice", produces = "text/javascript;charset=utf-8;")
    public void queryPrice(HttpServletRequest request, HttpServletResponse response)
    {
        String startingPlace = request.getParameter("startingPlace");
        String destination = request.getParameter("destination");
        String orderId = request.getParameter("orderId");

        Order order = ordermodel.queryCompanyIdByOrderId(orderId);
        Product product = ordermodel.queryProduct(order.getProductId());
        float quantity =product.getQuantity();
        List<LogisticsPrice> logisticsPriceList = logisticsmodel.priceGuide(startingPlace, destination, quantity);
        List<Double> sumCostList = logisticsmodel.sumcost(logisticsPriceList, quantity);

        PrintWriter out;
        try
        {
            out = response.getWriter();
            out.write(sumCostList.toString());
        }catch (IOException e)
        {
            LOGGER.error("io流异常", e);
        }
    }*/
}
