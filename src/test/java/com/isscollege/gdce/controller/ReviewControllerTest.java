package com.isscollege.gdce.controller;


import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.OperateRecord;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.model.IAdvertisementModel;
import com.isscollege.gdce.model.IReviewModel;
import com.isscollege.gdce.util.RIDUtil;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.log4j.Logger;
import org.easymock.Capture;
import org.easymock.CaptureType;
import org.easymock.EasyMock;
import org.junit.*;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.util.ReflectionTestUtils;
import static org.easymock.EasyMock.capture;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;


public class ReviewControllerTest
{

    private ReviewController reviewController = null;
    private IReviewModel reviewModel = null;
    private IAdvertisementModel advertisementModel = null;
    private MockHttpServletRequest request = null;
    private MockHttpServletResponse response = null;
    private MockHttpSession session = null;
    private Logger LOGGER = null;

    @Before
    public void setUp() throws Exception
    {
        reviewController = new ReviewController();
        request = new MockHttpServletRequest();
        response = new MockHttpServletResponse();
        session = new MockHttpSession();
        reviewModel = EasyMock.createMock(IReviewModel.class);
        advertisementModel = EasyMock.createMock(IAdvertisementModel.class);
        ReflectionTestUtils.setField(reviewController, "reviewModel", reviewModel);
        ReflectionTestUtils.setField(reviewController, "advertisementModel", advertisementModel);
    }

   @Test
    public void should_changePro_success_when_data_is_valid_and_state_is_not_zero() throws Exception
    {
       String rid = RIDUtil.getRIDTest();
       //录入模拟数据
        User user = new User("user", "word", true);
        session.setAttribute("currentUser", user);
        request.setParameter("productId", "100000");
        request.setParameter("prostate", "1");
        request.setParameter("state", "1");
        request.setParameter("page", "3");
        int productId = NumberUtils.toInt(request.getParameter("productId"));
        int prostate = NumberUtils.toInt(request.getParameter("prostate"));
        int state = NumberUtils.toInt(request.getParameter("state"));

        Capture<OperateRecord> captureRecord = Capture.newInstance(CaptureType.ALL);
        reviewModel.updateProductRecordID(rid, productId);
        EasyMock.expect(reviewModel.addOperateRecord(capture(captureRecord))).andReturn(1);
        reviewModel.updateProductReviewState(productId, prostate, state);

        EasyMock.replay(reviewModel);
        reviewController.changePro(request, response, session);
        EasyMock.verify(reviewModel);

        OperateRecord operateRecord = captureRecord.getValue();
        assertEquals(rid, operateRecord.getRecordID());
        assertEquals("user", operateRecord.getUserName());
        assertEquals(state, operateRecord.getOperateType());
        assertNotNull(operateRecord.getCreateDate());
        assertEquals("first audit", operateRecord.getComment());
        assertEquals("productReview?page=" + request.getParameter("page"),
                response.getHeader("Location"));
    }

    @Test
    public void should_changePro_success_when_data_is_valid_and_state_is_zero() throws Exception
    {
        String rid = RIDUtil.getRIDTest();
        //录入模拟数据
        User user = new User("user", "word", true);
        session.setAttribute("currentUser", user);
        request.setParameter("productId", "100000");
        request.setParameter("prostate", "1");
        request.setParameter("state", "0");
        request.setParameter("page", "3");
        int productId = NumberUtils.toInt(request.getParameter("productId"));
        int prostate = NumberUtils.toInt(request.getParameter("prostate"));
        int state = NumberUtils.toInt(request.getParameter("state"));

        Capture<OperateRecord> captureRecord = Capture.newInstance(CaptureType.ALL);
        EasyMock.expect(reviewModel.addOperateRecord(capture(captureRecord))).andReturn(1);
        reviewModel.updateProductReviewState(productId, prostate, state);

        EasyMock.replay(reviewModel);
        reviewController.changePro(request, response, session);
        EasyMock.verify(reviewModel);

        OperateRecord operateRecord = captureRecord.getValue();
        assertEquals(rid, operateRecord.getRecordID());
        assertEquals("user", operateRecord.getUserName());
        assertEquals(state, operateRecord.getOperateType());
        assertNotNull(operateRecord.getCreateDate());
        assertEquals("", operateRecord.getComment());
        assertEquals("productReview?page=" + request.getParameter("page"),
                response.getHeader("Location"));
    }

    @Test
    public void should_changePro_continue_when_user_is_not_valid()
    {
        session.setAttribute("currentUser", null);
        reviewController.changePro(request, response, session);
        assertEquals("productReview?page=" + request.getParameter("page"),
                response.getHeader("Location"));
    }

    @Test
    public void should_changeAdv_continue_when_user_is_none()
    {
        session.setAttribute("currentUser", null);
        reviewController.changeAdv(1, 1, response, request, session);
        assertEquals("advertisementReview?page=null", response.getHeader("Location"));
    }

    @Test
    public void should_changeAdv_success_when_user_is_not_none() throws Exception
    {
        User user = new User("user", "word", true);
        session.setAttribute("currentUser", user);
        OperateRecord operateRecord = new OperateRecord();
        Advertisement advertisement = new Advertisement();
        advertisement.setRecordID("AR202010301111260586");
        operateRecord.setRecordID("AR202010301111260586");
        operateRecord.setUserName("user");
        operateRecord.setOperateType(1);
        operateRecord.setCreateDate(RIDUtil.getCreateDate());
        operateRecord.setComment("");
        request.setSession(session);
        reviewModel.updateAdvertisementReviewState(1, 1);

        EasyMock.expect(advertisementModel.getAdsInfo(1)).andReturn(advertisement);
        EasyMock.expect(reviewModel.addOperateRecord(operateRecord)).andReturn(1);

        EasyMock.replay(advertisementModel);
        reviewController.changeAdv(1, 1, response, request, session);
        EasyMock.verify(advertisementModel);

        assertEquals("AR202010301111260586", operateRecord.getRecordID());
        assertEquals("user", operateRecord.getUserName());
        assertEquals(1, operateRecord.getOperateType());
        assertNotNull(operateRecord.getCreateDate());
        assertEquals("", operateRecord.getComment());
        assertEquals("advertisementReview?page=null", response.getHeader("Location"));
    }

    @Test
    public void should_changeNew_is_success_when_data_is_valid()throws Exception
    {
        //录入模拟数据
        session.setAttribute("currentUser", new User("admin", "word", true));
        request.setParameter("state","1");
        request.setParameter("productId","1234");
        request.setParameter("page","3");

        //记录调用
        EasyMock.expect(reviewModel.queryNewsByID(1234)).andReturn(new News());
        reviewModel.updateNewsReviewState(1234,1);
        EasyMock.expect(reviewModel.addOperateRecord(EasyMock.isA(OperateRecord.class))).andReturn(1);

        //记录回放
        EasyMock.replay(reviewModel);
        //执行业务逻辑
        reviewController.changeNew(request,response,session);
        //验证
        EasyMock.verify(reviewModel);
        //结果有效性检验
        Assert.assertEquals("newsReview?page=3",response.getRedirectedUrl());

    }
}
