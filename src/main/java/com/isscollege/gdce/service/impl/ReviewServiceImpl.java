package com.isscollege.gdce.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.isscollege.gdce.dao.*;
import com.isscollege.gdce.domain.OperateRecord;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.isscollege.gdce.domain.Advertisement;
import com.isscollege.gdce.domain.Company;
import com.isscollege.gdce.domain.News;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.domain.User;
import com.isscollege.gdce.service.IReviewService;

@Service
public class ReviewServiceImpl implements IReviewService
{

	private static final Logger LOGGER = Logger.getLogger(ReviewServiceImpl.class);
	@Autowired
	private IProductDao productDao;
	@Autowired
	private ICompanyDao companyDao;
	@Autowired
	private IAdvertisementDao advertisementDao;
	@Autowired
	private INewsDao newsDao;
	@Autowired
	private IUserDao iUserDao;

	@Autowired
	private IOperateRecordDao operateRecordDao;

	public ReviewServiceImpl()
	{
	}

	@Override
	public List<Advertisement> queryAdvertisementByReviewState(int page, int size)
	{
		return advertisementDao.queryAdvertisementByReviewState(page, size);
	}
	@Override
	public List<Advertisement> queryAdvertisementByReviewStatenotpass(int page, int size)
	{
		return advertisementDao.queryAdvertisementByReviewStatenotpass(page, size);
	}

	@Override
	public void updateAdvertisementReviewState(int advertisementId, int curStats)
	{
		advertisementDao.updateAdvertisementReviewState(advertisementId, curStats);
	}


	@Override
	public void updateAdvertisementRecordId(int adId, String recordId)
	{
		advertisementDao.updateAdvertisementRecordId(adId, recordId);
	}


	@Override
	public List<Company> queryCompanyByReviewState(int page, int size)
	{
		return companyDao.queryCompanyByReviewState(page, size);
	}

	@Override
	public List<Company> queryCompanyByState(int reviewState, int page, int size) {
		return companyDao.queryCompanyByState(reviewState,page,size);
	}

	@Override
	public List<Company> queryCompanyByReviewStatenotpass(int page, int size)
	{
		return companyDao.queryCompanyByReviewStatenotpass(page, size);
	}

	@Override
	public void updateCompanyReviewState(int curStats, String companyId)
	{
		companyDao.updateCompanyReviewState(curStats, companyId);
	}

	@Override
	public void updateCompanyRecordID(String recordId, String companyId)
	{
		companyDao.updateCompanyRecordID(recordId, companyId);
	}

	@Override
	public List<Product> queryProductByReviewState(int page, int size)
	{
		Map<String ,Object>paraMap=new HashMap<String,Object>();
		paraMap.put("page", page);
		paraMap.put("size", size);
		return productDao.queryProductByReviewState(paraMap);
	}
	@Override
	public List<Product> queryProductByState(int reviewState,int page,int size){
		Map<String,Object> paraMap=new HashMap<String ,Object>();
		paraMap.put("reviewState",reviewState);
		paraMap.put("page",page);
		paraMap.put("size",size);
		return productDao.queryProductByReviewState(paraMap);
	}
	@Override
	public List<Product> queryProductByReviewStatenotpass(int page, int size)
	{
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("page", page);
		paraMap.put("size", size);
		return productDao.queryProductByReviewStatenotpass(paraMap);
	}

	@Override
	public void updateProductReviewState(int productId, int productState, int reviewState)
	{
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("productId", productId);
		paraMap.put("productState", productState);
		paraMap.put("reviewState", reviewState);
		productDao.updateProductReviewState(paraMap);
	}

	@Override
	public void updateProductRecordID(String recordId, int productId)
	{
		productDao.updateProductRecordID(recordId, productId);

	}


