package com.isscollege.gdce.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.isscollege.gdce.model.IContractModel;
import com.isscollege.gdce.model.IReviewModel;
import com.isscollege.gdce.util.RIDUtil;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IProductModel;
import com.isscollege.gdce.model.ITradeModel;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

import static java.awt.SystemColor.info;

@Controller
@RequestMapping("/product")
public class ProductController
{
    private static final Logger LOGGER = Logger.getLogger(ProductController.class);
    @Autowired
    private ITradeModel detailModel;
    @Autowired
    private IContractModel contractModel;
    @Autowired
    private IProductModel productModel;
    @Autowired
    private IReviewModel iReviewModel;

    @RequestMapping("/getProductList")
    @ResponseBody
    public Map<String, Object> getProductList(int offset, int limit, String sort, String order)
    {
        Map<String, Object> data = new HashMap<>();
        data.put("rows", productModel.getProductInfoList(offset, limit, sort, order));
        data.put("total", productModel.getProductListTotal(sort, order));
        return data;
    }

    @RequestMapping("updateProduct")
    public String updateProduct(int id, Model model, HttpSession session)
    {
        List<Product> productList = productModel.getIndexProductInfo();
        if (null != productList)
        {
            for (Product product : productList)
            {
                if (product.getId() == id)
                {
                    session.setAttribute("id", id);
                    model.addAttribute("product", product);
                    break;
                }
            }
        }
        return "product/updateProduct";
    }

    @RequestMapping("/query")
    public String query(HttpSession session)
    {
        if (session.getAttribute("currentUser") instanceof User)
        {
            User user = (User) session.getAttribute("currentUser");
            session.setAttribute("productUserList", productModel.getProductInfoByName(user.getName()));
            session.setAttribute("auditingProductList", productModel.getAuditingProductInfo());
        }
        return "product/managing";
    }

    @RequestMapping("/update")
    public String update(Product product, HttpSession session)
    {
        if (session.getAttribute("currentUser") instanceof User)
        {
            product.setId(NumberUtils.toInt(ObjectUtils.toString(session.getAttribute("id"))));
            product.setUserName(((User) session.getAttribute("currentUser")).getName());
            product.setProductState(1);
            product.setReviewState(0);
            productModel.updateProduct(product);
        }
        return "redirect:query";
    }

    @RequestMapping("/productId")
    public String productId(int productId, HttpServletRequest request) throws UnsupportedEncodingException
    {
        Product product = detailModel.getProductInfoById(productId);
        Object phoneNumber = detailModel.getPhoneNumber(productId);
        HttpSession sessionProduct = request.getSession();
        HttpSession sessionPhoneNumber = request.getSession();
        sessionProduct.setAttribute("product", product);
        sessionPhoneNumber.setAttribute("phoneNumber", phoneNumber);
        return "product/detailProduct";
    }

    @RequestMapping("/insert")
    public String insert(Product product, HttpSession session) throws UnsupportedEncodingException
    {
        if(session.getAttribute("currentUser") instanceof User)
        {
            int productId = 1;
            int reviewState = 0;
            int productState = 1;
            product.setUserName(((User) session.getAttribute("currentUser")).getName());
            if (productModel.getMaxProductId() != null)
            {
                productId = productModel.getMaxProductId().getProductId()+1;
            }
            product.setProductId(productId);
            product.setProductState(productState);
            product.setReviewState(reviewState);
            product.setSubmitDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            product.setRecordID(RIDUtil.getRID());
            productModel.insertProduct(product);
        }
        return "redirect:query";
    }

    //更改商品为下架状态
    @RequestMapping("/updateProductState")
    public String updateProductState(HttpServletRequest request)
    {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("currentUser");
        System.out.println("user name= " + user.getName());
        int id = Integer.parseInt(request.getParameter("id"));
        String checker = user.getName();

        String OffProductInfo = request.getParameter("OffProductInfo");
        System.out.println("下架原因： " + OffProductInfo);
        System.out.println("id = " + id + checker);
        String reasonName = "  下架原因:";
        String offProductInfo = checker + reasonName + OffProductInfo;
        productModel.addInfo(id, offProductInfo);
        iReviewModel.updateProductReviewState(id, 1, 1);
        return "redirect:query";
    }


}
