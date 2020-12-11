package com.isscollege.gdce.controller;

import java.io.IOException;
import java.util.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.isscollege.gdce.domain.*;
import com.isscollege.gdce.model.IAdvertisementModel;
import com.isscollege.gdce.model.INewsModel;
import com.isscollege.gdce.model.IProductModel;
import com.isscollege.gdce.util.RIDUtil;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.isscollege.gdce.model.IReviewModel;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/review")
public class ReviewController
{
    private static final Logger LOGGER = Logger.getLogger(ReviewController.class);
    @Autowired
    private IReviewModel reviewModel;
    @Autowired
    private INewsModel newsModel;
    @Autowired
    private IProductModel productModel;
    @Autowired
    private IAdvertisementModel advertisementModel;
    private int page = 1;
    private int size = 15;

    @RequestMapping("/operators")
    private String operators(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        // 管理员审核页面，从数据库获取每页（数据库分页查询）用户公司的信息，
        // 详情点不了是因为第一次点的时候公司和id和用户的主外键没有关联上,关联上就好了
        page = 1;
        size = 0x7fffffff;

        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("page", page);

        List<Company> companys = reviewModel.queryCompanyByReviewState((page - 1) * 10, size);
        if (companys.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            companys = reviewModel.queryCompanyByReviewState((page - 1) * 10, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryCompanyByReviewState(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 10 == 0 ? totalSize / 10 : totalSize / 10 + 1);
        }
        model.addAttribute("companys", companys);
        model.addAttribute("pageShow", "company");
        return "review/operators";
    }

    @RequestMapping("/operatorManage")
    public String operatorManage(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        page = 1;
        size = 6;
        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        request.setAttribute("page", page);

        List<Advertisement> advertisements = reviewModel.queryAdvertisementByReviewState((page - 1) * 6, size);
        if (advertisements.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            advertisements = reviewModel.queryAdvertisementByReviewState((page - 1) * 6, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryAdvertisementByReviewState(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 6 == 0 ? totalSize / 6 : totalSize / 6 + 1);
        }
        model.addAttribute("operator3", advertisements);
        model.addAttribute("pageShow", "operator3");

        return "review/operatorManage";
    }

    @RequestMapping("/queryReviewnotpass")
    private String queryReviewnotpass(Model model, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        if (request.getParameter("size") != null)
        {
            size = Integer.parseInt(request.getParameter("size"));
        }
        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("page", page);

        // 管理员审核页面，从数据库获取每页（数据库分页查询）商品信息
        List<Product> products = reviewModel.queryProductByReviewStatenotpass((page - 1) * 15, size);
        // 判断如果某一页没有剩余商品信息
        if (products.size() == 0 && page != 1)
        {
            page--;
            request.setAttribute("page", page);
            products = reviewModel.queryProductByReviewStatenotpass((page - 1) * 15, size);
        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryProductByReviewStatenotpass(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 15 == 0 ? totalSize / 15 : totalSize / 15 + 1);
        }
        model.addAttribute("products", products);
        model.addAttribute("pageShow", "product");

        return "review/review";
    }

    @RequestMapping("/productReview")
    private void productReview(Model model, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        if (request.getParameter("size") != null)
        {
            size = Integer.parseInt(request.getParameter("size"));
        }
        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("page", page);
        List<Product> products = reviewModel.queryProductByReviewState(page, size);

        model.addAttribute("products", products);
        model.addAttribute("page", page);

        response.sendRedirect("queryReview");

    }


    @RequestMapping("/changePro")
    public void changePro(HttpServletRequest request, HttpServletResponse response, HttpSession session)
    {

        if(session.getAttribute(("currentUser")) instanceof User)
        {

            OperateRecord operateRecord = new OperateRecord();

            operateRecord.setUserName(((User) session.getAttribute(("currentUser"))).getName());
            operateRecord.setOperateType(Integer.parseInt(request.getParameter("state")));
            operateRecord.setCreateDate(RIDUtil.getCreateDate());
            operateRecord.setComment("");

            operateRecord.setRecordID(reviewModel.getProductRecordIdByProductId(
                    NumberUtils.toInt(request.getParameter("productId"))));

            reviewModel.addOperateRecord(operateRecord);
            reviewModel.updateProductReviewState(NumberUtils.toInt(request.getParameter("productId")),
                    Integer.parseInt(request.getParameter("prostate")),
                    Integer.parseInt(request.getParameter("state")));
        }
        try
        {
            response.sendRedirect("productReview?page=" + request.getParameter("page"));
        }
        catch (IOException e)
        {
            LOGGER.error("IO流异常", e);
        }
    }

    @RequestMapping("/manufacturers")
    private String manufacturers(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        // 管理员审核页面，从数据库获取每页（数据库分页查询）用户公司的信息，
        // 详情点不了是因为第一次点的时候公司和id和用户的主外键没有关联上,关联上就好了
        page = 1;
        size = 0x7fffffff;

        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("page", page);

        List<Company> companys = reviewModel.queryCompanyByReviewState((page - 1) * 10, size);
        if (companys.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            companys = reviewModel.queryCompanyByReviewState((page - 1) * 10, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryCompanyByReviewState(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 10 == 0 ? totalSize / 10 : totalSize / 10 + 1);
        }
        model.addAttribute("companys", companys);
        model.addAttribute("pageShow", "company");
        return "review/manufacturers";
    }

    @RequestMapping("/getdatarecordcompany")
    @ResponseBody
    public Map<String, Object> getCompanyRecordAjax(@RequestParam(value = "companyId", defaultValue = "0") String companyId, int offset, int limit, String sort, String order)
    {
        String recordId = reviewModel.getCompanyRecordIdByCompanyId(companyId);
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.selectOperateRecordByRecordID(recordId));
        map.put("total", reviewModel.getRecordInfoListTotal(recordId, sort, order));
        return map;
    }


    @RequestMapping("/companyReviewnotpass")
    private String companyReviewnotpass(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        // 管理员审核页面，从数据库获取每页（数据库分页查询）用户公司的信息，
        // 详情点不了是因为第一次点的时候公司和id和用户的主外键没有关联上,关联上就好了
        page = 1;
        size = 15;

        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        model.addAttribute("page", page);

        List<Company> companys = reviewModel.queryCompanyByReviewStatenotpass((page - 1) * 15, size);
        if (companys.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            companys = reviewModel.queryCompanyByReviewStatenotpass((page - 1) * 15, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryCompanyByReviewStatenotpass(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 15 == 0 ? totalSize / 15 : totalSize / 15 + 1);
        }
        model.addAttribute("companys", companys);
        model.addAttribute("pageShow", "company");

        return "review/review";
    }

	@RequestMapping("/changeCom")
	public String changeCom(HttpServletRequest request, HttpSession session)
	{
		int state = NumberUtils.toInt(request.getParameter("state"));

		String companyId = request.getParameter("companyId");

		reviewModel.updateCompanyReviewState(state, companyId);

		//做公司审核操作记录
		doComRecord(request, session, state, companyId);

		return "review/review";
	}

	//做公司审核操作记录
	public void doComRecord(HttpServletRequest request, HttpSession session, int state, String companyId)
	{
		OperateRecord operateRecord = new OperateRecord();

		User currentUser = (User) session.getAttribute("currentUser");

		Date date = new Date();

		SimpleDateFormat createDate = new SimpleDateFormat("yyyy-MM-dd");

		operateRecord.setUserName(currentUser.getName());
		operateRecord.setOperateType(state);
		operateRecord.setCreateDate(createDate.format(date));
		operateRecord.setComment(request.getParameter("reviewAdvice"));

		Company company = new Company();

		company = reviewModel.queryCompanyByCompanyID(companyId);

		if(company.getRecordID() == null ||"".equals(company.getRecordID()))
		{
			//记录第一次审核
			operateRecord.setRecordID(RIDUtil.getRID());
			reviewModel.updateCompanyRecordID(operateRecord.getRecordID(),companyId);
		}
		else
		{
			operateRecord.setRecordID(company.getRecordID());
		}

		reviewModel.addOperateRecord(operateRecord);
	}

    @RequestMapping("/manufacturersManage")
    public String manufacturersManage(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        page = 1;
        size = 6;
        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        request.setAttribute("page", page);

        List<Advertisement> advertisements = reviewModel.queryAdvertisementByReviewState((page - 1) * 6, size);
        if (advertisements.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            advertisements = reviewModel.queryAdvertisementByReviewState((page - 1) * 6, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryAdvertisementByReviewState(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 6 == 0 ? totalSize / 6 : totalSize / 6 + 1);
        }
        model.addAttribute("manufacturers2", advertisements);
        model.addAttribute("pageShow", "manufacturers2");

        return "review/manufacturersManage";
    }


    @RequestMapping("/advertisementReviewnotpass")
    public String advertisementReviewnopass(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        page = 1;
        size = 6;
        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        request.setAttribute("page", page);

        List<Advertisement> advertisements = reviewModel.queryAdvertisementByReviewState((page - 1) * 6, size);
        if (advertisements.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            advertisements = reviewModel.queryAdvertisementByReviewState((page - 1) * 6, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryAdvertisementByReviewState(0, 10000).size();
            model.addAttribute("totalPage", totalSize % 6 == 0 ? totalSize / 6 : totalSize / 6 + 1);
        }
        model.addAttribute("advertisements", advertisements);
        model.addAttribute("pageShow", "advertisement");

        return "manufacturers2";
    }

    @RequestMapping("/changeAdv")
    public void changeAdv(@RequestParam("adId") int adId, @RequestParam("state") int state, HttpServletResponse response, HttpServletRequest request, HttpSession session)
    {
        if (session.getAttribute("currentUser") instanceof User)
        {
            OperateRecord operateRecord = new OperateRecord();
            operateRecord.setRecordID(advertisementModel.getAdsInfo(adId).getRecordID());
            operateRecord.setUserName(((User) session.getAttribute(("currentUser"))).getName());
            operateRecord.setOperateType(state);
            operateRecord.setCreateDate(RIDUtil.getCreateDate());
            operateRecord.setComment("");
            reviewModel.updateAdvertisementReviewState(adId, state);
            reviewModel.addOperateRecord(operateRecord);
        }
        try
        {
            response.sendRedirect("advertisementReview?page=" + request.getParameter("page"));
        }
        catch (IOException e)
        {
            LOGGER.error("io流异常", e);
        }
    }

    // 查询company对象方法
    @RequestMapping("/equipmentDetails")
    private String equipmentDetails(String beforeId, String afterId, Model model, HttpServletRequest request)
            throws ServletException, IOException
    {
        String id = beforeId + afterId;
        Company company = reviewModel.queryCompanyByCompanyID(id);
        company = checkUrl(company);
        User user = reviewModel.queryUserByCompanyId(id);
        model.addAttribute("company", company);
        model.addAttribute("user", user);
        return "review/equipmentDetails";
    }

    // 查询company对象方法
    @RequestMapping("/OperatorInfo")
    private String OperatorInfo(String beforeId, String afterId, Model model, HttpServletRequest request)
            throws ServletException, IOException
    {
        String id = beforeId + afterId;
        Company company = reviewModel.queryCompanyByCompanyID(id);
        company = checkUrl(company);
        User user = reviewModel.queryUserByCompanyId(id);
        model.addAttribute("company", company);
        model.addAttribute("user", user);
        return "review/operatorInfo";
    }
    public Company checkUrl(Company company)
    {

        String companyCodePath = company.getCompanyCodePath();
        String openLicensePath = company.getOpenLicensePath();
        String bankAccountCodePath = company.getBankAccountCodePath();
        String bussionLicenseCodePath = company.getBussionLicenseCodePath();
        String legalPersonCodePath = company.getLegalPersonCodePath();
        String taxRegisterCodePath = company.getTaxRegisterCodePath();
        if (companyCodePath.contains("\\\\"))
        {
            company.setCompanyCodePath(companyCodePath.replaceAll("\\\\", "/"));
        }

        if (bankAccountCodePath.contains("\\\\"))
        {
            company.setBankAccountCodePath(bankAccountCodePath.replaceAll("\\\\", "/"));
        }
        if (openLicensePath.contains("\\\\"))
        {
            company.setOpenLicensePath(openLicensePath.replaceAll("\\\\", "/"));
        }
        if (bussionLicenseCodePath.contains("\\\\"))
        {
            company.setBussionLicenseCodePath(bussionLicenseCodePath.replaceAll("\\\\", "/"));
        }
        if (legalPersonCodePath.contains("\\\\"))
        {
            company.setLegalPersonCodePath(legalPersonCodePath.replaceAll("\\\\", "/"));
        }
        if (taxRegisterCodePath.contains("\\\\"))
        {
            company.setTaxRegisterCodePath(taxRegisterCodePath.replaceAll("\\\\", "/"));
        }
        return company;
    }

    // 查询news对象方法
    @RequestMapping("/news")
    private String news(String title, Model model)
            throws ServletException, IOException
    {
        News news = newsModel.newsDisplay(title);
        model.addAttribute("news", news);
        return "review/newsReviewText";
    }

    @RequestMapping("/newsReview")
    public String dealNews(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        page = 1;
        size = 10;

        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        request.setAttribute("page", page);
        List<News> newss = reviewModel.queryNewsByReviewState((page - 1) * 10, size);
        if (newss.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            newss = reviewModel.queryNewsByReviewState((page - 1) * 10, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryNewsByReviewState(0, 10000).size();
            request.setAttribute("totalPage", totalSize % 10 == 0 ? totalSize / 10 : totalSize / 10 + 1);
        }
        model.addAttribute("newss", newss);
        model.addAttribute("pageShow", "news");

        return "review/newsReview";
    }

    @RequestMapping("/newsReviewnotpass")
    private String dealNewsnotpass(Model model, HttpServletRequest request) throws ServletException, IOException
    {
        page = 1;
        size = 15;
        if (request.getParameter("page") != null)
        {
            page = Integer.parseInt(request.getParameter("page"));
        }
        request.setAttribute("page", page);
        List<News> newss = reviewModel.queryNewsByReviewStatenotpass((page - 1) * 15, size);
        if (newss.size() == 0 && page != 1)
        {
            page--;
            model.addAttribute("page", page);
            newss = reviewModel.queryNewsByReviewStatenotpass((page - 1) * 15, size);

        }
        if (request.getAttribute("totalPage") == null)
        {
            int totalSize = reviewModel.queryNewsByReviewStatenotpass(0, 10000).size();
            request.setAttribute("totalPage", totalSize % 15 == 0 ? totalSize / 15 : totalSize / 15 + 1);
        }
        model.addAttribute("newss", newss);
        model.addAttribute("pageShow", "news");

        return "review/review";
    }

    @RequestMapping("/changeNew")
    public void changeNew(HttpServletRequest request, HttpServletResponse response, HttpSession session)
    {
        try
        {
            User currentUser = null;
            Object objCurrentUser = session.getAttribute("currentUser");
            currentUser = (User) objCurrentUser;
            Date date = new Date();
            SimpleDateFormat createDate = new SimpleDateFormat("yyyy-MM-dd");
            OperateRecord operaterecord = new OperateRecord();
            operaterecord.setUserName(currentUser.getName());
            operaterecord.setOperateType(NumberUtils.toInt(request.getParameter("state")));//获取当前操作类型
            operaterecord.setCreateDate(createDate.format(date));
            operaterecord.setComment("");

			response.sendRedirect("newsReview?page=" + request.getParameter("page"));
            News news = reviewModel.queryNewsByID(NumberUtils.toInt(request.getParameter("productId")));
				operaterecord.setRecordID(news.getRecordID());


            reviewModel.updateNewsReviewState(NumberUtils.toInt(request.getParameter("productId")),
                    Integer.parseInt(request.getParameter("state")));



            reviewModel.addOperateRecord(operaterecord);
        }
        catch (IOException e)
        {
            LOGGER.error("IO流异常", e);
        }
    }

    @RequestMapping("/deleteCompany")
    public void deleteCompany(HttpServletRequest request, HttpServletResponse response)
    {

        String companyId = request.getParameter("companyId");
        String[] array = companyId.split(",");
        for(int i=0;i<array.length;i++)
        {
            boolean result = reviewModel.deleteCompany(array[i]);
        }
        try
        {
           request.getRequestDispatcher("/review/operatorManage").forward(request, response);
        } catch (ServletException | IOException e)
        {
            LOGGER.error("请求转发异常", e);
        }
    }


    @RequestMapping("/")
    public void reView(Model model, HttpServletRequest request, HttpServletResponse response)
    {
        page = request.getAttribute("page") != null ? (Integer) request.getAttribute("page") : 1;
        size = 15;
        try
        {
            productReview(model, request, response);
        }
        catch (ServletException e)
        {
            LOGGER.info("servlet服务器异常", e);
        }
        catch (IOException e)
        {
            LOGGER.error("IO流异常", e);
        }
    }

    @RequestMapping("/getdataproducts")
    @ResponseBody
    public Map<String, Object> getProductAjax(@RequestParam(value = "reviewState", defaultValue = "0") Integer reviewState, int offset, int limit, String sort, String order)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.getProductList(reviewState, offset, limit, sort, order));
        map.put("total", reviewModel.getProductInfoListTotal(reviewState, sort, order));
        return map;
    }


    //获取记录信息
    @RequestMapping("/getDataRecord")
    @ResponseBody
    public Map<String, Object> getRecordAjax(@RequestParam(value = "productId", defaultValue = "0") Integer productId, int offset, int limit, String sort, String order)
    {
        String recordId = reviewModel.getProductRecordIdByProductId(productId);
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.selectOperateRecordByRecordID(recordId));
        map.put("total", reviewModel.getRecordInfoListTotal(recordId, sort, order));
        return map;
    }


    @RequestMapping("/getdataAds")
    @ResponseBody
    public Map<String, Object> getAdsAjax(@RequestParam(value = "reviewState", defaultValue = "0") Integer reviewState, int offset, int limit, String sort, String order)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.getAdsInfoList(reviewState, offset, limit, sort, order));
        map.put("total", reviewModel.getAdsInfoListTotal(reviewState, sort, order));
        return map;
    }

    @RequestMapping("/getDataCompany")
    @ResponseBody
    public Map<String, Object> getCompanyAjax(@RequestParam(value = "reviewState", defaultValue = "0") Integer reviewState, @RequestParam(value = "offset", required = false) int offset, @RequestParam(value = "limit", required = false) int limit, @RequestParam(value = "sort", required = false) String sort, @RequestParam(value = "order", required = false) String order)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.getCompanyList(reviewState,offset, limit, sort, order));
        map.put("total", reviewModel.getCompanyListTotal(reviewState, sort, order));
        return map;
    }

    @RequestMapping("/getAllDataCompany")
    @ResponseBody
    public Map<String, Object> getAllCompanyAjax(@RequestParam(value = "reviewState", defaultValue = "0") Integer reviewState, @RequestParam(value = "offset", required = false) int offset, @RequestParam(value = "limit", required = false) int limit, @RequestParam(value = "sort", required = false) String sort, @RequestParam(value = "order", required = false) String order)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.getAllCompanyList(offset, limit, sort, order));
        map.put("total", reviewModel.getCompanyListTotal(reviewState, sort, order));
        return map;
    }


    @RequestMapping("/getdataNews")
    @ResponseBody
    public Map<String, Object> getNewsAjax(@RequestParam(value = "reviewState", defaultValue = "0") Integer reviewState, @RequestParam(value = "offset", required = false) int offset, @RequestParam(value = "limit", required = false) int limit, @RequestParam(value = "sort", required = false) String sort, @RequestParam(value = "order", required = false) String order)
    {
        Map<String, Object> map = new HashMap<>();
        map.put("rows", reviewModel.getNewsList(reviewState, offset, limit, sort, order));
        map.put("total", reviewModel.getNewsListTotal(reviewState, sort, order));
        return map;
    }

    //更改商品为下架状态
    @RequestMapping("/updateProductState")
    public String updateProductState(HttpServletRequest request)
    {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("currentUser");//获取当前用户名
        int id = Integer.parseInt(request.getParameter("id")); //获取商品id
        String checker = user.getName();
        String OffProductInfo = request.getParameter("OffProductInfo"); //获取商品下架原因

        String reasonName = "  下架原因:";
        String offProductInfo = checker + reasonName + OffProductInfo;
        productModel.addInfo(id, offProductInfo);  //添加下架原因
        reviewModel.updateProductReviewState(id, 1, 1); //更改商品状态
        return "operator1";
    }

	//找公司审核记录
	@RequestMapping("/findComReviewAdvice")
	@ResponseBody
	public List<OperateRecord> findComReviewAdvice(@RequestParam("companyId") String companyId){

		Company company = new Company();
		company = reviewModel.queryCompanyByCompanyID(companyId);
		String recordId = company.getRecordID();

		List<OperateRecord>  operateRecords = reviewModel.selectOperateRecordByRecordID(recordId);

		Collections.reverse(operateRecords);

		return operateRecords;
	}
}
