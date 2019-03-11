package com.Patrick.service.implement;

import com.Patrick.dao.CategoryMapper1;
import com.Patrick.dao.CategoryMapper2;
import com.Patrick.mapper.WebMapper;
import com.Patrick.service.CategoryAndGoodsService;

import com.alibaba.fastjson.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * created by 廖馨婷
 * CategoryAndGoodsServiceImpl: 对应商品和类别的实现
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@Service
public class CategoryAndGoodsServiceImpl implements CategoryAndGoodsService {
    @Autowired
    WebMapper webMapper;


    /**
     * @Description: 添加类别的函数
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/9
     */
    public int addNewCategory(String first_category, String second_category, String third_category) {
        int add_num = 0;
        add_num += webMapper.addCategoryMap12(first_category, second_category);
        add_num += webMapper.addCategoryMap23(second_category, third_category);
        return add_num;
    }

    /**
     * @Description: 更新类别，涉及判断更新的前提是第二映射更改的时候第一映射已经有了对应的数据重新插入语句
     * Param:
     * Return:
     * Author:廖馨婷
     * Date:2019/3/9
     */
    public String updateCategory(int map23Id, String first_category, String second_category, String third_category) {
        CategoryMapper2 old_categoryMapper23 = webMapper.getcategoryMapper2ById(map23Id);
        CategoryMapper1 old_categoryMapper12 = webMapper.getcategoryMapper1Bysecond_category(old_categoryMapper23.getFather_category());
        int updateFirstCategoryNum = 0;
        int updateSecondCategoryNum = 0;
        int updateThirdCategoryNum = 0;
        int addSecondCategoryNum = 0;
        int addFirstCategoryNum = 0;
//        检查和更新一级类别,如果新旧名称不一致就更新
        if (!first_category.equals(old_categoryMapper12.getFather_category())) {
            System.out.println("1 is diff!");
            int map12_num = webMapper.countFirstCategoryInMap12(old_categoryMapper12.getFather_category());
            if (map12_num == 1) {
                updateFirstCategoryNum = webMapper.updateFirstCategory(old_categoryMapper12.getFather_category(), first_category);
            } else {
                addFirstCategoryNum = webMapper.addCategoryMap12(first_category, second_category);
            }
        }
//        检查更新二级类别,需要注意的是如果二级类别只为一条23映射服务，那么只需更新，到但是如果有多条，则需添加12映射记录，然后更新23映射
        if (!second_category.equals(old_categoryMapper12.getSon_category())) {
            System.out.println("2 is diff!");
            int map23_num = webMapper.countSecondCategoryInMap23(old_categoryMapper23.getFather_category());
            System.out.println("map23_num: " + map23_num);
            if (map23_num == 0) {
                updateSecondCategoryNum = 0;
            } else if (map23_num == 1) {
                updateSecondCategoryNum = webMapper.updateSecondCategoryInMap12(old_categoryMapper12.getSon_category(), second_category);
                updateSecondCategoryNum += webMapper.updateSecondCategoryInMap23(old_categoryMapper23.getSon_category(), second_category);
            } else {
                updateSecondCategoryNum = webMapper.updateSecondCategoryInMap23(old_categoryMapper23.getSon_category(), second_category);
                addSecondCategoryNum = webMapper.addCategoryMap12(first_category, second_category);
            }
        }
        if (!third_category.equals(old_categoryMapper23.getSon_category())) {
            System.out.println("3 is diff!");
            updateThirdCategoryNum = webMapper.updateThirdCategory(old_categoryMapper23.getSon_category(), third_category);
        }
        Map change_results = new HashMap();
        change_results.put("up1", Integer.toString(updateFirstCategoryNum));
        change_results.put("up2", Integer.toString(updateSecondCategoryNum));
        change_results.put("up3", Integer.toString(updateThirdCategoryNum));
        change_results.put("ad2", Integer.toString(addFirstCategoryNum));
        change_results.put("ad2", Integer.toString(addSecondCategoryNum));
        JSONObject jsonObject = JSONObject.fromObject(change_results);
        return JSON.toJSONString(jsonObject);
    }

    public String deleteCategory(String first_category, String second_category, String third_category) {
        int map23_num = webMapper.countSecondCategoryInMap23(second_category);
        int result_num = 0;
        if (map23_num == 0) {
            result_num = 0;
        }
        if (map23_num == 1) {
            result_num += webMapper.deleteCategoryMap12(first_category, second_category);
            result_num += webMapper.deleteCategoryMap23(second_category, third_category);
        } else {
            result_num += webMapper.deleteCategoryMap23(second_category, third_category);
        }
        return JSON.toJSONString(result_num);
    }

    public CategoryMapper2 getcategoryMapper2ByThirdCategory(String product_third_category) {
        return webMapper.getcategoryMapper2ByThirdCategory(product_third_category);
    }

    public CategoryMapper1 getcategoryMapper1Bysecond_category(String product_second_category) {
        return webMapper.getcategoryMapper1Bysecond_category(product_second_category);
    }

    public String addNewProduct(int product_id, String product_name, String product_short_introduction, String product_details,
                                String product_first_category, String product_second_category, String product_third_category,
                                String url0, String url1, String urls2, String urls3,
                                String product_current_time, String product_update_time, String product_uint) {
        int add_num = webMapper.addProduct(product_id, product_name, product_short_introduction, product_details,
                product_first_category, product_second_category, product_third_category,
                url0, url1, urls2, urls3, product_current_time, product_update_time, product_uint);
        //url迭代的获取
        return JSON.toJSONString(add_num);
    }
}
