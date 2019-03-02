package com.Patrick.controller;


import com.Patrick.dao.Staff;
import com.Patrick.service.WebService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class WebController {
    @Autowired//此注解使得接口"WebService"得以实例化
            WebService webService;

    @RequestMapping(value = "/login.action")
    public ModelAndView staff_login(@Param(value = "staff_name") String staff_name, @Param(value = "staff_password") String staff_password) {//工作人员登录
        ModelAndView modelAndView = new ModelAndView();
        List<Staff> staffList = webService.login(staff_name, staff_password);
        if (!staffList.isEmpty()) {
            //登陆成功，向页面传递用户名(String)和角色(int)
            modelAndView.addObject("staff_name", staff_name);
            modelAndView.addObject("role",staffList.get(0).getRole());
        }
        else{
            //登陆失败，向页面传递用户名"invalid"和角色 - 1
            modelAndView.addObject("staff_name", "invalid");
            modelAndView.addObject("role",-1);
        }
        modelAndView.setViewName("index.jsp");
//        System.out.println("密码");
//        System.out.println(staff_password);
//        System.out.println("密码");
        return modelAndView;
    }
    ///////////////////////////



    //////////////////////

}