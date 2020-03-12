package com.nm.test5.controller;

import com.nm.test5.pojo.AJAXResult;
import com.nm.test5.pojo.Department;
import com.nm.test5.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DepartmentController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("/index")
    public String index(Department dept,Model model){
        List<Department> depts = deptService.selAll(dept);
        model.addAttribute("depts",depts);
        return "dept/index";
    }

    @RequestMapping("/add")
    public String add(){
        return "dept/add";
    }
    @ResponseBody
    @RequestMapping("/insert")
    public Object insert(Department dept){
        AJAXResult result = new AJAXResult();
        try {
            deptService.insert(dept);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }

    @RequestMapping("/update")
    public String update(Integer dep_id,Model model){
        Department dept=deptService.selByDep_id(dep_id);
        model.addAttribute("dept",dept);
        return "dept/update";
    }


    @ResponseBody
    @RequestMapping("/doUpdate")
    public Object doupdate(Department dept){
        AJAXResult result = new AJAXResult();
        try {
            deptService.update(dept);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public Object deletes(Integer[] dep_id){
        AJAXResult result = new AJAXResult();
        try {
            HashMap<String, Object> map = new HashMap<>();
            map.put("ids",dep_id);
            deptService.deletes(map);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


}
