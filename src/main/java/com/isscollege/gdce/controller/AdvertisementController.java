package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.model.IAdvertisementModel;
import com.isscollege.gdce.util.FileUtil;
import com.isscollege.gdce.util.RIDUtil;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/*
 * 广告
 * */
@Controller
@PropertySource("classpath:filePath.properties")
@RequestMapping("/ads")
public class AdvertisementController extends HttpServlet
{
    private static final Logger LOGGER = Logger.getLogger(AdvertisementController.class);
    @Autowired
    private IAdvertisementModel advertisementModel;
    @Value("${uploadPath}")
    private String uploadPath;
    @Value("${fileServerAdderss}")
    private String fileServerAdderss;
    private static final String FILE_PATH = "/imgs/ad/";
    private String filepath = "ads/";

    @RequestMapping("queryAdvertisement")
    public String queryAdvertisement(@RequestParam(value = "reviewState") Integer state, Model model)
            throws ServletException, IOException
	{
        int reviewState = NumberUtils.toInt(ObjectUtils.toString(state));

        List<Advertisement> advertisements = advertisementModel.getAdvertisment(reviewState);
        if (reviewState == 0) {
            model.addAttribute("unreviewAdvertisements", advertisements);
        } else if (reviewState == 1) {
            model.addAttribute("reviewedAdvertisements", advertisements);
        } else if (reviewState == 2) {
            model.addAttribute("havereviewedAdvertisements", advertisements);
        } else if (reviewState == 3) {
            model.addAttribute("havereviewedAdvertisementsnotpass", advertisements);
        }
        return "ad/management";
    }

    @RequestMapping("/addAdvertisement")
    public String addAdvertisement(HttpServletRequest request, HttpServletResponse response, @RequestParam("adsImgPath") MultipartFile file) throws ServletException, IOException, SQLException, FileUploadException
	{
        String companyId = StringUtils.defaultString(request.getParameter("companyId"), "");
        String position = StringUtils.defaultString(request.getParameter("position"), "");
        String releaseDate = StringUtils.defaultString(request.getParameter("releaseDate"), "");
        String endDate = StringUtils.defaultString(request.getParameter("endDate"), "");
        String price = StringUtils.defaultString(request.getParameter("price"), "");
        String email = StringUtils.defaultString(request.getParameter("email"), "");
        String oldName = file.getOriginalFilename();
        String adsURL = StringUtils.defaultString(request.getParameter("adsURL"), "");
        String note = StringUtils.defaultString(request.getParameter("note"), "");
        Advertisement advertisement = new Advertisement();
        advertisement.setCompanyId(companyId);
        advertisement.setPosition(Integer.parseInt(position));
        advertisement.setReleaseDate(releaseDate);
        advertisement.setEndDate(endDate);
        advertisement.setEmail(email);
        advertisement.setAdsImgPath(filepath + companyId + "/" + oldName);
        advertisement.setAdsURL(adsURL);
        advertisement.setNote(note);
        advertisement.setPrice(Double.parseDouble(price));
        advertisement.setReviewState(0);
        advertisement.setSubmitDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        advertisement.setRecordID(RIDUtil.getRID());
        advertisementModel.addAdvertisement(advertisement);
        approvalFile(file, uploadPath, companyId, oldName);
        return "ad/management";
    }

    public void approvalFile(MultipartFile filecontent, String path, String companyId, String filename)
	{
        String[] fileItems = StringUtils.split(filename, "\\.");
        String fileName = fileItems[0] + "." + fileItems[1];
        File tempFile = new File(uploadPath, "\\ads\\" + companyId + "\\");
        if (!tempFile.exists()) {
            tempFile.mkdirs();
        }
        try {
            filecontent.transferTo(new File(tempFile, fileName));
        } catch (IOException e)
        {
            LOGGER.error("Fail to save the advertisement image to the local path !",e);
        }
    }

    @RequestMapping("/loadQualificationpicture")
    public void showImage(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
        response.setContentType("image/jpeg");
        OutputStream toClient = response.getOutputStream();
        toClient.write(FileUtil.readFile(uploadPath + request.getParameter("path")));
        toClient.flush();
        toClient.close();
    }

    @RequestMapping("/updateadsmessage")
    public String updateadsmessage(HttpServletRequest request, HttpServletResponse response, @RequestParam("adsImgPath") CommonsMultipartFile file, @RequestParam(value = "id") int id)
	{
        String companyId = StringUtils.defaultString(request.getParameter("companyId"), "");
        String position = StringUtils.defaultString(request.getParameter("position"), "");
        String releaseDate = StringUtils.defaultString(request.getParameter("releaseDate"), "");
        String endDate = StringUtils.defaultString(request.getParameter("endDate"), "");
        String price = StringUtils.defaultString(request.getParameter("price"), "");
        String email = StringUtils.defaultString(request.getParameter("email"), "");
        String oldName = file.getOriginalFilename();
        String adsURL = StringUtils.defaultString(request.getParameter("adsURL"), "");
        String note = StringUtils.defaultString(request.getParameter("note"), "");
        Advertisement advertisement = new Advertisement();
        advertisement.setId(id);
        advertisement.setCompanyId(companyId);
        advertisement.setPosition(Integer.parseInt(position));
        advertisement.setReleaseDate(releaseDate);
        advertisement.setEndDate(endDate);
        advertisement.setEmail(email);
        advertisement.setAdsImgPath(filepath + companyId + "/" + oldName);
        advertisement.setAdsURL(adsURL);
        advertisement.setNote(note);
        advertisement.setPrice(Double.parseDouble(price));
        advertisement.setReviewState(0);
        advertisementModel.updatemessage(advertisement);
        approvalFile(file, uploadPath, companyId, oldName);
        return "ad/management";
    }

    @RequestMapping("/adUpdate")
    public String jumpupdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "advertisement") int id)
	{
        Advertisement advertisement = advertisementModel.getAdsInfo(id);
        session.setAttribute("advertisement", advertisement);
        return "ad/adUpdate";
    }

    @RequestMapping("/getAdRID")
    public String getAdRID(@RequestParam(value = "id")int id)
    {
        return advertisementModel.getAdsInfo(id).getRecordID();
    }
}