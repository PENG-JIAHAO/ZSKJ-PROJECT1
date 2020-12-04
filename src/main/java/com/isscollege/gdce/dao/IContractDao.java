package com.isscollege.gdce.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import org.apache.ibatis.session.RowBounds;

public interface IContractDao
{
	boolean addContract(Contract contract);

	int updateState(@Param("constract") Contract constract, @Param("ID") String ID);

	List<Contract> querConstractById(String ID, RowBounds rowBounds);

	boolean updateProductStatezero(Product product);


	//查询指定编号合同
	List<Contract> queryAppointedContract(@Param("contractId") Long contractId);
}
