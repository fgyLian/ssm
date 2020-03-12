package com.nm.test5.service.impl;

import com.nm.test5.mapper.UserMapper;
import com.nm.test5.pojo.Users;
import com.nm.test5.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public Users query4Login(Users user) {
        return userMapper.query4Login(user);
    }

    @Override
    public List<Users> selAll(Users user) {
        return userMapper.selAll(user);
    }

    @Override
    public int insert(Users user) {
        return userMapper.insert(user);
    }

    @Override
    public int update(Users user) {
        return userMapper.update(user);
    }

    @Override
    public Users selByUser_id(Integer id) {
        return userMapper.selByUser_id(id);
    }

    @Override
    public void deletes(HashMap<String, Object> map) {
        userMapper.deletes(map);
    }

    @Override
    public List<Users> selUserByDep_id(Integer dep_id) {
        return userMapper.selUserByDep_id(dep_id);
    }
}
