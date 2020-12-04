package com.isscollege.gdce.model;

import java.util.List;

import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;


public interface IContractModel
{
	boolean addContract(Contract contract);

	int updateState(Contract constract, String ID);

	List<Contract> querConstractById(String ID,Integer offset);

	boolean updateProductStatezero(Product product);




	// 查询得到指定合同编号的合同
	List<Contract> queryAppointedContract(Long contractId);
}
