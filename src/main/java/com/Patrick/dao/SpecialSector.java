package com.Patrick.dao;

/**
 * created by 廖馨婷 on 2018.12.2
 * SpecialSector: 特殊商品模块的创建
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: testv11
 */
public class SpecialSector {
    private int id; //PK 数据库里是id
    private String sector_name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSector_name() {
        return sector_name;
    }

    public void setSector_name(String sector_name) {
        this.sector_name = sector_name;
    }
}
