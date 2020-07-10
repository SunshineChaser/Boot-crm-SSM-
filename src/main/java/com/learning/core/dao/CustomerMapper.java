package com.learning.core.dao;

import java.util.List;

import com.learning.core.pojo.Customer;

/**
 * Customer接口
 * @author lenovo
 *
 */
public interface CustomerMapper {
    int deleteByPrimaryKey(Integer custId);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer custId);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    //客户列表
    public List<Customer>selectCustomerList(Customer customer);
    
    //客户数
    public Integer selectCustomerListCount(Customer customer);

    //创建客户
	public int createCustomer(Customer customer);

	//通过id查询客户
	//public Customer getCustomerById(Integer id);

	//更新客户信息
	//public int updateCustomer(Customer customer);
    
}