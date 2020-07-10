package com.learning.core.service;

import com.learning.core.pojo.User;

public interface UserService {

    /**
     * 通过账号和密码查询用户
     * @param usercode
     * @param password
     * @return
     */
    public User findUser(String usercode, String password);
}
