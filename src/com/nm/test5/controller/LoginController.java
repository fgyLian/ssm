package com.nm.test5.controller;

import com.nm.test5.pojo.AJAXResult;
import com.nm.test5.pojo.Users;
import com.nm.test5.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Resource
    private UserService userService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:login";
    }


    @ResponseBody
    @RequestMapping("/doAJAXLogin")
    public Object doAJAXLogin(Users user, HttpSession session){
        AJAXResult result = new AJAXResult();
        Users u = userService.query4Login(user);

        if(u!=null){
            session.setAttribute("u",u);
            result.setSuccess(true);
        }else{
            result.setSuccess(false);
        }
        return result;
    }

    @RequestMapping("/main")
    public String main(){
        return "main";
    }

}
