package com.isscollege.gdce.dao;

import java.util.List;
import java.util.Map;

import com.isscollege.gdce.domain.Product;
import org.apache.ibatis.annotations.Param;

public interface IProductDao {
	void insertProduct(Product product);

	void updateProduct(Product product);

	List<Product> getAllProductInfo();

	List<Product> getIndexProductInfo();

	List<Product> getProductInfoByName(String username);

	String getProductRecordIdByProductId(int productId);

	List<Product> getPublishedProductInfo();

	List<Product> getAuditingProductInfo();

	List<Product> getUnderProductInfo();

	List<Product> getNotPassProductInfo();

	List<Product> queryProductByReviewState(Map<String, Object> parMap);

	List<Product> queryProductByReviewStatenotpass(Map<String, Object> parMap);


	void updateProductReviewState(Map<String, Object> parMap);

	void updateProductRecordID(@Param("recordID") String recordID, @Param("productId") int productId);

	Product getMaxProductId();

	List<Product> getProductInfoList(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

	List<Product> getProductList(@Param("reviewState")int reviewState,@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);

	int getProductInfoListTotal(@Param("reviewState")int reviewState,@Param("sort") String sort, @Param("order") String order);

	int getProductListTotal(@Param("sort") String sort, @Param("order") String order);

	String addInfo(int id, String offProductInfo);
}