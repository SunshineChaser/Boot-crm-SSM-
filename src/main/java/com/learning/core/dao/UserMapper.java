package com.learning.core.dao;

import com.learning.core.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
     * 通过账号和密码查询用户
     * @param usercode
     * @param password
     * @return
     */
    public User findUser(@Param("usercode") String usercode, @Param("password") String password);
}