package com.learning.core.service.impl;

import com.learning.core.dao.UserMapper;
import com.learning.core.pojo.User;
import com.learning.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl  implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUser(String usercode, String password) {
        User user=this.userMapper.findUser(usercode,password);
        return user;
    }
}
