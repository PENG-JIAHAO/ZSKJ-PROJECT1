package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.*;

public interface IReviewModel
{
	List<Product> queryProductByReviewState(int page, int size);
	List<Product> queryProductByReviewStatenotpass(int page, int size);
	List<Product> queryProductByState(int reviewState,int page,int size);
	void updateProductReviewState(int productId, int proStats, int curStats);
	/*�Ķ�*/void updateProductRecordID(String recordId, int productId);

	List<Company> queryCompanyByReviewState(int page, int size);
	List<Company> queryCompanyByReviewStatenotpass(int page, int size);
	List<Company> queryCompanyByState(int reviewState,int page,int size);
	void updateCompanyReviewState(int curStats, String companyId);
	void updateCompanyRecordID(String recordId, String companyId);

	List<News> queryNewsByReviewState(int page, int size);
	List<News> queryNewsByReviewStatenotpass(int page, int size);
	List<News> queryNewsByState(int reviewState,int page,int size);
	void updateNewsReviewState(int newsId, int curStats);
	void updateNewsRecordID(int newsId, String recordID);

	Company queryCompanyByCompanyID(String CompanyId);


	User queryUserByCompanyId(String companyId);

	List<News> getAllNewsInfo();

	List<Company> getAllCompany();

	List<Product> getAllProductInfo();

	int getAdsInfoListTotal(int reviewState,String sort,String order);

	List<Product> getProductList(int reviewState,int offset, int limit, String sort,  String order);

	int getProductInfoListTotal(int reviewState,String sort,String order);

	//��ȡrecordid
	String getProductRecordIdByProductId(int productId);

	String getCompanyRecordIdByCompanyId(String companyId);
	//��ȡ��¼��Ϣ
	List<OperateRecord> selectOperateRecordByRecordID(String rid);
	//��ȡ��¼����
	int getRecordInfoListTotal(String recordId, String sort, String order);

	List<News> getNewsList(int reviewState,int offset, int limit, String sort, String order);

	int getNewsListTotal(int reviewState,String sort,String order);

	//��������̱�
	List<Company> getCompanyInfo(int groupNum,int offset, int limit, String sort, String order);
	//����������豸��
	List<equipment> getCompanyEquipment(String company_Id, int offset, int limit, String sort, String order);
	//������Ծ����̱�
	List<Company> getAllCompanyInfo(int offset, int limit, String sort, String order);
	//�������������
	int getCompanyListTotal(int groupNum,String sort,String order);
	//�������������
	int getCompanyEquipmentTotal(String company_Id,String sort,String order);
	//������о���������
	int getAllCompanyListTotal(String sort,String order);
	//ɾ��������
	boolean deleteCompany(String company_Id);
	//����������
	boolean addNewCompany(Company newcompany);

	int addOperateRecord(OperateRecord vr);
	News queryNewsByID(int Id);

	//����豸ʹ���̱�
	List<Shop> getShopInfo(int groupNum,int offset, int limit, String sort, String order);
	//����豸ʹ���̱�
	List<equipment> getShopEquipment(String shop_id, int offset, int limit, String sort, String order);
	//��������豸ʹ���̱�
	List<Shop> getAllShopInfo(int offset, int limit, String sort, String order);
	//����豸ʹ��������
	int getShopListTotal(int groupNum,String sort,String order);
	//����豸ʹ��������
	int getShopEquipmentTotal(String shop_id,String sort,String order);
	//��������豸ʹ��������
	int getAllShopListTotal(String sort,String order);
	//ɾ���豸ʹ����
	boolean deleteShop(String shop_id);
	//�����豸ʹ����
	boolean addNewShop(Shop newshop);



}
