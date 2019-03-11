package com.Patrick.controller;

import com.Patrick.dao.SpecialProduct;
import com.Patrick.service.ProductForSectorService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    /**
     *@Description: 删除注册好的商品和商店对应
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/5
     */
    @RequestMapping("/removeProductsForSector.do")
    public String removeProductsFromSector(@RequestBody JSONObject data){
        int record_id=data.getIntValue("record_id");
        System.out.println("我进来删除记录的controller了"+record_id);
        int delete_num=productForSectorService.deletePSRecord(record_id);
        return JSON.toJSONString(delete_num);
    }

    @RequestMapping("/updateProductsForSector.do")
    public String updateProductsFromSector(@RequestBody JSONObject data){
        int record_id=data.getIntValue("record_id");
        String sector_name=data.getString("sector_name");
        int product_id=data.getIntValue("product_id");
        System.out.println("我其实有获取数据的："+record_id+product_id+sector_name);
        int update_num=productForSectorService.updatePSRecord(record_id,sector_name,product_id);
        return JSON.toJSONString(update_num);
    }

    @RequestMapping("/addProductsForSector.do")
    public String addProductsFromSector(@RequestBody JSONObject data){
        String sector_name=data.getString("sector_name");
        int product_id=data.getIntValue("product_id");
        System.out.println("保存：我其实有获取数据的："+product_id+sector_name);
        int add_num=productForSectorService.addPSRecord(sector_name,product_id);
        return JSON.toJSONString(add_num);
    }

    /**
    *@Description: 由多选的方式注册商品到特殊板块
    *Param:
    *Return:
    *Author:廖馨婷
    *Date:2019/3/6
    */
    @RequestMapping(value="/addPSRecords.do",method = RequestMethod.POST)
    public String addPSRecords(@RequestParam("psRecords") String psRecords) {
        List<SpecialProduct> Records=JSONArray.parseArray(psRecords, SpecialProduct.class);
        int add_num=0;
        for(SpecialProduct psRecord : Records){
            System.out.println(psRecord.getSector_name()+psRecord.getProduct_id());
            add_num+=productForSectorService.addPSRecord(psRecord.getSector_name(),psRecord.getProduct_id());
        }
        return JSON.toJSONString(add_num);

    }
    
    /**
    *@Description: 处理板块信息
    *Param:
    *Return:
    *Author:廖馨婷
    *Date:2019/3/6
    */
    @RequestMapping("/addSector.do")
    public String addSector(@RequestBody JSONObject data){
        String sector_name=data.getString("sector_name");
        System.out.println("保存：我其实有获取数据的："+sector_name);
        int add_num=productForSectorService.addSector(sector_name);
        return JSON.toJSONString(add_num);
    }

    @RequestMapping("/deleteSector.do")
    public String deleteSector(@RequestBody JSONObject data){
        String sector_name=data.getString("sector_name");
        System.out.println("保存：我其实有获取数据的："+sector_name);
        int delete_num=productForSectorService.deleteSector(sector_name);
        return JSON.toJSONString(delete_num);
    }
    @RequestMapping("/updateSector.do")
    public String updateSector(@RequestBody JSONObject data){
        int id=data.getIntValue("id");
        String sector_name=data.getString("sector_name");
        System.out.println("保存：我其实有获取数据的："+sector_name);
        int update_num=productForSectorService.updateSector(id,sector_name);
        return JSON.toJSONString(update_num);
    }
}
