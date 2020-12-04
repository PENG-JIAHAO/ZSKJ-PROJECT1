package com.isscollege.gdce.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isscollege.gdce.dao.IContractDao;
import com.isscollege.gdce.domain.Contract;
import com.isscollege.gdce.domain.Product;
import com.isscollege.gdce.service.IContractService;

@Service
public class ContractServiceImpl implements IContractService
{
	private static final Logger LOGGER = Logger.getLogger(ContractServiceImpl.class);
	@Autowired
	private IContractDao iContractDao;

	public ContractServiceImpl()
	{
	}

	public void setDao(IContractDao dao)
	{
		this.iContractDao = dao;
	}

	@Override
	public boolean addContract(Contract contract)
	{
		return iContractDao.addContract(contract);
	}

	@Override
	public int updateState(Contract constract, String ID)
	{
		return iContractDao.updateState(constract, ID);
	}

	@Override
	public List<Contract> querConstractById(String ID,Integer offset)
	{
		RowBounds rowBounds=new RowBounds(offset,5);
		return iContractDao.querConstractById(ID,rowBounds);

	}

	@Override
	public boolean updateProductStatezero(Product product)
	{
		return iContractDao.updateProductStatezero(product);
	}


	//查询合同,得到指定的合同订单
	@Override
	public List<Contract> queryAppointedContract(Long contractId)
	{
		return iContractDao.queryAppointedContract(contractId);
	}
}
