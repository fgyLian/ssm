package com.nm.test5.controller;

import com.nm.test5.pojo.AJAXResult;
import com.nm.test5.pojo.Department;
import com.nm.test5.pojo.Users;
import com.nm.test5.service.DeptService;
import com.nm.test5.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private DeptService deptService;
    @RequestMapping("/index")

    public String index(Users user,Model model){
        List<Department> departments = deptService.selAll(null);
        model.addAttribute("dept",departments);

        List<Users> users = userService.selAll(user);
        model.addAttribute("users",users);


        return "user/index";
    }



    @RequestMapping("/selUserByDep_id")
    public String selUserByDep_id(Integer dep_id,Model model){
        List<Users> users = userService.selUserByDep_id(dep_id);
        model.addAttribute("users",users);
        return "user/index";
    }



    @RequestMapping("/add")
    public String add(Model model){
        List<Department> depts = deptService.selAll(null);
        model.addAttribute("depts",depts);
        return "user/add";
    }
    @ResponseBody
    @RequestMapping("/insert")
    public Object insert(Users user){
        AJAXResult result = new AJAXResult();
        try {
            userService.insert(user);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;

    }


    @RequestMapping("/update")
    public String update(Integer user_id,Model model){
        List<Department> departments = deptService.selAll(null);
        Users users = userService.selByUser_id(user_id);
        model.addAttribute("users",users);
        model.addAttribute("dept",departments);

        return "user/update";
    }




    @ResponseBody
    @RequestMapping("/doUpdate")
    public Object doUpdate(Users user){
        AJAXResult result = new AJAXResult();
        try {
            userService.update(user);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }


    @ResponseBody
    @RequestMapping("/deletes")
    public Object deletes(Integer[] user_id){
        AJAXResult result = new AJAXResult();
        try {
            HashMap<String, Object> map = new HashMap<>();
            map.put("ids",user_id);
            userService.deletes(map);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
        }

        return result;
    }
}
