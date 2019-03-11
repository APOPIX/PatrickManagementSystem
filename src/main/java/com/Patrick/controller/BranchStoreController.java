package com.Patrick.controller;

import com.Patrick.service.BranchStoresService;
import com.Patrick.service.WebService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * created by 廖馨婷
 * BranchStoreController: 似乎每个页面要求对应一个控制类
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@RestController
@RequestMapping("/branchStoresTables")
public class BranchStoreController {
    @Autowired//此注解使得接口"WebService"得以实例化
            BranchStoresService branchStoresService;
    @Autowired//此注解使得接口"WebService"得以实例化
            WebService webService;

    /**
     * @Description:删除商店的代码实现 Param: 待删除的商店id的数组param
     * Return: 删除几条数据的String
     * Author:廖馨婷
     * Date:2019/3/2
     */

    @RequestMapping(value = "/deleteStore.do", method = RequestMethod.POST)
    public String deleteStore(@RequestParam("idsList") String idsList, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        System.out.println("我进入删除按钮的控制类了。");
        System.out.println(idsList);
//        JSONObject jsonObject=new JSONObject(idsList);
        List<Integer> deleteIds = JSONArray.parseArray(idsList, int.class);
        System.out.println(deleteIds);
        int delete_num = branchStoresService.deleteStore(deleteIds);
//        return Integer.toString(delete_num);
        System.out.println("我完成了删除工作，删除了" + delete_num + "条门店信息！");
//        mv.setViewName("");
        //插入操作记录
        String log = "删除了" + delete_num + "条门店信息";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(delete_num);
    }

    @RequestMapping(value = "goodsRegistToStore")
    public ModelAndView getGoodsRegistToStore(@Param(value = "store_id") String store_id, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        System.out.println("我进入表单里边的商店页面");
        //插入操作记录
        String log = "进入商店页面";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        mv.setViewName("jsp/goodsRegistToStore.jsp");
        return mv;
    }

    /**
     * @Description: 添加商店信息到数据库，使用JsonObj获取数据
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/5
     */
    @RequestMapping(value = "/addStore.do", method = RequestMethod.POST)
    public String addStore(@RequestBody JSONObject data, HttpServletRequest request) {
        System.out.println("我进来了controller！");

        String storeName = data.getString("storeName");
        String storeTel = data.getString("storeTel");
        String storeProvince = data.getString("province");
        String storeCity = data.getString("city");
        String storeDistrict = data.getString("district");
        String storeAddress = data.getString("streetAddr");
        double storeLongitude = data.getDoubleValue("storeLongitude");
        double storeLatitude = data.getDoubleValue("storeLatitude");
        String storeIntroduction = data.getString("introduction");
        int storeStatus = data.getIntValue("status");
        String openTime = data.getString("openTime");
        String closeTime = data.getString("closeTime");
        if (openTime.contains("P")) {
            System.out.println(openTime);
            openTime = Integer.toString(Integer.parseInt(openTime.substring(0, openTime.indexOf(':'))) + 12).concat(openTime.substring(openTime.indexOf(':'), openTime.indexOf(' ')));
            System.out.println(openTime);
        } else {
            openTime = openTime.substring(0, openTime.indexOf(' '));

        }
        if (closeTime.contains("P")) {
            System.out.println(closeTime);
            closeTime = Integer.toString(Integer.parseInt(closeTime.substring(0, closeTime.indexOf(':'))) + 12).concat(closeTime.substring(closeTime.indexOf(':'), closeTime.indexOf(' ')));
            System.out.println(closeTime);
        } else {
            closeTime = closeTime.substring(0, closeTime.indexOf(' '));
        }
        int add_num = branchStoresService.addStore(storeName, storeTel, storeProvince, storeCity,
                storeDistrict, storeAddress, storeLongitude, storeLatitude, openTime,
                closeTime, storeIntroduction, storeStatus);
        System.out.println(add_num);
        //插入操作记录
        String log = "增添门店";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return "添加门店信息失败！";

    }
    //////////////////////Xenia/////////////////////////
}
