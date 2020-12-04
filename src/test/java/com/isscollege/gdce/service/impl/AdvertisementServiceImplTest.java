package com.isscollege.gdce.service.impl;

import com.isscollege.gdce.dao.IAdvertisementDao;
import com.isscollege.gdce.domain.Advertisement;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.List;


public class AdvertisementServiceImplTest
{
    private static AdvertisementServiceImpl advertisementService;
    private static IAdvertisementDao dao;

    @BeforeClass
    public static void setup()
    {
        advertisementService = new AdvertisementServiceImpl();
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring_gdce_context.xml");
        dao = (IAdvertisementDao) ac.getBean("IAdvertisementDao");
        ReflectionTestUtils.setField(advertisementService, "dao", dao);
    }

    @Test
    public void should_addAdvertisement_is_success_or_updateMessage_is_success_when_Info_is_change()
    {
        //进行添加广告数据的测试
        Advertisement ad = new Advertisement();
        ad.setCompanyId("916402210275456688");
        ad.setPosition(1);
        ad.setReleaseDate("2020-10-21");
        ad.setEndDate("2020-12-22");
        ad.setPrice(100);
        ad.setEmail("123@qq.com");
        ad.setAdsURL("http://fuel.powerec.net/newsCenter.jspx");
        ad.setNote("helloWorld");
        ad.setAdsImgPath("10.jpg");
        ad.setReviewState(1);
        ad.setSubmitDate("yyyy-MM-dd");
        ad.setRecordID("AR202010211145140855");
        advertisementService.addAdvertisement(ad);
        Advertisement tempAdInfo = advertisementService.getInfoByCompanyId("916402210275456688");
        int flagId = tempAdInfo.getId();
        Assert.assertNotNull(tempAdInfo);

        //进行更新广告数据的测试
        ad.setId(flagId);
        ad.setCompanyId("916402210275458899");
        advertisementService.updatemessage(ad);
        Assert.assertEquals("916402210275458899", (advertisementService.getAdsInfo(flagId)).getCompanyId());

        //数据库恢复
        advertisementService.deleteAdsInfo(flagId);
    }

    @Test
    public void should_queryAdvertisementByState_is_success_when_get_AdsInfo_is_success()
    {
        int reviewState = 0;
        List<Advertisement> ads = advertisementService.queryAdvertisementByState(reviewState);
        Assert.assertNotNull(ads);
        Assert.assertEquals(4,ads.size());
    }

    @Test
    public void should_getAdsInfo_is_success_when_get_AdsInfo_is_success()
    {
        int id = 1;
        Advertisement ad = advertisementService.getAdsInfo(id);
        Assert.assertNotNull(ad);
    }
}
