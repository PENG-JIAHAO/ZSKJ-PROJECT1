package com.isscollege.gdce.controller;

import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.model.IAdvertisementModel;
import org.apache.commons.fileupload.FileUploadException;
import org.easymock.EasyMock;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import static org.junit.Assert.*;

public class AdvertisementControllerTest extends HttpServlet
{
    private AdvertisementController controller = null;
    private IAdvertisementModel model = null;
    private MockHttpServletRequest request = null;
    private MockHttpServletResponse response = null;
    private MockHttpSession session = null;

    @Before
    public void setUp()
    {
        response = new MockHttpServletResponse();
        session = new MockHttpSession();
        controller = new AdvertisementController();
        model = EasyMock.createMock(IAdvertisementModel.class);
        request = new MockHttpServletRequest();
        request.setSession(session);
        ReflectionTestUtils.setField(controller, "advertisementModel", model);
        //delete file
        new File("D:/ads/916402210275456046/001.PNG").delete();
        new File("D:/ads/916402210275456046").delete();
        new File("D:/ads").delete();
    }

    @Test
    public void should_queryAdvertisement_is_success_when_reviewstate_is_0() throws ServletException, IOException
    {
        Model mockModel = EasyMock.createMock(Model.class);
        List<Advertisement> advTestList = new ArrayList<>();
        Advertisement adv = new Advertisement();
        adv.setId(0);
        adv.setCompanyId("0");
        adv.setPosition(0);
        adv.setEmail("@email");
        adv.setAdsImgPath("/imgs/ads/1.jpg");
        adv.setAdsURL("wwww");
        adv.setNote("adv");
        adv.setReleaseDate("yyyy-MM-dd");
        adv.setEndDate("yyyy-MM-dd");
        adv.setPrice(1.0);
        adv.setSubmitDate("yyyy-MM-dd");
        advTestList.add(adv);

        EasyMock.expect(model.getAdvertisment(0)).andReturn(advTestList);
        EasyMock.expect(mockModel.addAttribute("unreviewAdvertisements", advTestList)).andReturn(mockModel);

        EasyMock.replay(mockModel, model);
        String nextJumpPage = controller.queryAdvertisement(null, mockModel);
        EasyMock.verify(mockModel, model);

        assertEquals("ad/management", nextJumpPage);
    }

    @Test
    public void should_queryAdvertisement_is_success_when_reviewstate_is_1() throws ServletException, IOException
    {
        Model mockModel = EasyMock.createMock(Model.class);
        List<Advertisement> advTestList = new ArrayList<>();
        Advertisement adv = new Advertisement();
        adv.setId(1);
        adv.setCompanyId("1");
        adv.setPosition(1);
        adv.setEmail("@email");
        adv.setAdsImgPath("/imgs/ads/1.jpg");
        adv.setAdsURL("wwww");
        adv.setNote("adv");
        adv.setReleaseDate("yyyy-MM-dd");
        adv.setEndDate("yyyy-MM-dd");
        adv.setPrice(1.0);
        adv.setSubmitDate("yyyy-MM-dd");
        advTestList.add(adv);

        EasyMock.expect(model.getAdvertisment(1)).andReturn(advTestList);
        EasyMock.expect(mockModel.addAttribute("reviewedAdvertisements", advTestList)).andReturn(mockModel);

        EasyMock.replay(mockModel, model);
        String nextJumpPage = controller.queryAdvertisement(1, mockModel);
        EasyMock.verify(mockModel, model);

        assertEquals("ad/management", nextJumpPage);
    }

    @Test
    public void should_queryAdvertisement_is_success_when_reviewstate_is_2() throws ServletException, IOException
    {
        Model mockModel = EasyMock.createMock(Model.class);
        List<Advertisement> advTestList = new ArrayList<>();
        Advertisement adv = new Advertisement();
        adv.setId(2);
        adv.setCompanyId("2");
        adv.setPosition(2);
        adv.setEmail("@email");
        adv.setAdsImgPath("/imgs/ads/1.jpg");
        adv.setAdsURL("wwww");
        adv.setNote("adv");
        adv.setReleaseDate("yyyy-MM-dd");
        adv.setEndDate("yyyy-MM-dd");
        adv.setPrice(1.0);
        adv.setSubmitDate("yyyy-MM-dd");
        advTestList.add(adv);

        EasyMock.expect(model.getAdvertisment(2)).andReturn(advTestList);
        EasyMock.expect(mockModel.addAttribute("havereviewedAdvertisements", advTestList)).andReturn(mockModel);

        EasyMock.replay(mockModel, model);
        String nextJumpPage = controller.queryAdvertisement(2, mockModel);
        EasyMock.verify(mockModel, model);

        assertEquals("ad/management", nextJumpPage);
    }

