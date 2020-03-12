package com.nm.test5.service;

import com.nm.test5.pojo.Department;

import java.util.HashMap;
import java.util.List;

public interface DeptService {

  
   List<Department> selAll(Department dept);
    int insert(Department dept);
    int update(Department dept);
    Department selByDep_id(Integer id);

    void deletes(HashMap<String, Object> map);

}
