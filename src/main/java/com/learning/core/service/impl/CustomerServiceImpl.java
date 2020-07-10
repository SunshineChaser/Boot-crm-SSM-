package com.learning.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.learning.common.utils.Page;
import com.learning.core.dao.CustomerMapper;
import com.learning.core.pojo.Customer;
import com.learning.core.service.CustomerService;

/**
 * 客户管理
 * @author lenovo
 *
 */
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerDao;
	
	//客户列表
	@Override
	public Page<Customer> findCustomerList(Integer page, Integer rows, String custName, String custSource,
			String custIndustry, String custLevel) {
		//创建客户对象
		Customer customer=new Customer();
		//判断客户名称
		if(StringUtils.isNoneBlank(custName)) {
			customer.setCustname(custName);
		}
		//判断客户信息来源
		if(StringUtils.isNoneBlank(custSource)) {
			customer.setCustSource(custSource);
		}
		//判断客户所属行业
		if(StringUtils.isNoneBlank(custIndustry)) {
			customer.setCustIndustry(custIndustry);
		}
		//判断客户级别
		if(StringUtils.isNoneBlank(custLevel)) {
			customer.setCustLevel(custLevel);
		}
		//当前页
		customer.setStart((page-1)*rows);
		//每页数
		customer.setRows(rows);
		
		//System.out.println(customer.toString());
		
		//查询客户列表
		List<Customer>customers=customerDao.selectCustomerList(customer);
		//查询客户列表总记录数
		Integer count=customerDao.selectCustomerListCount(customer);
		//创建page返回对象
		Page<Customer>result=new Page<Customer>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		
		return result;
	}

	/**
	 * 创建客户
	 */
	@Override
	public int createCustomer(Customer customer) {
		return customerDao.createCustomer(customer);
	}

	/**
	 * 通过id查询客户
	 */
	@Override
	public Customer getCustomerById(Integer id) {
		Customer customer=customerDao.selectByPrimaryKey(id);
		return customer;
	}

	/**
	 * 更新客户
	 */
	@Override
	public int updateCustomer(Customer customer) {
		return customerDao.updateByPrimaryKeySelective(customer);
	}

	@Override
	public int deleteCustomer(Integer id) {
		return customerDao.deleteByPrimaryKey(id);
	}

}
