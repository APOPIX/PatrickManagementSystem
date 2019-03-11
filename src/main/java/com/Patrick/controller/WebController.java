package com.Patrick.controller;


import com.Patrick.dao.*;
import com.Patrick.service.WebService;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


@Controller
public class WebController {
    @Autowired//此注解使得接口"WebService"得以实例化
            WebService webService;

    @RequestMapping(value = "/login.action")
    public ModelAndView staff_login(HttpServletRequest request, @Param(value = "staff_name") String staff_name, @Param(value = "staff_password") String staff_password) {//工作人员登录
        ModelAndView modelAndView = new ModelAndView();
        List<Staff> staffList = webService.login(staff_name, staff_password);
        if (!staffList.isEmpty()) {
            //登陆成功，向页面传递用户名(String)，角色(int)，ID(int)
            //插入操作记录
            String log = "登陆成功";
            webService.managementLog(staffList.get(0).getStaff_id(), log);
            String begin_date = new Timestamp(new Date().getTime() - (1000 * 60 * 60 * 8 + (long) 1000 * 86400 * 30)).toString();
            String end_date = new Timestamp(new Date().getTime() - 1000 * 60 * 60 * 8).toString();
            modelAndView.addObject("staff_name", staff_name);
            modelAndView.addObject("role", staffList.get(0).getRole());
            modelAndView.addObject("current_login_staff_id", staffList.get(0).getStaff_id());
            modelAndView.addObject("rankingList", webService.selectTopTenSalesRanking(begin_date, end_date));
            request.getSession().setAttribute("staff_name", staff_name);
            request.getSession().setAttribute("role", staffList.get(0).getRole());
            request.getSession().setAttribute("current_login_staff_id", staffList.get(0).getStaff_id());
            modelAndView.setViewName("jsp/index.jsp");
        } else {
            //登陆失败，向页面传递用户名"invalid"和角色 - 1，ID(int)
            modelAndView.addObject("staff_name", "invalid");
            modelAndView.addObject("role", -1);
            modelAndView.addObject("current_login_staff_id", -1);
            request.getSession().setAttribute("staff_name", "invalid");
            request.getSession().setAttribute("role", -1);
            request.getSession().setAttribute("current_login_staff_id", -1);
            modelAndView.setViewName("login.jsp");
        }
//        System.out.println("密码");
//        System.out.println(staff_password);
//        System.out.println("密码");
        return modelAndView;
    }
    ///////////////////////////