	@Override
	public List<News> queryNewsByReviewState(int page, int size)
	{
		return newsDao.queryNewsByReviewState(page, size);
	}
	@Override
	public List<News> queryNewsByReviewStatenotpass(int page, int size)
	{
		return newsDao.queryNewsByReviewStatenotpass(page, size);
	}

	@Override
	public List<News> queryNewsByState(int reviewState, int page, int size) {
		return newsDao.queryNewsByState(reviewState,page,size);
	}

	@Override
	public void updateNewsReviewState(int newsId, int curStats)
	{
		newsDao.updateNewsReviewState(newsId, curStats);
	}

	@Override
	public void updateNewsRecordID(int newsId, String recordID) { newsDao.updateNewsRecordID(newsId, recordID); }

	@Override
	public Company queryCompanyByCompanyID(String CompanyId)
	{
		return companyDao.queryCompanyByCompanyID(CompanyId);
	}

	@Override
	public User queryUserByCompanyId(String companyId)
	{
		return iUserDao.queryUserByCompanyId(companyId);
	}

	@Override
	public List<Advertisement> queryAdvertisementByState(int reviewState, int page, int size) {
		return advertisementDao.queryAdvertisementByState(reviewState,page,size);
	}

	@Override
	public List<News> getAllNewsInfo() {
		return newsDao.getAllNewsInfo();
	}

	@Override
	public List<Company> getAllCompany() {
		return companyDao.getAllCompanyInfo();
	}

	@Override
	public List<Product> getAllProductInfo() {
		return productDao.getAllProductInfo();
	}

	@Override
	public List<Advertisement> getAllAdsInfo() {
		return advertisementDao.getAllAdsInfo();
	}

	@Override
	public List<Advertisement> getAdsInfoList(int reviewState, int offset, int limit, String sort, String order) {
		return advertisementDao.getAdsInfoList(reviewState, offset, limit, sort, order);
	}

	@Override
	public int getAdsInfoListTotal(int reviewState, String sort, String order) {
		return advertisementDao.getAdsInfoListTotal(reviewState, sort, order);
	}


	@Override
	public List<Product> getProductList(int reviewState,int offset, int limit, String sort, String order) {
		return productDao.getProductList(reviewState,offset,limit,sort,order);
	}

	@Override
	public List<News> getNewsList(int reviewState, int offset, int limit, String sort, String order) {
		return newsDao.getNewsList(reviewState, offset, limit, sort, order);
	}

	@Override
	public int getNewsListTotal(int reviewState, String sort, String order) {
		return newsDao.getNewsListTotal(reviewState,sort,order);
	}

	@Override
	public List<Company> getCompanyList(int reviewState, int offset, int limit, String sort, String order) {
		return companyDao.getCompanyList(reviewState, offset, limit, sort, order);
	}

	@Override
	public int getCompanyListTotal(int reviewState, String sort, String order) {
		return companyDao.getCompanyInfoListTotal(reviewState, sort, order);
	}

	@Override
	public List<OperateRecord> selectOperateRecordByRecordID(String rid) {
		return operateRecordDao.selectOperateRecordByRecordID(rid);
	}

	@Override
	public int getRecordInfoListTotal(String recordId, String sort, String order){
		return operateRecordDao.getRecordInfoListTotal(recordId,sort,order);
	}



	@Override
	public String getProductRecordIdByProductId(int productId) {
		return productDao.getProductRecordIdByProductId(productId);
	}

	@Override
	public String getCompanyRecordIdByCompanyId(String companyId) {
		return companyDao.getCompanyRecordIdByCompanyId(companyId);
	}

	@Override
	public int getProductInfoListTotal(int reviewState,String sort, String order) {
		return productDao.getProductInfoListTotal(reviewState,sort,order);
	}

	@Override
	public int addOperateRecord(OperateRecord vr){

		return operateRecordDao.addOperateRecord(vr);
	}


	@Override
	public News queryNewsByID(int Id)
	{
		return newsDao.queryNewsByID(Id);
	}
}
