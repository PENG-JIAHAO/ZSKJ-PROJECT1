package com.isscollege.gdce.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.IProductDao;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.service.IProductService;

@Service("productService")
public class ProductServiceImpl implements IProductService
{
	private static final Logger LOGGER = Logger.getLogger(ProductServiceImpl.class);
	@Autowired
	private IProductDao iProductDao;

	@Override
	public int insertProduct(Product product)
	{
		iProductDao.insertProduct(product);
		int result = 1;
		return result;
	}

	@Override
	public boolean updateProduct(Product product)
	{
		iProductDao.updateProduct(product);
		boolean result = true;
		return result;
	}

	@Override
	public Product getMaxProductId()
	{
		Product product = null;
		product = iProductDao.getMaxProductId();
		return product;
	}

	public List<Product> getIndexProductInfo()
	{
		return iProductDao.getIndexProductInfo();
	}

	@Override
	public List<Product> getProductInfoByName(String username) {
		return iProductDao.getProductInfoByName(username);
	}


	public List<Product> getAllProductInfo()
	{
		return iProductDao.getAllProductInfo();
	}

	public List<Product> getPublishedProductInfo()
	{
		return iProductDao.getPublishedProductInfo();
	}

	public List<Product> getAuditingProductInfo()
	{
		return iProductDao.getAuditingProductInfo();
	}

	public List<Product> getUnderProductInfo()
	{
		return iProductDao.getUnderProductInfo();
	}


	public List<Product> getNotPassProductInfo()
	{
		return iProductDao.getNotPassProductInfo();
	}

	@Override
	public List<Product> getProductInfoList(int offset, int limit, String sort, String order) {
		return iProductDao.getProductInfoList(offset,limit,sort,order);
	}

	@Override
	public int getProductListTotal(String sort, String order) {
		return iProductDao.getProductListTotal(sort,order);
	}

	@Override
	public List<Product> queryProductByReviewState(int page, int size) {
		return null;
	}

	@Override
	public String addInfo(int id, String OffProductInfo) {
		return iProductDao.addInfo(id, OffProductInfo);
	}


}