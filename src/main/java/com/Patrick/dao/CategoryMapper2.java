package com.Patrick.dao;

/**
 * created by 廖馨婷
 * CategoryMapper2: 第二级目录和第三级之间的映射
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
public class CategoryMapper2 {
    private int id; //PK
    private String father_category;
    private String son_categoory;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFather_category() {
        return father_category;
    }

    public void setFather_category(String father_category) {
        this.father_category = father_category;
    }

    public String getSon_categoory() {
        return son_categoory;
    }

    public void setSon_categoory(String son_categoory) {
        this.son_categoory = son_categoory;
    }
}
