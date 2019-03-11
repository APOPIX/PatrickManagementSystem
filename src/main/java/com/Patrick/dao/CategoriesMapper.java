package com.Patrick.dao;

/**
 * created by 廖馨婷
 * CategoriesMapper: 用于记三级目录之间的映射关系
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
public class CategoriesMapper {
    private int first_id;
    private int second_id;
    private String firstCategory;
    private String secondCategory;
    private String thirdCategory;

    public int getFirst_id() {
        return first_id;
    }

    public void setFirst_id(int first_id) {
        this.first_id = first_id;
    }

    public int getSecond_id() {
        return second_id;
    }

    public void setSecond_id(int second_id) {
        this.second_id = second_id;
    }

    public String getFirstCategory() {
        return firstCategory;
    }

    public void setFirstCategory(String firstCategory) {
        this.firstCategory = firstCategory;
    }

    public String getSecondCategory() {
        return secondCategory;
    }

    public void setSecondCategory(String secondCategory) {
        this.secondCategory = secondCategory;
    }

    public String getThirdCategory() {
        return thirdCategory;
    }

    public void setThirdCategory(String thirdCategory) {
        this.thirdCategory = thirdCategory;
    }

//    public CategoriesMapper(int first_id, int second_id, String firstCategory, String secondCategory, String thirdCategory) {
//        this.first_id = first_id;
//        this.second_id = second_id;
//        this.firstCategory = firstCategory;
//        this.secondCategory = secondCategory;
//        this.thirdCategory = thirdCategory;
//    }
}
