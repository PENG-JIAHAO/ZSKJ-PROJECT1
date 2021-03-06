package com.isscollege.gdce.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.isscollege.gdce.dao.*;
import com.isscollege.gdce.domain.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	private INewsDao newsDao;
	@Autowired
	private IUserDao iUserDao;
	@Autowired
	private IEquipmentDao equipmentDao;
	@Autowired
	private IOperateRecordDao operateRecordDao;

	public ReviewServiceImpl()
	{
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
	public int getAdsInfoListTotal(int reviewState, String sort, String order) {
		return 0;
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

	//浏览经销商表
	@Override
	public List<Company> getCompanyInfo(int groupNum, int offset, int limit, String sort, String order) {
		return companyDao.getCompanyInfo(groupNum, offset, limit, sort, order);
	}
	//浏览经销商设备表
	@Override
	public List<equipment> getCompanyEquipment(String company_Id, int offset, int limit, String sort, String order) {
		return equipmentDao.getCompanyEquipment(company_Id, offset, limit, sort, order);
	}
	//浏览所有设备表
	@Override
	public List<equipment> getAllEquipment(int offset, int limit, String sort, String order) {
		return equipmentDao.getAllEquipment(offset, limit, sort, order);
	}
	//浏览所有经销商表
	@Override
	public List<Company> getAllCompanyInfo(int offset, int limit, String sort, String order) {
		return companyDao.getAllCompanyInfo(offset, limit, sort, order);
	}
	//浏览经销商数量
	@Override
	public int getCompanyListTotal(int groupNum, String sort, String order) {
		return companyDao.getCompanyInfoListTotal(groupNum, sort, order);
	}
	//浏览经销商设备数量
	@Override
	public int getCompanyEquipmentListTotal(String company_Id,String sort,String order){
		return equipmentDao.getCompanyEquipmentListTotal(company_Id,sort,order);
	}
	//浏览所有设备数量
	@Override
	public int getAllEquipmentListTotal(String sort,String order){
		return equipmentDao.getAllEquipmentListTotal(sort,order);
	}
	//浏览所有经销商数量
	@Override
	public int getAllCompanyListTotal(String sort, String order) {
		return companyDao.getAllCompanyInfoListTotal(sort, order);
	}
	//删除经销商
	@Override
	public boolean deleteCompany(String company_Id)
	{
		boolean result = false;
		result = (companyDao.deleteCompany(company_Id) != 0);
		return result;
	}
	//新增经销商
	@Override
	public boolean addNewCompany(Company newcompany)
	{
		boolean result = false;
		result = (companyDao.addNewCompany(newcompany) != 0);
		return result;
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

	//浏览设备使用商表
	@Override
	public List<Shop> getShopInfo(int groupNum, int offset, int limit, String sort, String order) {
		return companyDao.getShopInfo(groupNum, offset, limit, sort, order);
	}
	//浏览设备使用商设备表
	@Override
	public List<equipment> getShopEquipment(String groupNum, int offset, int limit, String sort, String order) {
		return equipmentDao.getShopEquipment(groupNum, offset, limit, sort, order);
	}
	//浏览所有设备使用商表
	@Override
	public List<Shop> getAllShopInfo(int offset, int limit, String sort, String order) {
		return companyDao.getAllShopInfo(offset, limit, sort, order);
	}
	//浏览设备使用商数量
	@Override
	public int getShopListTotal(int groupNum, String sort, String order) {
		return companyDao.getShopInfoListTotal(groupNum, sort, order);
	}
	//浏览设备使用商设备数量
	@Override
	public int getShopEquipmentListTotal(String shop_id,String sort,String order){
		return equipmentDao.getShopEquipmentListTotal(shop_id,sort,order);
	}
	//浏览所有设备使用商数量
	@Override
	public int getAllShopListTotal(String sort, String order) {
		return companyDao.getAllShopInfoListTotal(sort, order);
	}
	//删除设备使用商
	@Override
	public boolean deleteShop(String shop_id)
	{
		boolean result = false;
		result = (companyDao.deleteShop(shop_id) != 0);
		return result;
	}
	//新增经销商
	@Override
	public boolean addNewShop(Shop newshop)
	{
		boolean result = false;
		result = (companyDao.addNewShop(newshop) != 0);
		return result;
	}




}
