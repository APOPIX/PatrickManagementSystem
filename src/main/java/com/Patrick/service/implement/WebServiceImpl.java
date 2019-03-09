package com.Patrick.service.implement;

import com.Patrick.dao.*;
import com.Patrick.mapper.WebMapper;
import com.Patrick.service.WebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
public class WebServiceImpl implements WebService {
    @Autowired
    WebMapper webMapper;


    @Override
    public List<Staff> login(String staff_name, String staff_password) {
        return webMapper.login(staff_name, staff_password);
    }

    @Override
    public void register(String staff_name_register, String staff_password_register, int role_register) {
        webMapper.register(staff_name_register, staff_password_register, role_register);
    }

    @Override
    public List<Staff> selectAllStaffOrderById() {
        return webMapper.selectAllStaffOrderById();
    }

    @Override
    public List<User> selectAllUserOrderById() {
        return webMapper.selectAllUserOrderById();
    }

    @Override
    public List<Staff> selectStaffById(int staff_id) {
        return webMapper.selectStaffById(staff_id);
    }

    @Override
    public void updateStaffInfo(int staff_id, String staff_name, String staff_password, int staff_role) {
        webMapper.updateStaffInfo(staff_id, staff_name, staff_password, staff_role);
    }

    @Override
    public void unbanUser(int user_id) {
        webMapper.unbanUser(user_id);
    }

    @Override
    public void banUser(int user_id) {
        webMapper.banUser(user_id);
    }

    @Override
    public List<SalesStatistics> salesStatisticsByDateRange(String beginDate, String endDate) {
        return webMapper.salesStatisticsByDateRange(beginDate, endDate);
    }

    @Override
    public List<SalesStatistics> salesStatisticsFull() {
        return webMapper.salesStatisticsFull();
    }

    @Override
    public List<BrowseStatistics> browseStatisticsFull() {
        return webMapper.browseStatisticsFull();
    }

    @Override
    public List<BrowseStatistics> browseStatisticsByDateRange(String beginDate, String endDate) {
        return webMapper.browseStatisticsByDateRange(beginDate, endDate);
    }

    @Override
    public List<OrderListObject> selectAllOrdersOrderById() {
        return webMapper.selectAllOrdersOrderById();
    }

    @Override
    public List<OrderListObject> searchAllOrdersByKey(int key) {
        return webMapper.searchAllOrdersByKey(key);
    }

    @Override
    public void deliver(int id) {
        webMapper.deliver(id);
    }

    @Override
    public Orders selectOrderById(int id) {
        return webMapper.selectOrderById(id);
    }

    @Override
    public void updateOrderInfo(int id, int order_id_update, String user_phone_update, int product_id_update, int store_id_update, int amount_update, double single_price_update, double total_price_update, int order_status_update) {
        webMapper.updateOrderInfo(id, order_id_update, user_phone_update, product_id_update, store_id_update, amount_update, single_price_update, total_price_update, order_status_update);
    }

    @Override
    public void managementLog(int staff_id, String action) {
        String time_stamp = new Timestamp(new Date().getTime()).toString();
        webMapper.managementLog(staff_id, action, time_stamp);
    }

    @Override
    public List<User> selectUserById(int id) {
        return webMapper.selectUserById(id);
    }

    @Override
    public void deleteStaffById(int staff_id) {
        webMapper.deleteStaffById(staff_id);
    }

    @Override
    public List<ManagementLog> selectAllLogOrderById() {
        return webMapper.selectAllLogOrderById();
    }

    @Override
    public List<ManagementLog> selectAllLogById(int id) {
        return webMapper.selectAllLogById(id);
    }
}