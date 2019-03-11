package com.Patrick.service.implement;

import com.Patrick.mapper.WebMapper;
import com.Patrick.service.GoodsRegistToStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * created by 廖馨婷
 * GoodsRegistToStoreServiceImpl: 用于实现门店和商品对应的页面
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@Service
public class GoodsRegistToStoreServiceImpl implements GoodsRegistToStoreService {

    @Autowired
    WebMapper webMapper;
    /**
    *@Description: 用于删除门店和商品对应的记录
    *Param:
    *Return:
    *Author:廖馨婷
    *Date:2019/3/5
    */
    @Override
    public int deleteGSRecord(int id){
        return webMapper.deleteGSRecord(id);
    }

    @Override
    public int updateGSRecord(int record_id,int product_id,int store_id,int inventory,double original_price,double discount,int product_status){
        return webMapper.updateGSRecord(record_id,product_id,store_id,inventory,original_price,discount,product_status);
    }

    @Override
    public int addGSRecord(int product_id,int store_id,int inventory,double original_price,double discount,int product_status){
        return webMapper.addGSRecord(product_id,store_id,inventory,original_price,discount,product_status);
    }

}
