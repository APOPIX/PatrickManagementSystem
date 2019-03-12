package com.Patrick.service.implement;

import com.Patrick.mapper.WebMapper;
import com.Patrick.service.ProductForSectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * created by 廖馨婷
 * ProductForSectorServiceImpl: 用于处理特殊商品的service
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@Service
public class ProductForSectorServiceImpl implements ProductForSectorService {
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
    public int deletePSRecord(int id){
        return webMapper.deletePSRecord(id);
    }

    @Override
    public int updatePSRecord(int record_id,String sector_name,int product_id){
        return webMapper.updatePSRecord(record_id,sector_name,product_id);
    }

    @Override
    public int addPSRecord(String sector_name,int product_id){
        return webMapper.addPSRecord(sector_name,product_id);
    }
    @Override
    public int addSector(String sector_name){
        return webMapper.addSector(sector_name);
    }
    @Override
    public int deleteSector(String sector_name){
        return webMapper.deleteSector1(sector_name)+ webMapper.deleteSector2(sector_name);
    }
    @Override
    public int updateSector(int id,String sector_name){
        return webMapper.updateSector1(id,sector_name)+webMapper.updateSector2(id,sector_name);

    }

}
