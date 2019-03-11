package com.Patrick.service.implement;

import com.Patrick.dao.*;
import com.Patrick.mapper.WebMapper;
import com.Patrick.service.WebService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service
public class WebServiceImpl implements WebService {
    @Autowired
    WebMapper webMapper;


    @Override
    public List<Staff> login(String staff_name, String staff_password) {
        return webMapper.login(staff_name, staff_password);
    }

    @Override
    public void register(String staff_name_register, String staff_password_register, int role_register) {
        webMapper.register(staff_name_register, staff_password_register, role_register);
    }

    @Override
    public List<Staff> selectAllStaffOrderById() {
        return webMapper.selectAllStaffOrderById();
    }

    @Override
    public List<User> selectAllUserOrderById() {
        return webMapper.selectAllUserOrderById();
    }

    @Override
    public List<Staff> selectStaffById(int staff_id) {
        return webMapper.selectStaffById(staff_id);
    }

    @Override
    public void updateStaffInfo(int staff_id, String staff_name, String staff_password, int staff_role) {
        webMapper.updateStaffInfo(staff_id, staff_name, staff_password, staff_role);
    }

    @Override
    public void unbanUser(int user_id) {
        webMapper.unbanUser(user_id);
    }

    @Override
    public void banUser(int user_id) {
        webMapper.banUser(user_id);
    }

    @Override
    public List<SalesStatistics> salesStatisticsByDateRange(String beginDate, String endDate) {
        return webMapper.salesStatisticsByDateRange(beginDate, endDate);
    }

    @Override
    public List<SalesStatistics> salesStatisticsFull() {
        return webMapper.salesStatisticsFull();
    }

    @Override
    public List<BrowseStatistics> browseStatisticsFull() {
        return webMapper.browseStatisticsFull();
    }

    @Override
    public List<BrowseStatistics> browseStatisticsByDateRange(String beginDate, String endDate) {
        return webMapper.browseStatisticsByDateRange(beginDate, endDate);
    }

    @Override
    public List<OrderListObject> selectAllOrdersOrderById() {
        return webMapper.selectAllOrdersOrderById();
    }

    @Override
    public List<OrderListObject> searchAllOrdersByKey(int key) {
        return webMapper.searchAllOrdersByKey(key);
    }

    @Override
    public void deliver(int id) {
        webMapper.deliver(id);
    }

    @Override
    public Orders selectOrderById(int id) {
        return webMapper.selectOrderById(id);
    }

    @Override
    public void updateOrderInfo(int id, int order_id_update, String user_phone_update, int product_id_update, int store_id_update, int amount_update, double single_price_update, double total_price_update, int order_status_update) {
        webMapper.updateOrderInfo(id, order_id_update, user_phone_update, product_id_update, store_id_update, amount_update, single_price_update, total_price_update, order_status_update);
    }

    @Override
    public void managementLog(int staff_id, String action) {
        //转换时区
        String time_stamp = new Timestamp(new Date().getTime() - 1000 * 60 * 60 * 8).toString();
        webMapper.managementLog(staff_id, action, time_stamp);
    }

    @Override
    public List<User> selectUserById(int id) {
        return webMapper.selectUserById(id);
    }

    @Override
    public void deleteStaffById(int staff_id) {
        webMapper.deleteStaffById(staff_id);
    }

    @Override
    public List<ManagementLog> selectAllLogOrderById() {
        return webMapper.selectAllLogOrderById();
    }

    @Override
    public List<ManagementLog> selectAllLogById(int id) {
        return webMapper.selectAllLogById(id);
    }

    @Override
    public List<SalesRanking> selectTopTenSalesRanking(String begin_date, String end_date) {
        return webMapper.selectTopTenSalesRanking(begin_date, end_date);
    }
    ////////////////////////////////////////Xenia//////////////////////////////////////
    /**
     *@Description:sevice 层面实现获取门店信息
     *Param:
     *Return: 返回门店信息的列表
     *Author:廖馨婷
     *Date:2019/3/2
     */
    @Override
    public List<BranchStore> getBranchStore(){
        return webMapper.getBranchStore();
    }

    /**
     *@Description: 获取门店和对应商品的注册信息
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/5
     */
    @Override
    public List<ProductToStore> getProductsRegistedInStore(){
        return webMapper.getProductsRegistedInStore();
    }

    @Override
    public List<SpecialProduct> getProductsForSector(){
        return webMapper.getProductsForSector();
    }

    @Override
    public List<SpecialSector> getSectors(){
        return webMapper.getSectors();
    }
    @Override
    public List<Product> getProducts(){
        return webMapper.getProducts();
    }

