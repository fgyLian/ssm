package com.nm.test5.service.impl;

import com.nm.test5.mapper.DeptMapper;
import com.nm.test5.pojo.Department;
import com.nm.test5.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Override
    public List<Department> selAll(Department dept) {


        return deptMapper.selAll(dept);
    }

    @Override
    public int insert(Department dept) {
        return deptMapper.insert(dept);
    }

    @Override
    public int update(Department dept) {
        return deptMapper.update(dept);
    }

    @Override
    public Department selByDep_id(Integer id) {
        return deptMapper.selByDep_id(id);
    }

    @Override
    public void deletes(HashMap<String, Object> map) {
        deptMapper.deletes(map);
    }



}
