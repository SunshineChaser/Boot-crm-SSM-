package com.learning.core.service;

import java.util.List;

import com.learning.core.pojo.Base_Dict;

/**
 * 数据字典Service接口
 */
public interface BaseDictService {

	//根据类别代码查询数据字典
	public List<Base_Dict> findBaseDictByTypeCode(String typecode);
}
