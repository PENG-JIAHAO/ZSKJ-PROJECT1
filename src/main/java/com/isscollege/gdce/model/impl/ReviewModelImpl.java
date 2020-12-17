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

	@Override/*改动*/
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

	//浏览经销商表
	@Override
	public List<Company> getCompanyInfo(int groupNum,int offset, int limit, String sort, String order) {
		return service.getCompanyInfo(groupNum,offset, limit, sort, order);
	}
	//浏览经销商设备表
	@Override
	public List<equipment> getCompanyEquipment(String company_Id,int offset, int limit, String sort, String order) {
		return service.getCompanyEquipment(company_Id,offset, limit, sort, order);
	}
	//浏览所有经销商表
	@Override
	public List<Company> getAllCompanyInfo(int offset, int limit, String sort, String order) {
		return service.getAllCompanyInfo(offset, limit, sort, order);
	}
	//浏览经销商数量
	@Override
	public int getCompanyListTotal(int groupNum, String sort, String order) {
		return service.getCompanyListTotal(groupNum, sort, order);
	}
	//浏览经销商设备数量
	@Override
	public 	int getCompanyEquipmentTotal(String company_Id,String sort,String order){
		return service.getCompanyEquipmentListTotal(company_Id,sort,order);
	}
	//浏览所有经销商数量
	@Override
	public int getAllCompanyListTotal(String sort, String order) {
		return service.getAllCompanyListTotal(sort, order);
	}
	//删除经销商
	@Override
	public boolean deleteCompany(String company_Id)
	{
		return service.deleteCompany(company_Id);
	}
	//新增经销商
	@Override
	public boolean addNewCompany(Company newcompany)
	{
		return service.addNewCompany(newcompany);
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



	//浏览设备使用商表
	@Override
	public List<Shop> getShopInfo(int groupNum,int offset, int limit, String sort, String order) {
		return service.getShopInfo(groupNum,offset, limit, sort, order);
	}
	//浏览设备使用商设备表
	@Override
	public List<equipment> getShopEquipment(String shop_id,int offset, int limit, String sort, String order) {
		return service.getShopEquipment(shop_id,offset, limit, sort, order);
	}
	//浏览所有设备使用商表
	@Override
	public List<Shop> getAllShopInfo(int offset, int limit, String sort, String order) {
		return service.getAllShopInfo(offset, limit, sort, order);
	}
	//浏览设备使用商数量
	@Override
	public int getShopListTotal(int groupNum, String sort, String order) {
		return service.getShopListTotal(groupNum, sort, order);
	}
	//浏览设备使用商设备数量
	@Override
	public 	int getShopEquipmentTotal(String company_Id,String sort,String order){
		return service.getShopEquipmentListTotal(company_Id,sort,order);
	}
	//浏览所有设备使用商数量
	@Override
	public int getAllShopListTotal(String sort, String order) {
		return service.getAllShopListTotal(sort, order);
	}
	//删除设备使用商
	@Override
	public boolean deleteShop(String shop_id)
	{
		return service.deleteShop(shop_id);
	}
	//新增设备使用商
	@Override
	public boolean addNewShop(Shop newShop)
	{
		return service.addNewShop(newShop);
	}



}
