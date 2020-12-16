package com.isscollege.gdce.model.impl;

import java.util.List;

import com.isscollege.gdce.domain.*;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.model.IReviewModel;
import com.isscollege.gdce.service.IReviewService;

@Component
public class ReviewModelImpl implements IReviewModel
{
	private static final Logger LOGGER = Logger.getLogger(ReviewModelImpl.class);
	@Autowired
	private IReviewService service;

	public ReviewModelImpl()
	{
	}

	@Override
	public List<Advertisement> queryAdvertisementByReviewState(int page, int size)
	{
		return service.queryAdvertisementByReviewState(page, size);
	}
	@Override
	public List<Advertisement> queryAdvertisementByReviewStatenotpass(int page, int size)
	{
		return service.queryAdvertisementByReviewStatenotpass(page, size);
	}

	@Override
	public List<Advertisement> queryAdvertisementByState(int reviewState, int page, int size) {
		return service.queryAdvertisementByState(reviewState,page,size);
	}

	@Override
	public void updateAdvertisementReviewState(int advertisementId, int curStats)
	{
		service.updateAdvertisementReviewState(advertisementId, curStats);
	}

	@Override
	public void updateAdvertisementRecordId(int adId, String recordId)
	{
		service.updateAdvertisementRecordId(adId,recordId);
	}

	@Override
	public List<Company> queryCompanyByReviewState(int page, int size)
	{
		return service.queryCompanyByReviewState(page, size);
	}
	@Override
	public List<Company> queryCompanyByReviewStatenotpass(int page, int size)
	{
		return service.queryCompanyByReviewStatenotpass(page, size);
	}

	@Override
	public List<Company> queryCompanyByState(int reviewState, int page, int size) {
		return service.queryCompanyByState(reviewState,page,size);
	}


	@Override
	public void updateCompanyReviewState(int curStats, String companyId)
	{
		service.updateCompanyReviewState(curStats, companyId);
	}

	@Override
	public void updateNewsRecordID(int newsId, String recordID)
	{
		service.updateNewsRecordID(newsId, recordID);
	}

	@Override
	public void updateCompanyRecordID(String recordId, String companyId)
	{
		service.updateCompanyRecordID(recordId, companyId);
	}

	@Override
	public List<Product> queryProductByReviewState(int page, int size)
	{
		return service.queryProductByReviewState(page, size);
	}
	@Override
	public List<Product> queryProductByReviewStatenotpass(int page, int size)
	{
		return service.queryProductByReviewStatenotpass(page, size);
	}

	@Override
	public List<Product> queryProductByState(int reviewState, int page, int size) {
		return service.queryProductByState(reviewState,page,size);
	}

	@Override
	public void updateProductReviewState(int productId, int proStats, int curStats)
	{
		service.updateProductReviewState(productId, proStats, curStats);
	}

	@Override/*¸Ä¶¯*/
	public void updateProductRecordID(String recordId, int productId)
	{
		service.updateProductRecordID(recordId, productId);
	}

	@Override
	public List<News> queryNewsByReviewState(int page, int size)
	{
		return service.queryNewsByReviewState(page, size);
	}
	@Override
	public List<News> queryNewsByReviewStatenotpass(int page, int size)
	{
		return service.queryNewsByReviewStatenotpass(page, size);
	}

	@Override
	public List<News> queryNewsByState(int reviewState, int page, int size) {
		return service.queryNewsByState(reviewState,page,size);
	}

	@Override
	public void updateNewsReviewState(int newsId, int curStats)
	{
		service.updateNewsReviewState(newsId, curStats);
	}

	@Override
	public Company queryCompanyByCompanyID(String CompanyId) { return service.queryCompanyByCompanyID(CompanyId); }

	@Override
	public User queryUserByCompanyId(String companyId) { return service.queryUserByCompanyId(companyId); }


	@Override
	public List<News> getAllNewsInfo() {
		return service.getAllNewsInfo();
	}

	@Override
	public List<Company> getAllCompany() {
		return service.getAllCompany();
	}

	@Override
	public List<Product> getAllProductInfo() {
		return service.getAllProductInfo();
	}

	@Override
	public List<Advertisement> getAllAdsInfo() {
		return service.getAllAdsInfo();
	}

	@Override
	public List<Advertisement> getAdsInfoList(int reviewState,int offset, int limit, String sort, String order) {
		return service.getAdsInfoList(reviewState,offset, limit, sort, order);
	}

	@Override
	public int getAdsInfoListTotal(int reviewState, String sort, String order) {
		return service.getAdsInfoListTotal(reviewState, sort, order);
	}

	@Override
	public List<Product> getProductList(int reviewState,int offset, int limit, String sort, String order) {
		return service.getProductList(reviewState,offset, limit, sort, order);
	}

	@Override
	public List<News> getNewsList(int reviewState, int offset, int limit, String sort, String order) {
		return service.getNewsList(reviewState,offset, limit, sort, order);
	}

	@Override
	public int getNewsListTotal(int reviewState, String sort, String order) {
		return service.getNewsListTotal(reviewState, sort, order);
	}

	@Override
	public List<Company> getCompanyList(int reviewState,int offset, int limit, String sort, String order) {
		return service.getCompanyList(reviewState,offset, limit, sort, order);
	}

	@Override
	public List<Company> getAllCompanyList(int offset, int limit, String sort, String order) {
		return service.getAllCompanyList(offset, limit, sort, order);
	}

	@Override
	public int getCompanyListTotal(int reviewState, String sort, String order) {
		return service.getCompanyListTotal(reviewState, sort, order);
	}

	@Override
	public int getProductInfoListTotal(int reviewState,String sort, String order) {
		return service.getProductInfoListTotal(reviewState,sort,order);
	}

	@Override
	public String getProductRecordIdByProductId(int productId) {
		return service.getProductRecordIdByProductId(productId);
	}

	@Override
	public String getCompanyRecordIdByCompanyId(String companyId) {
		return service.getCompanyRecordIdByCompanyId(companyId);
	}

	@Override
	public List<OperateRecord> selectOperateRecordByRecordID(String rid) {
		return service.selectOperateRecordByRecordID(rid);
	}

	@Override
	public int getRecordInfoListTotal(String recordId, String sort, String order) {
		return service.getRecordInfoListTotal(recordId,sort,order);
	}

	@Override
	public int addOperateRecord(OperateRecord vr) {
		return service.addOperateRecord(vr);
	}

	@Override
	public News queryNewsByID(int Id)
	{
		return service.queryNewsByID(Id);
	}

	@Override
	public boolean deleteCompany(String companyId)
	{
		return service.deleteCompany(companyId);
	}

	@Override
	public boolean addNewCompany(Company newcompany)
	{
		return service.addNewCompany(newcompany);
	}
}
