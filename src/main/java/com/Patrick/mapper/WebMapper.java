package com.Patrick.mapper;

import com.Patrick.dao.Staff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WebMapper {
    //将"String"类型的变量"staff_name"和"staff_password"以"staff_name"和"staff_password"为参数名传入到WebMapper.xml中
    List<Staff> login(@Param(value = "staff_name") String staff_name, @Param(value = "staff_password") String staff_password);

    //将"String"类型的变量"staff_name_register"、"staff_password_register"、"role_register"以"staff_name_register"、"staff_password_register"、"role_register"为参数名传入到WebMapper.xml中
    void register(@Param(value = "staff_name_register") String staff_name_register, @Param(value = "staff_password_register") String staff_password_register, @Param(value = "role_register") int role_register);

    //无传入参数
    List<Staff> selectAllStaffOrderById();
}
