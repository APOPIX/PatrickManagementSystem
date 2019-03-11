package com.Patrick.controller;

import com.Patrick.dao.SpecialProduct;
import com.Patrick.service.ProductForSectorService;
import com.Patrick.service.WebService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * created by 廖馨婷
 * ProductsForSector: 每个活动模块的商品注册
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@RestController
@RequestMapping("/SpecialSector")
public class ProductsForSectorController {
    @Autowired
    ProductForSectorService productForSectorService;
    @Autowired//此注解使得接口"WebService"得以实例化
            WebService webService;

    /**
     * @Description: 删除注册好的商品和商店对应
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/5
     */
    @RequestMapping("/removeProductsForSector.do")
    public String removeProductsFromSector(@RequestBody JSONObject data, HttpServletRequest request) {
        int record_id = data.getIntValue("record_id");
        System.out.println("我进来删除记录的controller了" + record_id);
        int delete_num = productForSectorService.deletePSRecord(record_id);
        //插入操作记录
        String log = "删除特殊板块商品";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(delete_num);
    }

    @RequestMapping("/updateProductsForSector.do")
    public String updateProductsFromSector(@RequestBody JSONObject data, HttpServletRequest request) {
        int record_id = data.getIntValue("record_id");
        String sector_name = data.getString("sector_name");
        int product_id = data.getIntValue("product_id");
        System.out.println("我其实有获取数据的：" + record_id + product_id + sector_name);
        //插入操作记录
        String log = "更新特殊板块商品，记录id=" + record_id;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        int update_num = productForSectorService.updatePSRecord(record_id, sector_name, product_id);
        return JSON.toJSONString(update_num);
    }

    @RequestMapping("/addProductsForSector.do")
    public String addProductsFromSector(@RequestBody JSONObject data, HttpServletRequest request) {
        String sector_name = data.getString("sector_name");
        int product_id = data.getIntValue("product_id");
        System.out.println("保存：我其实有获取数据的：" + product_id + sector_name);
        //插入操作记录
        String log = "增添特殊板块商品，商品id=" + product_id + "板块名" + sector_name;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        int add_num = productForSectorService.addPSRecord(sector_name, product_id);
        return JSON.toJSONString(add_num);
    }

    /**
     * @Description: 由多选的方式注册商品到特殊板块
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/6
     */
    @RequestMapping(value = "/addPSRecords.do", method = RequestMethod.POST)
    public String addPSRecords(@RequestParam("psRecords") String psRecords, HttpServletRequest request) {
        List<SpecialProduct> Records = JSONArray.parseArray(psRecords, SpecialProduct.class);
        int add_num = 0;
        for (SpecialProduct psRecord : Records) {
            System.out.println(psRecord.getSector_name() + psRecord.getProduct_id());
            add_num += productForSectorService.addPSRecord(psRecord.getSector_name(), psRecord.getProduct_id());
        }
        //插入操作记录
        String log = "增添特殊板块商品";
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(add_num);
    }

    /**
     * @Description: 处理板块信息
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/6
     */
    @RequestMapping("/addSector.do")
    public String addSector(@RequestBody JSONObject data, HttpServletRequest request) {
        String sector_name = data.getString("sector_name");
        System.out.println("保存：我其实有获取数据的：" + sector_name);
        int add_num = productForSectorService.addSector(sector_name);
        //插入操作记录
        String log = "增添特殊板块,板块名：" + sector_name;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(add_num);
    }

    @RequestMapping("/deleteSector.do")
    public String deleteSector(@RequestBody JSONObject data,HttpServletRequest request) {
        String sector_name = data.getString("sector_name");
        System.out.println("保存：我其实有获取数据的：" + sector_name);
        int delete_num = productForSectorService.deleteSector(sector_name);
        //插入操作记录
        String log = "删除特殊板块,板块名：" + sector_name;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(delete_num);
    }

    @RequestMapping("/updateSector.do")
    public String updateSector(@RequestBody JSONObject data,HttpServletRequest request) {
        int id = data.getIntValue("id");
        String sector_name = data.getString("sector_name");
        System.out.println("保存：我其实有获取数据的：" + sector_name);
        int update_num = productForSectorService.updateSector(id, sector_name);
        //插入操作记录
        String log = "更新特殊板块,板块名：" + sector_name;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(update_num);
    }
}
