package com.isscollege.gdce.model.impl;

import java.sql.*;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.model.IProductModel;
import com.isscollege.gdce.service.IProductService;

@Component("productModel")
public class ProductModelImpl implements IProductModel
{
    private static final Logger LOGGER = Logger.getLogger(ProductModelImpl.class);
    @Autowired
    private IProductService service;
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
@Autowired
private  IProductModel productModel;
    public void closeAll()
    {
        try
        {
            if (rs != null)
            {
                rs.close();
            }
            if (stmt != null)
            {
                stmt.close();
            }
            if (conn != null && !conn.isClosed())
            {
                conn.close();
            }
        } catch (SQLException ex)
        {
            LOGGER.error("", ex);
        }
    }

    @Override
    public int insertProduct(Product product)
    {
        return service.insertProduct(product);
    }

    @Override
    public boolean updateProduct(Product product)
    {
        return service.updateProduct(product);
    }

    @Override
    public List<Product> getAllProductInfo()
    {
        return service.getAllProductInfo();
    }

    public Product getMaxProductId()
    {
        return service.getMaxProductId();
    }

    @Override
    public List<Product> getIndexProductInfo()
    {
        return service.getIndexProductInfo();
    }

    @Override
    public List<Product> getProductInfoByName(String username) {
        return service.getProductInfoByName(username);
    }

    @Override
    public List<Product> getPublishedProductInfo()
    {
        return service.getPublishedProductInfo();
    }

    @Override
    public List<Product> getAuditingProductInfo()
    {
        return service.getAuditingProductInfo();
    }

    @Override
    public List<Product> getUnderProductInfo()
    {
        return service.getUnderProductInfo();
    }

    @Override
    public List<Product> getNotPassProductInfo()
    {
        return service.getNotPassProductInfo();
    }

    @Override
    public List<Product> getProductInfoList(int offset, int limit, String sort, String order) {
        return service.getProductInfoList(offset,limit,sort,order);
    }
    @Override
    public int getProductListTotal(String sort, String order) {
        return service.getProductListTotal(sort,order);
    }

    @Override
    public String addInfo(int id, String OffProductInfo) {
        return service.addInfo(id,OffProductInfo);
    }

}
