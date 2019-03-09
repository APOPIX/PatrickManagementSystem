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
}
