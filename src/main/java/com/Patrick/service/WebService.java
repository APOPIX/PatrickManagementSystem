package com.Patrick.service;

import com.Patrick.dao.*;

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
}