    @Test
    public void should_queryAdvertisement_is_success_when_reviewstate_is_3() throws ServletException, IOException
    {
        Model mockModel = EasyMock.createMock(Model.class);
        List<Advertisement> advTestList = new ArrayList<>();
        Advertisement adv = new Advertisement();
        adv.setId(3);
        adv.setCompanyId("3");
        adv.setPosition(3);
        adv.setEmail("@email");
        adv.setAdsImgPath("/imgs/ads/1.jpg");
        adv.setAdsURL("wwww");
        adv.setNote("adv");
        adv.setReleaseDate("yyyy-MM-dd");
        adv.setEndDate("yyyy-MM-dd");
        adv.setPrice(1.0);
        adv.setSubmitDate("yyyy-MM-dd");
        advTestList.add(adv);

        EasyMock.expect(model.getAdvertisment(3)).andReturn(advTestList);
        EasyMock.expect(mockModel.addAttribute("havereviewedAdvertisementsnotpass", advTestList)).andReturn(mockModel);

        EasyMock.replay(mockModel, model);
        String nextJumpPage = controller.queryAdvertisement(3, mockModel);
        EasyMock.verify(mockModel, model);

        assertEquals("ad/management", nextJumpPage);
    }

    @Test
    public void should_addAdvertisement_is_success_when_localPath_is_not_existing() throws SQLException, FileUploadException,
            ServletException, IOException
    {
        //录入行为
        request.setParameter("id", "2");
        request.setParameter("companyId", "916402210275456046");
        request.setParameter("position", "1");
        request.setParameter("releaseDate", "2020-10-21");
        request.setParameter("endDate", "2020-12-22");
        request.setParameter("price", "100");
        request.setParameter("email", "123@qq.com");
        request.setParameter("adsURL", "http://fuel.powerec.net/newsCenter.jspx");
        request.setParameter("note", "hello");
        FileInputStream in = new FileInputStream(".\\src\\test\\resources\\imgs\\ad\\001.PNG");
        MultipartFile file = new MockMultipartFile("001.PNG", "001.PNG", "multipart/form-data", in);
        Advertisement ad = new Advertisement();
        ad.setId(Integer.parseInt(request.getParameter("id")));
        ad.setCompanyId(request.getParameter("companyId"));
        ad.setPosition(Integer.parseInt(request.getParameter("position")));
        ad.setReleaseDate(request.getParameter("releaseDate"));
        ad.setEndDate(request.getParameter("endDate"));
        ad.setPrice(Double.parseDouble(request.getParameter("price")));
        ad.setEmail(request.getParameter("email"));
        ad.setAdsURL(request.getParameter("adsURL"));
        ad.setNote(request.getParameter("note"));
        ad.setAdsImgPath("ads/" + ad.getCompanyId() + "/" + file.getOriginalFilename());
        ad.setReviewState(0);
        ad.setSubmitDate("yyyy-MM-dd");
        ad.setRecordID("2");
        EasyMock.anyObject(Advertisement.class);
        EasyMock.expect(model.addAdvertisement(ad)).andReturn(1);

        //记录回放
        EasyMock.replay(model);

        //执行业务逻辑
        controller.addAdvertisement(request, response, file);

        //验证
        EasyMock.verify(model);

        //结果有效性检验
        assertTrue("图片保存失败", new File("D:/ads/" + ad.getCompanyId() + "/001.PNG").exists());
    }

    @Test
    public void should_addAdvertisement_is_success_when_localPath_is_existing() throws SQLException, FileUploadException,
            ServletException, IOException
    {
        //create localPath
        File tempFile = new File("D:\\ads\\916402210275456046\\");
        tempFile.mkdirs();
        //录入行为
        request.setParameter("id", "2");
        request.setParameter("companyId", "916402210275456046");
        request.setParameter("position", "1");
        request.setParameter("releaseDate", "2020-10-21");
        request.setParameter("endDate", "2020-12-22");
        request.setParameter("price", "100");
        request.setParameter("email", "123@qq.com");
        request.setParameter("adsURL", "http://fuel.powerec.net/newsCenter.jspx");
        request.setParameter("note", "hello");
        FileInputStream in = new FileInputStream(".\\src\\test\\resources\\imgs\\ad\\001.PNG");
        MultipartFile file = new MockMultipartFile("001.PNG", "001.PNG", "multipart/form-data", in);
        Advertisement ad = new Advertisement();
        ad.setId(Integer.parseInt(request.getParameter("id")));
        ad.setCompanyId(request.getParameter("companyId"));
        ad.setPosition(Integer.parseInt(request.getParameter("position")));
        ad.setReleaseDate(request.getParameter("releaseDate"));
        ad.setEndDate(request.getParameter("endDate"));
        ad.setPrice(Double.parseDouble(request.getParameter("price")));
        ad.setEmail(request.getParameter("email"));
        ad.setAdsURL(request.getParameter("adsURL"));
        ad.setNote(request.getParameter("note"));
        ad.setAdsImgPath("ads/" + ad.getCompanyId() + "/" + file.getOriginalFilename());
        ad.setReviewState(0);
        ad.setSubmitDate("yyyy-MM-dd");
        ad.setRecordID("2");
        EasyMock.anyObject(Advertisement.class);
        EasyMock.expect(model.addAdvertisement(ad)).andReturn(1);

        //记录回放
        EasyMock.replay(model);

        //执行业务逻辑
        controller.addAdvertisement(request, response, file);

        //验证
        EasyMock.verify(model);

        //结果有效性检验
        assertTrue("图片保存失败", new File("D:/ads/" + ad.getCompanyId() + "/001.PNG").exists());
    }

    @After
    public void tearDown() throws Exception
    {
        new File("D:/ads/916402210275456046/001.PNG").delete();
        new File("D:/ads/916402210275456046").delete();
        new File("D:/ads").delete();
    }
}