    @RequestMapping(value = "staff_register.html")
    public ModelAndView staff_register(HttpServletRequest request) {//工作人员注册
        System.out.println(request.getSession().getAttribute("staff_name"));
        System.out.println("进入注册的controller");
        ModelAndView modelAndView = new ModelAndView();
        //插入操作记录
        String log = "进入注册页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到staff_register.html
        modelAndView.setViewName("/jsp/staff_register.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "register.action")
    //工作人员注册
    public ModelAndView staff_register(
            @Param(value = "staff_name_register") String staff_name_register,
            @Param(value = "staff_password_register") String staff_password_register,
            @Param(value = "role_register") int role_register,
            HttpServletRequest request
    ) {
        System.out.println("进入注册的controller");
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(staff_name_register + role_register);
        webService.register(staff_name_register, staff_password_register, role_register);
        //插入操作记录
        String log = "以权限级别" + role_register + "注册用户名为" + staff_name_register + "的管理人员";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到staff_register.html
        modelAndView.setViewName("/jsp/staff_register.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_list.html")
    //成员信息管理
    public ModelAndView staff_list(
            HttpServletRequest request,
            @Param(value = "key") int key) {
        System.out.println("进入成员信息管理的controller");
        ModelAndView modelAndView = new ModelAndView();

        if (key == 0) {
            modelAndView.addObject("staffList", webService.selectAllStaffOrderById());
        } else {
            modelAndView.addObject("staffList", webService.selectStaffById(key));
        }

        //插入操作记录
        String log = "查看工作人员列表";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到staff_list.html
        modelAndView.setViewName("jsp/staff_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_details.html")
    //成员详细信息管理
    public ModelAndView staff_details(
            @Param(value = "staff_id") int staff_id,
            HttpServletRequest request
    ) {
        System.out.println("进入成员详细信息管理的controller");
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("staffInfo", webService.selectStaffById(staff_id).get(0));

        //插入操作记录
        String log = "进入成员详细信息管理页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到staff_details.html
        modelAndView.setViewName("/jsp/staff_details.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_delete.action")
    //删除管理成员
    public ModelAndView staff_delete(
            @Param(value = "staff_id") int staff_id,
            HttpServletRequest request
    ) {
        System.out.println("进入删除管理员的controller");
        //删除管理员
        webService.deleteStaffById(staff_id);
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("staffList", webService.selectAllStaffOrderById());
        //插入操作记录
        String log = "删除第" + staff_id + "号管理员账户";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到staff_list.html
        modelAndView.setViewName("jsp/staff_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "staff_update.action")
    //成员详细信息更新
    public ModelAndView staff_update(
            @Param(value = "role_update") int role_update,/*将被更改的权限级别*/
            @Param(value = "staff_id_update") int staff_id_update,/*将被更改的账户的账户id*/
            @Param(value = "staff_name_update") String staff_name_update,
            @Param(value = "staff_password_update") String staff_password_update,
            HttpServletRequest request
    ) {
        System.out.println("进入成员详细信息更新的controller");
        ModelAndView modelAndView = new ModelAndView();

        //做数据库更新操作
        webService.updateStaffInfo(staff_id_update, staff_name_update, staff_password_update, role_update);
        //从数据库查询更新后的信息
        modelAndView.addObject("staffInfo", webService.selectStaffById(staff_id_update).get(0));

        System.out.println(webService.selectStaffById(staff_id_update).toString());
        //插入操作记录
        String log = "更新id为" + staff_id_update + "的账户信息";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到staff_details.html
        modelAndView.setViewName("/jsp/staff_details.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "user_list.html")
    //用户列表
    public ModelAndView user_list(
            HttpServletRequest request,
            @Param(value = "key") int key) {
        System.out.println("进入用户信息列表的controller");
        ModelAndView modelAndView = new ModelAndView();

        if (key == 0) {
            modelAndView.addObject("userList", webService.selectAllUserOrderById());
        } else {
            modelAndView.addObject("userList", webService.selectUserById(key));
        }

        //插入操作记录
        String log = "查看用户列表";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到user_list.html
        modelAndView.setViewName("jsp/user_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "unban_user.action")
    //解封用户
    public ModelAndView unban_user(HttpServletRequest request,
                                   @Param(value = "user_id") int user_id) {
        System.out.println("进入解封的controller");
        webService.unbanUser(user_id);
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("userList", webService.selectAllUserOrderById());
        //插入操作记录
        String log = "解封" + user_id + "号用户";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到user_list.html
        modelAndView.setViewName("jsp/user_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "ban_user.action")
    // 封禁用户
    public ModelAndView ban_user(HttpServletRequest request,
                                 @Param(value = "user_id") int user_id) {
        System.out.println("进入封禁的controller");
        webService.banUser(user_id);
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("userList", webService.selectAllUserOrderById());
        //插入操作记录
        String log = "封禁" + user_id + "号用户";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到user_list.html
        modelAndView.setViewName("jsp/user_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "sales_statistics_full.html")
    //全时间销量统计
    public ModelAndView sales_statistics_full(
            HttpServletRequest request
            /*@Param(value = "date_range") String[] date_range*/
    ) {
        System.out.println("进入销量统计的controller");
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("SalesStatisticsList", webService.salesStatisticsFull());
        //插入操作记录
        String log = "查看销量统计";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到sales_statistics_full.html
        modelAndView.setViewName("jsp/sales_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "sales_statistics_range.html")
    //时间段销量统计
    public ModelAndView sales_statistics_range(
            HttpServletRequest request,
            @Param(value = "begin_date") String begin_date,
            @Param(value = "end_date") String end_date
    ) {
        System.out.println("进入销量统计的controller");
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("SalesStatisticsList", webService.salesStatisticsByDateRange(begin_date, end_date));
        //插入操作记录
        String log = "查看分段时间销量统计";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到sales_statistics_full.html
        modelAndView.setViewName("jsp/sales_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "browse_statistics_full.html")
    //全时间浏览量统计
    public ModelAndView browse_statistics_full(
            HttpServletRequest request
            /*@Param(value = "date_range") String[] date_range*/
    ) {
        System.out.println("进入浏览量统计的controller");
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("BrowseStatisticsList", webService.browseStatisticsFull());
        //插入操作记录
        String log = "查看浏览量统计";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到browse_statistics.html
        modelAndView.setViewName("jsp/browse_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "browse_statistics_range.html")
    //时间段浏览量统计
    public ModelAndView browse_statistics_range(
            HttpServletRequest request,
            @Param(value = "begin_date") String begin_date,
            @Param(value = "end_date") String end_date
    ) {
        System.out.println("进入时间段浏览量统计的controller");
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("BrowseStatisticsList", webService.browseStatisticsByDateRange(begin_date, end_date));
        //插入操作记录
        String log = "查看分段时间浏览量统计";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到browse_statistics.html
        modelAndView.setViewName("jsp/browse_statistics.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "order_list.html")
    //订单列表
    public ModelAndView browse_statistics_range(
            HttpServletRequest request,
            @Param(value = "staff_id") int key
    ) {
        System.out.println("进入订单列表的controller");
        //插入操作记录
        String log = "浏览订单列表";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        ModelAndView modelAndView = new ModelAndView();

        List<OrderListObject> orderList;
        if (key == 0) {//搜索关键词为空，显示全部订单
            orderList = webService.selectAllOrdersOrderById();
        } else {
            orderList = webService.searchAllOrdersByKey(key);
        }
        modelAndView.addObject("orderList", orderList);
        //重定向到order_list.html
        modelAndView.setViewName("jsp/order_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "deliver.action")
    //发货
    public ModelAndView deliver(
            HttpServletRequest request,
            @Param(value = "id") int id
    ) {
        System.out.println("进入发货的controller");
        ModelAndView modelAndView = new ModelAndView();

        List<OrderListObject> orderList;
        //发货
        webService.deliver(id);
        //插入操作记录
        String log = "为第" + id + "号订单记录执行发货操作";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        orderList = webService.selectAllOrdersOrderById();
        modelAndView.addObject("orderList", orderList);
        //重定向到order_list.html
        modelAndView.setViewName("jsp/order_list.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "order_manage.html")
    //管理订单
    public ModelAndView order_manage(
            HttpServletRequest request,
            @Param(value = "id") int id
    ) {
        System.out.println("进入管理订单的controller");
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("order", webService.selectOrderById(id));
        //插入操作记录
        String log = "管理第" + id + "号订单记录";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //order_manage.html
        modelAndView.setViewName("jsp/order_manage.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "order_update.action")
    //更新订单
    public ModelAndView order_update(
            HttpServletRequest request,
            @Param(value = "id") int id,
            @Param(value = "order_id_update") int order_id_update,
            @Param(value = "user_phone_update") String user_phone_update,
            @Param(value = "product_id_update") int product_id_update,
            @Param(value = "store_id_update") int store_id_update,
            @Param(value = "amount_update") int amount_update,
            @Param(value = "single_price_update") double single_price_update,
            @Param(value = "total_price_update") double total_price_update,
            @Param(value = "order_status_update") int order_status_update
    ) {
        System.out.println("进入更新订单的controller");
        ModelAndView modelAndView = new ModelAndView();

        webService.updateOrderInfo(id,
                order_id_update,
                user_phone_update,
                product_id_update,
                store_id_update,
                amount_update,
                single_price_update,
                total_price_update,
                order_status_update);
        //插入操作记录
        String log = "更新第" + id + "号订单记录";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        modelAndView.addObject("order", webService.selectOrderById(id));
        //order_manage.html
        modelAndView.setViewName("jsp/order_manage.jsp");
        return modelAndView;
    }

    @RequestMapping(value = "management_log.html")
    //操作历史记录
    public ModelAndView management_log(
            HttpServletRequest request,
            @Param(value = "key") int key) {
        System.out.println("进入操作历史记录列表的controller");
        ModelAndView modelAndView = new ModelAndView();

        if (key == 0) {
            modelAndView.addObject("logList", webService.selectAllLogOrderById());
        } else {
            modelAndView.addObject("logList", webService.selectAllLogById(key));
        }

        //插入操作记录
        String log = "查看操作历史记录";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        //重定向到user_list.html
        modelAndView.setViewName("jsp/management_log.jsp");
        return modelAndView;
    }
    //////////////////////
    ///////////////////////////Xenia///////////////////////////////

    /**
     * @Description:测试搜索商店的列表 Param:
     * Return: 框架的modelAndView
     * Author:廖馨婷
     * Date:2019/3/2
     */
    @RequestMapping(value = "branchStoresTables")
    public ModelAndView getStoreList(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        System.out.println("我进入了controller");
        List<BranchStore> stores = webService.getBranchStore();
        System.out.println("我获取了数据");

        mv.addObject("stores", stores);
        mv.setViewName("jsp/branchStoresTables.jsp");
        System.out.println("我完成了整个工作");
        System.out.println(stores.toString());
        //插入操作记录
        String log = "浏览门店列表";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return mv;
    }

    /**
     * @Description: 进入商品类别和商品注册信息的页面
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/4
     */
    @RequestMapping(value = "categoryAndGoods")
    public ModelAndView getGoods(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
//        需要获取类别和商品的信息
        System.out.println("我进入了商品的主页面");
        JSONObject dataJson = webService.getCategoriesMapperJson();
        mv.addObject("categoryJson", dataJson.toString());
        List<Product> products = webService.getProducts();
        mv.addObject("my_products", products);
        mv.setViewName("jsp/categoryAndGoods.jsp");
        //插入操作记录
        String log = "进入商品和注册商品主页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return mv;
    }

    @RequestMapping(value = "categoryOnly")
    public ModelAndView getCategory(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
//        需要获取类别和商品的信息
        System.out.println("我进入了类别的主页面");
        JSONObject dataJson = webService.getCategoriesMapperJson();
        mv.addObject("categoryJson", dataJson.toString());
        mv.setViewName("jsp/categoryOnly.jsp");
        //插入操作记录
        String log = "进入商品类别管理页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return mv;
    }


    @RequestMapping(value = "goodsRegistToStore")
    public ModelAndView getGoodsRegistToStores(HttpServletRequest request) {
//        @Param(value="store_id")String store_id
        System.out.println("我进了商品注册到门店的controller");
        ModelAndView mv = new ModelAndView();
        List<ProductToStore> productToStores = webService.getProductsRegistedInStore();
        mv.addObject("products_by_stores_list", productToStores);
        mv.setViewName("jsp/goodsRegistToStore.jsp");
        System.out.println("我获取了所有的商店和产品注册信息");
        //插入操作记录
        String log = "进入注册商品主页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return mv;
    }

    @RequestMapping(value = "SpecialSector")
    public ModelAndView getSpecialSector(HttpServletRequest request) {
        System.out.println("我进了特殊板块的controller");
        ModelAndView mv = new ModelAndView();
//        List<SpecialProduct> specialProducts=webService.getProductsForSector();
//        mv.addObject("special_products_list",specialProducts);
//        List<SpecialSector> specialSectors=webService.getSectors();
//        mv.addObject("special_sectors_list",specialSectors);
//        List<Product> products=webService.getProducts();
//        mv.addObject("products_list",products);
        mv.setViewName("jsp/SpecialSector.jsp");
        System.out.println("我获取了所有的商店和特殊板块信息");
        //插入操作记录
        String log = "进入特殊板块管理页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return mv;
    }


}