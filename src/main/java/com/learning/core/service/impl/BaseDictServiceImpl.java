package com.learning.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learning.core.dao.Base_DictMapper;
import com.learning.core.pojo.Base_Dict;
import com.learning.core.service.BaseDictService;

/**
 * 数据字典service接口实现类
 * @author lenovo
 *
 */
@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {

	@Autowired
	private Base_DictMapper baseDictDao;
	
	//根据类别代码查询数据字典
	@Override
	public List<Base_Dict> findBaseDictByTypeCode(String typecode) {
		// TODO Auto-generated method stub
		return baseDictDao.selectBaseDictByTypeCode(typecode);
	}

}
