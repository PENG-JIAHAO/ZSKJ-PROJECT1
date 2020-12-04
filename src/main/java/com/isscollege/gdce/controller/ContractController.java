package com.isscollege.gdce.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IContractModel;
import org.springframework.web.bind.annotation.RequestParam;

//合同
@Controller
@RequestMapping("/contract")
public class ContractController
{
    private static final Logger LOGGER = Logger.getLogger(ContractController.class);
    private static final long serialVersionUID = 1L;
    @Autowired
    private IContractModel contractModel;

    List<Contract> result = null;


    // 买方确认合同后， 创建合同
    @RequestMapping("/insertContract")
    public String insertContract(HttpSession session)
    {
        Contract contract = (Contract) session.getAttribute("contract");
        SimpleDateFormat dateformatContractIdTime = new SimpleDateFormat("MMddHHmmss");
        String ContractIdTime = dateformatContractIdTime.format(System.currentTimeMillis());
        long ContractId = Long.parseLong(ContractIdTime);

        contract.setContractId(ContractId);
        contract.setBuyerContractState(true);
        contract.setSellerContractState(false);

        SimpleDateFormat dateformatContractCreateDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateformatstarttime = dateformatContractCreateDate.format(System.currentTimeMillis());
        contract.setCreateDate(dateformatstarttime);
        String dateformatendtime = dateformatContractCreateDate.format(System.currentTimeMillis() + 86400000);
        contract.setEndDate(dateformatendtime);

        boolean state = contractModel.addContract(contract);
        session.setAttribute("state", state);
        session.setAttribute("contract", contract);
        if (!state)
        {
            return "/trade/delist";
        } else
        {
            return "/contract/success";
        }
    }

    // 取消合同签约时，更新产品状态为下架
    @RequestMapping("/updateProductState")
    public String updateProductState(HttpSession session)
    {
        if (session.getAttribute("product") instanceof Product)
        {
            contractModel.updateProductStatezero((Product) session.getAttribute("product"));
        }
        return "index";
    }


    // 点击合同查询，显示合同列表
    @RequestMapping("/querylist")
    public String querylist(int a, HttpSession session)
    {
        User user = (User) session.getAttribute("currentUser");
        String companyID = user.getCompanyId();
        int offset = 0;
        session.setAttribute("companyID", companyID);
        boolean hasResult = true;

        if (StringUtils.isNotEmpty(companyID))
        {
            result = contractModel.querConstractById(companyID, offset);
            session.setAttribute("contracts", result);
            session.setMaxInactiveInterval(60 * 60);
            session.setAttribute("hasResult", hasResult);
        }


        if (a == 1)
        {
            return "/contract/contractEnsure";

        } else
            return "/contract/bothSigned";
    }

    // 查询合同，生成订单
    @RequestMapping("/ensurelist")
    public void ensurelist(int ensureId, HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {


        List<Contract> contracts = (List<Contract>) session.getAttribute("contracts");
        if (contracts != null || contracts.size() != 0)
        {
            Contract contract = contracts.get(ensureId);
            String contractID = Long.toString(contract.getContractId());
            // 传参到订单
            session.setAttribute("contract", contract);
            int state = contractModel.updateState(contract, contractID);

            if (state != 0)
            {
                // 跳转
                request.getRequestDispatcher("/order/orderCreate").forward(request, response);
            } else
            {
                request.setAttribute("message", "合同签订失败，请重新确认");
                request.getRequestDispatcher("/contract/contractEnsure").forward(request, response);
            }
        }
    }

    //查询指定编号合同
    @RequestMapping("/queryAppointedContract")
    public String queryAppointedContract(@RequestParam(value = "a", defaultValue = "1", required = false) Integer a, HttpServletRequest httpServletRequest, Model model)
    {
        String contractId = httpServletRequest.getParameter("contractId");
        List<Contract> contractList = null;
        if (StringUtils.isNotEmpty(contractId))
        {
            contractList = contractModel.queryAppointedContract(Long.valueOf(contractId));
        }
        model.addAttribute("contract", contractId);
        model.addAttribute("hasResult", StringUtils.isNotEmpty(contractId) && contractList.size() > 0);
        model.addAttribute("contracts", contractList);

        return a == 1 ? "contract/contractEnsure" : "contract/bothSigned";

    }


}
