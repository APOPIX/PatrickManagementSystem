package com.Patrick.service;

import com.Patrick.dao.*;
import net.sf.json.JSONObject;

import java.util.List;

public interface WebService {

    List<Staff> login(String staff_name, String staff_password);

    void register(String staff_name_register, String staff_password_register, int role_register);

    List<Staff> selectAllStaffOrderById();

    List<User> selectAllUserOrderById();

    List<Staff> selectStaffById(int staff_id);

    void updateStaffInfo(int staff_id, String staff_name, String staff_password, int staff_role);

    void unbanUser(int user_id);

    void banUser(int user_id);

    List<SalesStatistics> salesStatisticsByDateRange(String beginDate, String endDate);

    List<SalesStatistics> salesStatisticsFull();

    List<BrowseStatistics> browseStatisticsFull();

    List<BrowseStatistics> browseStatisticsByDateRange(String beginDate, String endDate);

    List<OrderListObject> selectAllOrdersOrderById();

    List<OrderListObject>  searchAllOrdersByKey(int key);

    void deliver(int id);

    Orders selectOrderById(int id);

    void updateOrderInfo(int id, int order_id_update, String user_phone_update, int product_id_update, int store_id_update, int amount_update, double single_price, double total_price_update, int order_status_update);

    void managementLog(int staff_id, String action);

    List<User> selectUserById(int id);

    void deleteStaffById(int staff_id);

    List<ManagementLog> selectAllLogOrderById();

    List<ManagementLog> selectAllLogById(int id);

    List<SalesRanking> selectTopTenSalesRanking(String begin_date, String end_date);

    /////////////////////////////////Xenia///////////////////////////////////////////////
    /**
     *@Description: 获取门店的service 接口
     *Param:
     *Return: 门店信息的列表
     *Author:廖馨婷
     *Date:2019/3/2
     */
    List<BranchStore> getBranchStore();

    /**
     *@Description: 用于展示商店和商品对应的表格
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/5
     */
    List<ProductToStore> getProductsRegistedInStore();

    List<SpecialProduct> getProductsForSector();
    List<SpecialSector> getSectors();

    /**
     *@Description: 获取商品信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/6
     */
    List<Product> getProducts();

    /**
     *@Description: 处理和商品类别页面有关的数据获取
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/7
     */
    List<CategoriesMapper> getCategoriesMapper();
    JSONObject getCategoriesMapperJson();

    /////////////////////////////////Xenia///////////////////////////////////////////////
}
