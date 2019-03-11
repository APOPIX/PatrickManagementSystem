package com.Patrick.dao;

import java.sql.Time;

/**
 * created by 廖馨婷 on 2018.12.2
 * Good: record goods on sale
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: testv11
 */
public class Product {
    private int id; //PK

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getFirst_category() {
        return first_category;
    }

    public void setFirst_category(String first_category) {
        this.first_category = first_category;
    }

    public String getSecond_category() {
        return second_category;
    }

    public void setSecond_category(String second_category) {
        this.second_category = second_category;
    }

    public String getThird_category() {
        return third_category;
    }

    public void setThird_category(String third_category) {
        this.third_category = third_category;
    }

    public String getProduct_brief_introduction() {
        return product_brief_introduction;
    }

    public void setProduct_brief_introduction(String product_brief_introduction) {
        this.product_brief_introduction = product_brief_introduction;
    }

    public String getProduct_detail() {
        return product_detail;
    }

    public void setProduct_detail(String product_detail) {
        this.product_detail = product_detail;
    }

    public String getPic1_url() {
        return pic1_url;
    }

    public void setPic1_url(String pic1_url) {
        this.pic1_url = pic1_url;
    }

    public String getPic2_url() {
        return pic2_url;
    }

    public void setPic2_url(String pic2_url) {
        this.pic2_url = pic2_url;
    }

    public String getPic3_url() {
        return pic3_url;
    }

    public void setPic3_url(String pic3_url) {
        this.pic3_url = pic3_url;
    }

    public String getPic4_url() {
        return pic4_url;
    }

    public void setPic4_url(String pic4_url) {
        this.pic4_url = pic4_url;
    }

    public Time getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Time create_time) {
        this.create_time = create_time;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    private String product_name;
    private String first_category;
    private String second_category;
    private String third_category;
    private String product_brief_introduction;
    private String product_detail;
    private String pic1_url;
    private String pic2_url;
    private String pic3_url;
    private String pic4_url;
    private Time create_time;

    public Time getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Time update_time) {
        this.update_time = update_time;
    }

    private Time update_time;
    private String unit;

}
