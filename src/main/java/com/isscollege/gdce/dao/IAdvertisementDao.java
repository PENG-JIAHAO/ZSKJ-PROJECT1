package com.isscollege.gdce.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.isscollege.gdce.domain.Advertisement;

public interface IAdvertisementDao
{
    int addAdvertisement(Advertisement ad);

    int deleteAdsInfo(@Param("id") int id);

    Advertisement queryInfoByCompanyId(@Param("companyId") String companyId);

    void updateAdvertisementReviewState(@Param("adId") int adId, @Param("state") int state);

    void updateAdvertisementRecordId(@Param("adId") int adId, @Param("recordId") String recordId);

    void updatemessage(Advertisement advertisement);

    List<Advertisement> queryAdvertisementByReviewState(@Param("page") int page, @Param("size") int size);

    List<Advertisement> queryAdvertisementByReviewStatenotpass(@Param("page") int page, @Param("size") int size);

    List<Advertisement> queryAdvertisementByState(@Param("reviewState") int reviewState, @Param("page") int page,
                                                  @Param("size") int size);

    List<Advertisement> getAdsInfoList(@Param("reviewState") int reviewState, @Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

    int getAdsInfoListTotal(@Param("reviewState") int reviewState, @Param("sort") String sort, @Param("order") String order);

    List<Advertisement> getAllAdsInfo();

    Advertisement getAdsInfo(@Param("id") int id);
}
