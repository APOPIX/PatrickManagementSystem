package com.Patrick.dao;

/**
 * created by 廖馨婷
 * ProductToStore: 用于商品和门店对应的表格
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
public class ProductToStore {
    private int id;
    private int store_id;
    private int product_id;
    private int inventory;
    private double original_price;
    private double discount;
    private int product_status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public double getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(double original_price) {
        this.original_price = original_price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getProduct_status() {
        return product_status;
    }

    public void setProduct_status(int product_status) {
        this.product_status = product_status;
    }
}
