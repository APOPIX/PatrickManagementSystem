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
            modelAndView.addObject("role", staffList.get(0).getRole());
        } else {
            //登陆失败，向页面传递用户名"invalid"和角色 - 1
            modelAndView.addObject("staff_name", "invalid");
            modelAndView.addObject("role", -1);
        }
        modelAndView.setViewName("index.jsp");
//        System.out.println("密码");
//        System.out.println(staff_password);
//        System.out.println("密码");
        return modelAndView;
    }
    ///////////////////////////

    @RequestMapping(value = "staff_register.html")
    public ModelAndView staff_register(@Param(value = "role") int role) {//工作人员登录
        System.out.println("进入注册的controller");
        ModelAndView modelAndView = new ModelAndView();
        //向页面传递角色(int)
        System.out.println(role);
        modelAndView.addObject("role", role);
        //重定向到staff_register.html
        modelAndView.setViewName("/jsp/staff_register.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "register.action")
    //工作人员注册
    public ModelAndView staff_register(@Param(value = "staff_name_register") String staff_name_register, @Param(value = "staff_password_register") String staff_password_register, @Param(value = "role_register") int role_register) {
        System.out.println("进入注册的controller");
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(staff_name_register+role_register);
        webService.register(staff_name_register,staff_password_register,role_register);
        //向页面传递角色(int)
        //重定向到staff_register.html
        modelAndView.setViewName("/jsp/staff_register.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "staff_info_management.html")
    //成员信息管理
    public ModelAndView staff_info_management( @Param(value = "role_register") int role) {
        System.out.println("进入成员信息管理的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("staffList", webService.selectAllStaffOrderById());
        //重定向到staff_info_management.html
        modelAndView.setViewName("/jsp/staff_info_management.jsp");
        return modelAndView;
    }
    //////////////////////

}