package com.nm.test5.mapper;

import com.nm.test5.pojo.Users;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
    @Select("select * from user_info where user_name=#{user_name}")
    Users query4Login(Users user);


    List<Users> selAll(Users user);

    int insert(Users user);
    int update(Users user);
    Users selByUser_id(Integer id);
    void deletes(HashMap<String, Object> map);

    List<Users> selUserByDep_id(Integer dep_id);
}
