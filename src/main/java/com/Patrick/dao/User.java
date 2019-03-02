package com.Patrick.dao;

/**
 * created by 廖馨婷 on 2018.12.2
 * User: for entity
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: testv10
 */
public class User {
    private String staff_password;
    private int staff_id;
    private int role;
//    和数据库中的表格对应


    public String getStaff_password() {
        return staff_password;
    }

    public void setStaff_password(String staff_password) {
        this.staff_password = staff_password;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
