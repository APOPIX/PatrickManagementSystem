package com.Patrick.service;

import java.util.List;

public interface BranchStoresService {
    /**
     *@Description: 删除门店的service 接口
     *Param: list
     *Return: 删除成功之后返回的条数
     *Author:廖馨婷
     *Date:2019/3/2
     */
    int deleteStore(List list);
    /**
    *@Description: 用于添加门店信息的表单
    *Param: branchStore
    *Return: 成功注册的条数
    *Author:廖馨婷
    *Date:2019/3/4
    */
    int addStore(String storeName, String storeTel, String storeProvince, String storeCity,
                 String storeDistrict, String storeAddress, double storeLongitude, double storeLatitude, String openTime,
                 String closeTime, String storeIntroduction, int storeStatus);

}
