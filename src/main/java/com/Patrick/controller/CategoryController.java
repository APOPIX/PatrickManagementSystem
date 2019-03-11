
/**
 * created by 廖馨婷
 * CategoryController: 新增的用于分离类别和商品的页面
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
package com.Patrick.controller;

import com.Patrick.dao.CategoryMapper1;
import com.Patrick.dao.CategoryMapper2;
import com.Patrick.service.CategoryAndGoodsService;
import com.Patrick.service.WebService;
import com.Patrick.utils.Upload;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * created by 廖馨婷
 * CategoryAndGoodsController: 用于作为商品类别和商品注册的controller
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@RestController
@RequestMapping("/categoryOnly")
public class CategoryController {
    @Autowired
    CategoryAndGoodsService categoryAndGoodsService;
    @Autowired//此注解使得接口"WebService"得以实例化
    WebService webService;

    @RequestMapping("addNewCategory.do")
    public String addNewCategory(@RequestBody JSONObject data, HttpServletRequest request) {
        String first_category = data.getString("firstCategory");
        String second_category = data.getString("secondCategory");
        String third_category = data.getString("thirdCategory");
        System.out.println("我进入类别控制器添加类别函数，然后获取类别信息：" + first_category + " " + second_category + " " + third_category);
        int add_num = categoryAndGoodsService.addNewCategory(first_category, second_category, third_category);
        //插入操作记录
        String log = "获取类别信息：" + first_category + " " + second_category + " " + third_category;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(add_num);
    }

    @RequestMapping("updateCategory.do")
    public String updateCategory(@RequestBody JSONObject data, HttpServletRequest request) {
        String first_category = data.getString("firstCategory");
        String second_category = data.getString("secondCategory");
        String third_category = data.getString("thirdCategory");
        int map23Id = data.getIntValue("id");
        System.out.println("my id：" + map23Id);
//        System.out.println("我进入类别控制器更新类别函数，然后获取类别信息："+first_category+" "+second_category+" "+third_category);
        //插入操作记录
        String log = "更新类别信息：" + first_category + " " + second_category + " " + third_category;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return categoryAndGoodsService.updateCategory(map23Id, first_category, second_category, third_category);
    }

    @RequestMapping("deleteCategory.do")
    public String deleteCategory(@RequestBody JSONObject data, HttpServletRequest request) {
        String first_category = data.getString("firstCategory");
        String second_category = data.getString("secondCategory");
        String third_category = data.getString("thirdCategory");
        System.out.println("我进入类别控制器删除类别函数，然后获取类别信息：" + first_category + " " + second_category + " " + third_category);
        //插入操作记录
        String log = "删除类别信息：" + first_category + " " + second_category + " " + third_category;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return categoryAndGoodsService.deleteCategory(first_category, second_category, third_category);
    }

}