    /**
     *@Description: 实现类别和商品页面的数据获取的代码
     *Param:
     *Return:
     *Author:廖馨婷
     *Date:2019/3/7
     */
    @Override
    public List<CategoriesMapper> getCategoriesMapper(){
        return webMapper.getCategoriesMappers();
    }

//    @Override
//    public JSONObject getCategoriesMapperJson(){
//        List<CategoryMapper1> firstMapping=webMapper.getcategoryMapper1();
//        List<CategoryMapper2> secondMapping=webMapper.getcategoryMapper2();
//        Map tempFirstParam=new HashMap();
//        List<Map> firstMappingLists;
//        Map tempSecondParam=new HashMap();
//        for(CategoryMapper1 mapper1: firstMapping){
//            firstMappingLists=new ArrayList<>();
//            Map tempThirdParam=new HashMap();
//            //面对的是同一个二级目录，获取的都会存在在id，三级映射过程中
//            for(CategoryMapper2 mapper2: secondMapping){
//                if(mapper1.getSon_category().equals(mapper2.getFather_category())){
//                    tempThirdParam.put(Integer.toString(mapper2.getId()),mapper2.getSon_category());
//                    //在这儿获取到三级对应的类别消息，然后将二三级映射的id和三级类别名称获取得到
//                    tempSecondParam.put(mapper1.getSon_category(),tempThirdParam);
//                    //这里用二级类别作为key然后23映射的id和三级目录,技巧是利用了key一定的时候kv会被刷新
//                }
//            }
//            System.out.println("二三级映射的列表："+JSONObject.fromObject(tempSecondParam).toString());
////            firstMappingLists.add(tempSecondParam);//所有相同的二级映射构成一个数组，作为特定一级类别的value
////            tempFirstParam.put(mapper1.getFather_category(),firstMappingLists);
//
//            if(tempFirstParam.containsKey(mapper1.getFather_category())){
//                firstMappingLists.add(tempSecondParam);
//                tempFirstParam.put(mapper1.getFather_category(),firstMappingLists);
//            }else{
//                firstMappingLists=new ArrayList<>();
//                firstMappingLists.add(tempSecondParam);
//                tempFirstParam.put(mapper1.getFather_category(),firstMappingLists);
//            }
//        }
//        JSONObject jsonObject= JSONObject.fromObject(tempFirstParam);
//        System.out.println(jsonObject.toString());
////        String jsonString = jsonObject.toString();
////        System.out.println("我获取了json： "+jsonString);
////        JsonFileGenerator.createJsonFile(jsonString,"F:/json","test");
////        这句话用于利用util类获取商品类别的json，然后打印成json文件
//        return jsonObject;
//    }

    @Override
    public JSONObject getCategoriesMapperJson(){
        List<CategoryMapper1> firstMapping=webMapper.getcategoryMapper1();
        List<CategoryMapper2> secondMapping=webMapper.getcategoryMapper2();
        Map tempFirstParam=new HashMap();
        List<Map> mysecondMapping=new ArrayList<>();
        for(CategoryMapper1 mapper1: firstMapping){
            Map tempSecondParam=new HashMap();
            Map tempThirdParam=new HashMap();
            for(CategoryMapper2 mapper2: secondMapping){
                if(mapper1.getSon_category().equals(mapper2.getFather_category())){
                    tempThirdParam.put(Integer.toString(mapper2.getId()),mapper2.getSon_category());
                    tempSecondParam.put(mapper1.getSon_category(),tempThirdParam);
//                    获取了三级目录的数组
                }
            }
            if(tempFirstParam.containsKey(mapper1.getFather_category())){
                mysecondMapping=(List)tempFirstParam.get(mapper1.getFather_category());
                mysecondMapping.add(tempSecondParam);
                tempFirstParam.put(mapper1.getFather_category(),mysecondMapping);
            }else{
                mysecondMapping=new ArrayList<>();
                mysecondMapping.add(tempSecondParam);
                tempFirstParam.put(mapper1.getFather_category(),mysecondMapping);
            }

        }
        JSONObject jsonObject= JSONObject.fromObject(tempFirstParam);
//        String jsonString = jsonObject.toString();
//        System.out.println("我获取了json： "+jsonString);
//        JsonFileGenerator.createJsonFile(jsonString,"F:/json","test");
//        这句话用于利用util类获取商品类别的json，然后打印成json文件
        return jsonObject;
    }
    //////////////////////////////////////Xenia//////////////////////////////////////
}