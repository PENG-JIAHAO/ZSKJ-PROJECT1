package com.isscollege.gdce.service;

import java.util.List;

import com.isscollege.gdce.domain.Product;
import org.springframework.stereotype.Service;

public interface IProductService
{
	int insertProduct(Product product);

	boolean updateProduct(Product Product);

	Product getMaxProductId();

	List<Product> getAllProductInfo();

	List<Product> getIndexProductInfo();

	List<Product> getProductInfoByName(String username);

	List<Product> getPublishedProductInfo();

	List<Product> getAuditingProductInfo();

	List<Product> getUnderProductInfo();

	List<Product> getNotPassProductInfo();


	List<Product> queryProductByReviewState(int page, int size);



	List<Product> getProductInfoList(int offset, int limit, String sort, String order);

	int getProductListTotal(String sort, String order);


    String addInfo(int id, String offProductInfo);
}
