package com.Patrick.mapper;

import com.Patrick.dao.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WebMapper {
    //将"String"类型的变量"staff_name"和"staff_password"以"staff_name"和"staff_password"为参数名传入到WebMapper.xml中
    List<Staff> login(@Param(value = "staff_name") String staff_name, @Param(value = "staff_password") String staff_password);

    //将"String"类型的变量"staff_name_register"、"staff_password_register"、"role_register"
    // 以"staff_name_register"、"staff_password_register"、"role_register"为参数名传入到WebMapper.xml中
    void register(@Param(value = "staff_name_register") String staff_name_register,
                  @Param(value = "staff_password_register") String staff_password_register,
                  @Param(value = "role_register") int role_register);

    //无传入参数
    List<Staff> selectAllStaffOrderById();

    //将"int"类型的变量"staff_id"以"staff_id"为参数名传入到WebMapper.xml中
    List<Staff> selectStaffById(@Param(value = "staff_id") int staff_id);

    //将"String"类型的变量"staff_id"、"staff_name"、"staff_password"
    // 以"staff_id"、"staff_name"、"staff_password"为参数名传入到WebMapper.xml中
    void updateStaffInfo(@Param(value = "staff_id") int staff_id,
                         @Param(value = "staff_name") String staff_name,
                         @Param(value = "staff_password") String staff_password,
                         @Param(value = "staff_role") int staff_role);

    //无传入参数
    List<User> selectAllUserOrderById();

    //无传入参数
    void unbanUser(@Param(value = "user_id") int user_id);

    //无传入参数
    void banUser(@Param(value = "user_id") int user_id);

    //将"String"类型的变量"beginDate"和"endDate"以"begin_date"和"end_date"为参数名传入到WebMapper.xml中
    List<SalesStatistics> salesStatisticsByDateRange(@Param(value = "begin_date") String beginDate, @Param(value = "end_date") String endDate);

    //无传入参数
    List<SalesStatistics> salesStatisticsFull();

    //无传入参数
    List<BrowseStatistics> browseStatisticsFull();

    //将"String"类型的变量"beginDate"和"endDate"以"beginDate"和"endDate"为参数名传入到WebMapper.xml中
    List<BrowseStatistics> browseStatisticsByDateRange(@Param(value = "begin_date") String beginDate, @Param(value = "end_date") String endDate);

    //无传入参数
    List<OrderListObject> selectAllOrdersOrderById();

    //将"String"类型的变量"key"以"key"为参数名传入到WebMapper.xml中
    List<OrderListObject> searchAllOrdersByKey(@Param(value = "key") int key);

    //将"int"类型的变量"id"以"id"为参数名传入到WebMapper.xml中
    void deliver(@Param(value = "id") int id);

    //将"int"类型的变量"id"以"id"为参数名传入到WebMapper.xml中
    Orders selectOrderById(@Param(value = "id") int id);

    //传入用于更新Orders 的参数
    void updateOrderInfo(
            @Param(value = "id") int id,
            @Param(value = "order_id_update") int order_id_update,
            @Param(value = "user_phone_update") String user_phone_update,
            @Param(value = "product_id_update") int product_id_update,
            @Param(value = "store_id_update") int store_id_update,
            @Param(value = "amount_update") int amount_update,
            @Param(value = "single_price_update") double single_price_update,
            @Param(value = "total_price_update") double total_price_update,
            @Param(value = "order_status_update") int order_status_update);

    //传入用于插入操作记录的参数
    void managementLog(@Param(value = "staff_id") int staff_id,
                       @Param(value = "action") String action,
                       @Param(value = "time_stamp") String time_stamp);

    //将"int"类型的变量"id"以"id"为参数名传入到WebMapper.xml中
    List<User> selectUserById(@Param(value = "id") int id);

    //将"int"类型的变量"staff_id"以"staff_id"为参数名传入到WebMapper.xml中
    void deleteStaffById(@Param(value = "staff_id") int staff_id);

    //无传入参数
    List<ManagementLog> selectAllLogOrderById();

    //将"int"类型的变量"id"以"id"为参数名传入到WebMapper.xml中
    List<ManagementLog> selectAllLogById(@Param(value = "staff_id") int staff_id);

    //////////////////////////////Xenia/////////////////////////////////

    /**
     * @Description： 获取门店信息的接口
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/2
     */
    List<BranchStore> getBranchStore();

    /**
     * @Description: 删除门店信息的接口
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/2
     */
    int deleteStore(List list);

    /**
     * @Description: 添加门店信息的接口
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/4
     */
    int
    addStore(@Param("storeName") String storeName, @Param("storeTel") String storeTel,
             @Param("storeProvince") String storeProvince, @Param("storeCity") String storeCity,
             @Param("storeDistrict") String storeDistrict, @Param("storeAddress") String storeAddress,
             @Param("storeLongitude") double storeLongitude, @Param("storeLatitude") double storeLatitude,
             @Param("openTime") String openTime, @Param("closeTime") String closeTime,
             @Param("storeIntroduction") String storeIntroduction, @Param("storeStatus") int storeStatus);

    /**
     * @Description: 获取门店和商品对应的信息
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/5
     */
    List<ProductToStore> getProductsRegistedInStore();

    /**
     * @Description: 删除门店商品注册信息的数据库接口
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/5
     */
    int deleteGSRecord(@Param("id") int id);

    /**
     * @Description: 更新门店商品注册信息的数据库接口
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/5
     */
    int updateGSRecord(@Param("record_id") int record_id, @Param("product_id") int product_id, @Param("store_id") int store_id,@Param("inventory")int inventory,
                       @Param("original_price") double original_price, @Param("discount") double discount,@Param("product_status") int product_status);
    int addGSRecord(@Param("product_id") int product_id, @Param("store_id") int store_id,@Param("inventory")int inventory,
                    @Param("original_price") double original_price, @Param("discount") double discount,@Param("product_status") int product_status);


    /**
     *@Description: 更新特殊模块和商品信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/6
     */
    List<SpecialProduct> getProductsForSector();
    int addPSRecord(@Param("sector_name")String sector_name,@Param("product_id")int product_id);
    int updatePSRecord(@Param("record_id") int record_id, @Param("sector_name")String sector_name,@Param("product_id") int product_id);
    int deletePSRecord(@Param("id") int id);

    /**
     *@Description: 更新特殊板块的信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/6
     */
    int addSector(@Param("sector_name")String sector_name);
    int deleteSector(@Param("sector_name")String sector_name);
    List<SpecialSector> getSectors();
    int updateSector(@Param("id")int id,@Param("new_sector_name")String new_sector_name);

    /**
     *@Description: 获取商品的信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/6
     */
    List<Product> getProducts();

    /**
     *@Description: 处理商品类别信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/7
     */
    List<CategoriesMapper> getCategoriesMappers();
    int countSecondCategoryInMap23(@Param("second_category") String second_category);
    int countFirstCategoryInMap12(@Param("first_category") String first_category);


    int addCategoryMap12(@Param("first_category") String first_category,@Param("second_category") String second_category);
    int addCategoryMap23(@Param("second_category") String second_category,@Param("third_category") String third_category);
    int deleteCategoryMap12(@Param("first_category") String first_category,@Param("second_category") String second_category);
    int deleteCategoryMap23(@Param("second_category") String second_category,@Param("third_category") String third_category);

    int updateFirstCategory(@Param("old_first_category") String old_first_category,@Param("new_first_category") String new_first_category);
    int updateSecondCategoryInMap12(@Param("old_second_category") String old_second_category,@Param("new_second_category") String new_second_category);
    int updateSecondCategoryInMap23(@Param("old_third_category") String old_third_category,@Param("new_second_category") String new_second_category);
    int updateThirdCategory(@Param("old_third_category")String old_third_category,@Param("new_third_category")String new_third_category);

    /**
     *@Description: 单独获取两级目录映射
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/8
     */
    List<CategoryMapper1> getcategoryMapper1();
    List<CategoryMapper2> getcategoryMapper2();
    //    利用id获取只指定的mapper23
    CategoryMapper2 getcategoryMapper2ById(@Param("mapId")int mapId);
    CategoryMapper1 getcategoryMapper1Bysecond_category(@Param("second_category")String second_category);
    CategoryMapper2 getcategoryMapper2ByThirdCategory(@Param("third_category")String third_category);


    /**
     *@Description: 处理商品方面的信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/10
     */
    int addProduct(@Param("id")int id,@Param("product_name")String product_name,@Param("first_category")String first_category,
                   @Param("second_category")String second_category,@Param("third_category")String third_category,
                   @Param("product_short_introduction")String product_short_introduction,@Param("product_detail")String product_detail,
                   @Param("url0")String url0,@Param("url1")String url1,@Param("url2")String url2,@Param("url3")String url3,
                   @Param("current_time")String current_time,@Param("update_time")String update_time,@Param("uint")String unit);
    //////////////////////////////Xenia/////////////////////////////////
}
