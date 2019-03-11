package com.Patrick.controller;

import com.Patrick.service.GoodsRegistToStoreService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * created by 廖馨婷
 * GoodsRegistToStoreController: 处理商品在商店注册页面的函数
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@RestController
@RequestMapping("/goodsRegistToStore")
public class GoodsRegistToStoreController {
    @Autowired
    GoodsRegistToStoreService goodsRegistToStoreService;

    /**
    *@Description: 删除注册好的商品和商店对应
    *Param:
    *Return:
    *Author:廖馨婷
    *Date:2019/3/5
    */
    @RequestMapping("/removeProductsFromStores.do")
    public String removeProductsFromStores(@RequestBody JSONObject data){
        int record_id=data.getIntValue("record_id");
        System.out.println("我进来删除记录的controller了"+record_id);
        int delete_num=goodsRegistToStoreService.deleteGSRecord(record_id);
        return JSON.toJSONString(delete_num);
    }

    @RequestMapping("/updateProductsFromStores.do")
    public String updateProductsFromStores(@RequestBody JSONObject data){
        int record_id=data.getIntValue("record_id");
        int product_id=data.getIntValue("product_id");
        int store_id=data.getIntValue("store_id");
        int inventory=data.getIntValue("inventory");
        double original_price=data.getDoubleValue("original_price");
        double discount=data.getDoubleValue("discount");
        int product_status=data.getIntValue("product_status");
        System.out.println("我其实有获取数据的："+record_id+product_id+store_id+original_price+store_id+discount);
        int update_num=goodsRegistToStoreService.updateGSRecord(record_id,product_id,store_id,inventory,original_price,discount,product_status);
        return JSON.toJSONString(update_num);
    }

    @RequestMapping("addProductsFromStores.do")
    public String addProductsFromStores(@RequestBody JSONObject data){
//        int record_id=data.getIntValue("record_id");
        int product_id=data.getIntValue("product_id");
        int store_id=data.getIntValue("store_id");
        int inventory=data.getIntValue("inventory");
        double original_price=data.getDoubleValue("original_price");
        double discount=data.getDoubleValue("discount");
        int product_status=data.getIntValue("product_status");
        System.out.println("保存：我其实有获取数据的："+product_id+store_id+original_price+store_id+discount);
        int update_num=goodsRegistToStoreService.addGSRecord(product_id,store_id,inventory,original_price,discount,product_status);
        return JSON.toJSONString(update_num);
    }
}
