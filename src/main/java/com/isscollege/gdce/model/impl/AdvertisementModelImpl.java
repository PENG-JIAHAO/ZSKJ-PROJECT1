package com.isscollege.gdce.model.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.model.IAdvertisementModel;
import com.isscollege.gdce.service.IAdvertisementService;

@Component("advertisementModelImpl")
public class AdvertisementModelImpl implements IAdvertisementModel
{
    private static final Logger LOGGER = Logger.getLogger(AdvertisementModelImpl.class);

    @Autowired
    private IAdvertisementService service;

    public AdvertisementModelImpl()
    {

    }

    @Override
    public int addAdvertisement(Advertisement ad)
    {
        return service.addAdvertisement(ad);
    }

    @Override
    public void updatemessage(Advertisement ad)
    {
        service.updatemessage(ad);
    }

    @Override
    public List<Advertisement> getAdvertisment(int reviewState)
    {

        return service.queryAdvertisementByState(reviewState);
    }

    @Override
    public Advertisement getAdsInfo(int id)
    {
        return service.getAdsInfo(id);
    }

}