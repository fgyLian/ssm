package com.nm.test5.service;

import com.nm.test5.pojo.Users;

import java.util.HashMap;
import java.util.List;

public interface UserService {
    Users query4Login(Users user);

    List<Users> selAll(Users user);

    int insert(Users user);
    int update(Users user);
    Users selByUser_id(Integer id);
    void deletes(HashMap<String, Object> map);

    List<Users> selUserByDep_id(Integer dep_id);
}
