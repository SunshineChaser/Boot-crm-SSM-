package com.learning.core.dao;

import java.util.List;

import com.learning.core.pojo.Base_Dict;

/**
 * 数据字典
 * @author lenovo
 *
 */
public interface Base_DictMapper {
    int deleteByPrimaryKey(String dictId);

    int insert(Base_Dict record);

    int insertSelective(Base_Dict record);

    Base_Dict selectByPrimaryKey(String dictId);

    int updateByPrimaryKeySelective(Base_Dict record);

    int updateByPrimaryKey(Base_Dict record);
    
    //根据类别代码查询数据字典
    public List<Base_Dict> selectBaseDictByTypeCode(String typecode);
}