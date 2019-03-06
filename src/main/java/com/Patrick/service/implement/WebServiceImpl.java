package com.Patrick.service.implement;

import com.Patrick.dao.*;
import com.Patrick.mapper.WebMapper;
import com.Patrick.service.WebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public Staff selectStaffById(int staff_id) {
        return webMapper.selectStaffById(staff_id).get(0);
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
    public List<Orders> selectAllOrdersOrderById() {
        return webMapper.selectAllOrdersOrderById();
    }

    @Override
    public List<Orders> searchAllOrdersByKey(String key) {
        return webMapper.searchAllOrdersByKey(key);
    }
}