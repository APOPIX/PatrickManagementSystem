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
            //登陆成功，向页面传递用户名(String)，角色(int)，ID(int)
            modelAndView.addObject("staff_name", staff_name);
            modelAndView.addObject("role", staffList.get(0).getRole());
            modelAndView.addObject("current_login_staff_id", staffList.get(0).getStaff_id());
        } else {
            //登陆失败，向页面传递用户名"invalid"和角色 - 1，ID(int)
            modelAndView.addObject("staff_name", "invalid");
            modelAndView.addObject("role", -1);
            modelAndView.addObject("current_login_staff_id", -1);

        }
        modelAndView.setViewName("index.jsp");
//        System.out.println("密码");
//        System.out.println(staff_password);
//        System.out.println("密码");
        return modelAndView;
    }
    ///////////////////////////

    @RequestMapping(value = "staff_register.html")
    public ModelAndView staff_register(@Param(value = "role") int role,
                                       @Param(value = "current_login_staff_id") int current_login_staff_id) {//工作人员登录
        System.out.println("进入注册的controller");
        ModelAndView modelAndView = new ModelAndView();
        //向页面传递角色(int)
        System.out.println(role);
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        //重定向到staff_register.html
        modelAndView.setViewName("/jsp/staff_register.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "register.action")
    //工作人员注册
    public ModelAndView staff_register(@Param(value = "staff_name_register") String staff_name_register,
                                       @Param(value = "staff_password_register") String staff_password_register,
                                       @Param(value = "role_register") int role_register) {
        System.out.println("进入注册的controller");
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(staff_name_register + role_register);
        webService.register(staff_name_register, staff_password_register, role_register);
        //重定向到staff_register.html
        modelAndView.setViewName("/jsp/staff_register.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_list.html")
    //成员信息管理
    public ModelAndView staff_list(@Param(value = "role") int role,
                                   @Param(value = "current_login_staff_id") int current_login_staff_id) {
        System.out.println("进入成员信息管理的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("staffList", webService.selectAllStaffOrderById());
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        //重定向到staff_list.html
        modelAndView.setViewName("jsp/staff_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_details.html")
    //成员详细信息管理
    public ModelAndView staff_details(@Param(value = "role") int role,
                                      @Param(value = "staff_id") int staff_id,
                                      @Param(value = "current_login_staff_id") int current_login_staff_id) {
        System.out.println("进入成员详细信息管理的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("staffInfo", webService.selectStaffById(staff_id));
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        //重定向到staff_details.html
        modelAndView.setViewName("/jsp/staff_details.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_update.action")
    //成员详细信息更新
    public ModelAndView staff_update(@Param(value = "role") int role,
                                     @Param(value = "role_update") int role_update,/*将被更改的权限级别*/
                                     @Param(value = "staff_id_update") int staff_id_update,/*将被更改的账户的账户id*/
                                     @Param(value = "staff_name_update") String staff_name_update,
                                     @Param(value = "staff_password_update") String staff_password_update,
                                     @Param(value = "current_login_staff_id") int current_login_staff_id
    ) {
        System.out.println("进入成员详细信息更新的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        //做数据库更新操作
        webService.updateStaffInfo(staff_id_update, staff_name_update, staff_password_update, role_update);
        //从数据库查询更新后的信息
        modelAndView.addObject("staffInfo", webService.selectStaffById(staff_id_update));
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        System.out.println(webService.selectStaffById(staff_id_update).toString());
        //重定向到staff_details.html
        modelAndView.setViewName("/jsp/staff_details.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "user_list.html")
    //用户列表
    public ModelAndView user_list(@Param(value = "role") int role,
                                  @Param(value = "current_login_staff_id") int current_login_staff_id) {
        System.out.println("进入用户信息列表的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("userList", webService.selectAllUserOrderById());
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        //重定向到user_list.html
        modelAndView.setViewName("jsp/user_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "unban_user.action")
    //解封用户
    public ModelAndView unban_user(@Param(value = "role") int role,
                                   @Param(value = "current_login_staff_id") int current_login_staff_id,
                                   @Param(value = "user_id") int user_id) {
        System.out.println("进入解封的controller");
        webService.unbanUser(user_id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        modelAndView.addObject("userList", webService.selectAllUserOrderById());
        //重定向到user_list.html
        modelAndView.setViewName("jsp/user_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "ban_user.action")
    // 封禁用户
    public ModelAndView ban_user(@Param(value = "role") int role,
                                 @Param(value = "current_login_staff_id") int current_login_staff_id,
                                 @Param(value = "user_id") int user_id) {
        System.out.println("进入封禁的controller");
        webService.banUser(user_id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        modelAndView.addObject("userList", webService.selectAllUserOrderById());
        //重定向到user_list.html
        modelAndView.setViewName("jsp/user_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "sales_statistics_full.html")
    //全时间销量统计
    public ModelAndView sales_statistics_full(@Param(value = "role") int role,
                                              @Param(value = "current_login_staff_id") int current_login_staff_id
            /*@Param(value = "date_range") String[] date_range*/
    ) {
        System.out.println("进入销量统计的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        modelAndView.addObject("SalesStatisticsList", webService.salesStatisticsFull());
        //重定向到sales_statistics_full.html
        modelAndView.setViewName("jsp/sales_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "sales_statistics_range.html")
    //时间段销量统计
    public ModelAndView sales_statistics_range(@Param(value = "role") int role,
                                               @Param(value = "current_login_staff_id") int current_login_staff_id,
                                               @Param(value = "begin_date") String begin_date,
                                               @Param(value = "end_date") String end_date
    ) {
        System.out.println("进入销量统计的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        modelAndView.addObject("SalesStatisticsList", webService.salesStatisticsByDateRange(begin_date, end_date));
        //重定向到sales_statistics_full.html
        modelAndView.setViewName("jsp/sales_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "browse_statistics_full.html")
    //全时间浏览量统计
    public ModelAndView browse_statistics_full(@Param(value = "role") int role,
                                               @Param(value = "current_login_staff_id") int current_login_staff_id
            /*@Param(value = "date_range") String[] date_range*/
    ) {
        System.out.println("进入浏览量统计的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        modelAndView.addObject("BrowseStatisticsList", webService.browseStatisticsFull());
        //重定向到browse_statistics.html
        modelAndView.setViewName("jsp/browse_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "browse_statistics_range.html")
    //时间段浏览量统计
    public ModelAndView browse_statistics_range(@Param(value = "role") int role,
                                                @Param(value = "current_login_staff_id") int current_login_staff_id,
                                                @Param(value = "begin_date") String begin_date,
                                                @Param(value = "end_date") String end_date
    ) {
        System.out.println("进入时间段浏览量统计的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        modelAndView.addObject("BrowseStatisticsList", webService.browseStatisticsByDateRange(begin_date, end_date));
        //重定向到browse_statistics.html
        modelAndView.setViewName("jsp/browse_statistics.jsp");
        return modelAndView;
    }


    @RequestMapping(value = "order_list.html")
    //订单列表
    public ModelAndView browse_statistics_range(@Param(value = "role") int role,
                                                @Param(value = "current_login_staff_id") int current_login_staff_id,
                                                @Param(value = "key") String key
    ) {
        System.out.println("进入订单列表的controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("role", role);
        modelAndView.addObject("current_login_staff_id", current_login_staff_id);
        if (key.length() == 0) {//搜索关键词为空，显示全部订单
            modelAndView.addObject("OrderList", webService.selectAllOrdersOrderById());
        } else {
            modelAndView.addObject("OrderList", webService.searchAllOrdersByKey(key));
        }
        //重定向到order_list.html
        modelAndView.setViewName("jsp/order_list.jsp");
        return modelAndView;
    }
    //////////////////////

}