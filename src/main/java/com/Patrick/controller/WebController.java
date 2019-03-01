package com.Patrick.controller;


import com.Patrick.service.WebService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class WebController {
    @Autowired//此注解使得接口"WebService"得以实例化
            WebService webService;

    @RequestMapping(value = "login.action")
    public ModelAndView staff_login(@Param(value = "staff_name") String staff_name, @Param(value = "staff_password_md5") String staff_password_md5) {//工作人员登录
        ModelAndView modelAndView = new ModelAndView();
        if (!webService.login(staff_name, staff_password_md5).isEmpty()) {
//            登陆成功
            modelAndView.addObject("staff_name", staff_name);
        }
        modelAndView.setViewName("/jsp/index.jsp");
        System.out.println(staff_password_md5);
        return modelAndView;
    }
    ///////////////////////////





    //////////////////////

}