package com.Patrick.service;

import com.Patrick.dao.Staff;

import java.util.List;

public interface WebService {

    List<Staff> login(String staff_name, String staff_password);
    void register(String staff_name_register, String staff_password_register, int role_register);
    List<Staff> selectAllStaffOrderById();
}
