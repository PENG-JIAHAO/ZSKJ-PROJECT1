package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.Product;

public interface IProductModel
{
	int insertProduct(Product product);

	boolean updateProduct(Product product);

	Product getMaxProductId();

	List<Product> getAllProductInfo();

	List<Product> getIndexProductInfo();

	List<Product> getProductInfoByName(String username);

	List<Product> getPublishedProductInfo();

	List<Product> getAuditingProductInfo();

	List<Product> getUnderProductInfo();

	List<Product> getNotPassProductInfo();

List<Product> getProductInfoList(int offset, int limit, String sort, String order);

	int getProductListTotal(String sort, String order);

	String addInfo( int id,String OffProductInfo);
}