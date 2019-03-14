package com.Patrick.dao;

import java.sql.Time;

/**
 * created by 廖馨婷 on 2018.12.2
 * BranchStore: the information of the stores
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: testv11
 */
public class BranchStore {
    private int store_id;//PK
    private String store_name;
    private String store_tel;
    private String province;
    private String city;
    private String district;
    private String store_address;
    private double longitude;
    private double latitude;
    private String store_introduction;
//    private Time store_start_time;
//    private Time store_close_time;
    private String store_start_time;
    private String store_close_time;
    private int store_status;

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public String getStore_tel() {
        return store_tel;
    }

    public void setStore_tel(String store_tel) {
        this.store_tel = store_tel;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getStore_address() {
        return store_address;
    }

    public void setStore_address(String store_address) {
        this.store_address = store_address;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getStore_introduction() {
        return store_introduction;
    }

    public void setStore_introduction(String store_introduction) {
        this.store_introduction = store_introduction;
    }

    public String getStore_start_time() {
        return store_start_time;
    }

    public void setStore_start_time(String store_start_time) {
        this.store_start_time = store_start_time;
    }

    public String getStore_close_time() {
        return store_close_time;
    }

    public void setStore_close_time(String store_close_time) {
        this.store_close_time = store_close_time;
    }

    public int getStore_status() {
        return store_status;
    }

    public void setStore_status(int store_status) {
        this.store_status = store_status;
    }
}
