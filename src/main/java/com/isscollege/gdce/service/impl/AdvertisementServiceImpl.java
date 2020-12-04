package com.isscollege.gdce.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.IAdvertisementDao;

import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.service.IAdvertisementService;

@Service("advertisementService")
public class AdvertisementServiceImpl implements IAdvertisementService
{
    private static final int BRANCH = 40;
    private static final Logger LOGGER = Logger.getLogger(AdvertisementServiceImpl.class);
    @Autowired
    private IAdvertisementDao dao;

    public AdvertisementServiceImpl()
    {
    }

    @Override
    public int addAdvertisement(Advertisement ad)
    {
        return dao.addAdvertisement(ad);
    }

    @Override
    public void updatemessage(Advertisement ad)
    {
        dao.updatemessage(ad);
    }

    @Override
    public List<Advertisement> queryAdvertisementByState(int reviewState)
    {
        return dao.queryAdvertisementByState(reviewState, 0, BRANCH);
    }

    @Override
    public Advertisement getAdsInfo(int id)
    {
        return dao.getAdsInfo(id);
    }

    @Override
    public int deleteAdsInfo(int id)
    {
        return dao.deleteAdsInfo(id);
    }

    @Override
    public Advertisement getInfoByCompanyId(String companyId)
    {
        return dao.queryInfoByCompanyId(companyId);
    }
}
