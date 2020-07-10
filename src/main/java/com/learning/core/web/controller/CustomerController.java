package com.learning.core.web.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.learning.common.utils.Page;
import com.learning.core.pojo.Base_Dict;
import com.learning.core.pojo.Customer;
import com.learning.core.pojo.User;
import com.learning.core.service.BaseDictService;
import com.learning.core.service.CustomerService;

/**
 * 客户管理控制器类
 * @author lenovo
 *
 */
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private BaseDictService baseDictService;
	
	//客户来源
	@Value("${customer.from.type}")
	private String FROM_TYPE;
	
	//客户所属行业
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;
	
	//客户级别
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;
	
	/**
	 * 客户列表
	 */
	@RequestMapping(value = "/customer/list.action")
	public String list(@RequestParam(defaultValue = "1")Integer page,
			@RequestParam(defaultValue = "10")Integer rows,String custName,String custSource,
			String custIndustry,String custLevel,Model model) {
		
		//条件查询所有客户
		Page<Customer>customers=customerService.findCustomerList(page, rows, custName, custSource, custIndustry, custLevel);
		//客户来源
		List<Base_Dict>fromType=baseDictService.findBaseDictByTypeCode(FROM_TYPE);
		//客户所属行业
		List<Base_Dict>industryType=baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
		//客户级别
		List<Base_Dict>levelType=baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);
		//添加参数
		model.addAttribute("page", customers);
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
		
		return "customer";
		
	}
	
	/**
	 * 创建客户
	 */
	@RequestMapping("/customer/create.action")
	@ResponseBody
	public String customerCreate(Customer customer,HttpSession session) {
		//获取session中的当前客户信息
		User user=(User) session.getAttribute("USER_SESSION");
		//将当前用户ID存储在	客户对象中
		customer.setCustCreateId(user.getUserId());
		//创建date对象
		Date date=new Date();
		// 得到一个 Timestamp 格式的时间，存入 mysql 中的时间格式 "yyyy/MM/dd HH:mm:ss"
		Timestamp timestamp=new Timestamp(date.getTime());
		customer.setCustCreatetime(timestamp);
		System.out.println(customer.toString());
		//执行service层中的创建方法，返回的是受影响的行数
		int rows=customerService.createCustomer(customer);
		if(rows>0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
	
	/**
	 * 通过id获取客户信息
	 */
	@RequestMapping("/customer/getCustomerById.action")
	@ResponseBody
	public Customer getCustomerById(Integer id) {
		Customer customer=customerService.getCustomerById(id);
		return customer;
	}
	
	/**
	 * 更新客户
	 */
	@RequestMapping("/customer/update.action")
	@ResponseBody
	public String customerUpdate(Customer customer) {
		int rows=customerService.updateCustomer(customer);
		if(rows>0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
	
	/**
	 * 删除客户
	 */
	@RequestMapping("/customer/delete.action")
	@ResponseBody
	public String customerDelete(Integer id) {
		int rows=customerService.deleteCustomer(id);
		if(rows>0) {
			return "OK";
		}else {
			return "FALL";
		}
	}
	
}
