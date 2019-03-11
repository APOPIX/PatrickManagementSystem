package com.Patrick.service.implement;

import com.Patrick.mapper.WebMapper;
import com.Patrick.service.BranchStoresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created by 廖馨婷
 * BranchStoresServiceImpl: 门店信息的实现
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@Service
public class BranchStoresServiceImpl implements BranchStoresService {
    @Autowired
    WebMapper webMapper;

    /**
     * @Description: sevice 层面实现删除门店信息的
     * Param: list
     * Return: 返回成功删除的元组条数
     * Author:廖馨婷
     * Date:2019/3/2
     */
    @Override
    public int deleteStore(List list) {
        return webMapper.deleteStore(list);
    }

    @Override
    public int addStore(String storeName, String storeTel, String storeProvince, String storeCity,
                        String storeDistrict, String  storeAddress, double storeLongitude, double storeLatitude, String openTime,
                        String closeTime, String storeIntroduction, int storeStatus) {
        return webMapper.addStore(storeName, storeTel, storeProvince, storeCity,
                        storeDistrict, storeAddress, storeLongitude, storeLatitude, openTime,
                        closeTime, storeIntroduction, storeStatus);
    }

}
