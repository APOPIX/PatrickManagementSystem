package com.Patrick.dao;

/**
 * created by 廖馨婷 on 2018.12.2
 * SpecialProduct: 对应特殊模块的商品
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: testv11
 */
public class SpecialProduct {
    private int sectorId; //PK 数据库里是id
    private String sector_name;
    private int product_id;

    public int getSectorId() {
        return sectorId;
    }

    public void setSectorId(int sectorId) {
        this.sectorId = sectorId;
    }

    public String getSector_name() {
        return sector_name;
    }

    public void setSector_name(String sector_name) {
        this.sector_name = sector_name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }
}
