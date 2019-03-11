package com.Patrick.service;

import com.Patrick.dao.CategoryMapper1;
import com.Patrick.dao.CategoryMapper2;

public interface CategoryAndGoodsService {
   int addNewCategory(String first_category, String second_category, String third_category);
   String updateCategory(int map23Id, String first_category, String second_category, String third_category);
   String deleteCategory(String first_category, String second_category, String third_category);
   public String addNewProduct(int product_id, String product_name, String product_short_introduction, String product_details,
                               String product_first_category, String product_second_category, String product_third_category,
                               String url0, String url1, String urls2, String urls3,
                               String product_current_time, String product_update_time, String product_uint);
   CategoryMapper1 getcategoryMapper1Bysecond_category(String product_second_category);
   CategoryMapper2 getcategoryMapper2ByThirdCategory(String product_third_category);

   }
