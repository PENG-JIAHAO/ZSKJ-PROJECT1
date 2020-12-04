package com.isscollege.gdce.model.impl;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.model.IContractModel;
import com.isscollege.gdce.service.IContractService;

@Component
public class ContractModelImpl implements IContractModel
{

	private static final Logger LOGGER = Logger.getLogger(ContractModelImpl.class);
	@Autowired
	private IContractService contractService;

	public ContractModelImpl()
	{

	}

	public void setService(IContractService contractService)
	{
		this.contractService = contractService;
	}

	@Override
	public boolean addContract(Contract contract)
	{
		return contractService.addContract(contract);
	}

	@Override
	public int updateState(Contract constract, String ID)
	{
		return contractService.updateState(constract, ID);
	}

	@Override
	public List<Contract> querConstractById(String ID,Integer offset)
	{
		return contractService.querConstractById(ID,offset);
	}

	@Override
	public boolean updateProductStatezero(Product product)
	{
		return contractService.updateProductStatezero(product);
	}


	@Override
	public List<Contract>queryAppointedContract(Long contractId)
	{
		return contractService.queryAppointedContract(contractId);
	}
}
