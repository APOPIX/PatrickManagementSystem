package com.Patrick.service;

import com.Patrick.dao.*;

import java.util.List;

public interface WebService {

    List<Staff> login(String staff_name, String staff_password);

    void register(String staff_name_register, String staff_password_register, int role_register);

    List<Staff> selectAllStaffOrderById();

    List<User> selectAllUserOrderById();

    Staff selectStaffById(int staff_id);

    void updateStaffInfo(int staff_id, String staff_name, String staff_password, int staff_role);

    void unbanUser(int user_id);

    void banUser(int user_id);

    List<SalesStatistics> salesStatisticsByDateRange(String beginDate, String endDate);

    List<SalesStatistics> salesStatisticsFull();

    List<BrowseStatistics> browseStatisticsFull();

    List<BrowseStatistics> browseStatisticsByDateRange(String beginDate, String endDate);

    List<Orders> selectAllOrdersOrderById();

    List<Orders>  searchAllOrdersByKey(String key);
}
