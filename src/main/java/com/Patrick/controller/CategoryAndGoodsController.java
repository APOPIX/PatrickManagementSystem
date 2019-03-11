package com.Patrick.controller;

import com.Patrick.dao.CategoryMapper1;
import com.Patrick.dao.CategoryMapper2;
import com.Patrick.service.CategoryAndGoodsService;
import com.Patrick.service.WebService;
import com.Patrick.utils.Upload;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * created by 廖馨婷
 * CategoryAndGoodsController: 用于作为商品类别和商品注册的controller
 *
 * @author 廖馨婷
 * @version 1.0
 * @program: PatrickManagementSystem
 */
@RestController
@RequestMapping("/categoryAndGoods")
public class CategoryAndGoodsController {
    @Autowired
    CategoryAndGoodsService categoryAndGoodsService;
    @Autowired//此注解使得接口"WebService"得以实例化
            WebService webService;
    //#不知道文件上传是不是写在这里
//            uploadHost=PatrickManagementSystem_war_exploded/
//    imgPath=
//    @Value(value = "${imgPath}")
    private String imgPath = "http://localhost:8080/";
    //    @Value(value = "${uploadHost}")
    private String uploadHost = "upload/";

    Upload uploader;

    @RequestMapping("addNewCategory.do")
    public String addNewCategory(@RequestBody JSONObject data, HttpServletRequest request) {
        String first_category = data.getString("firstCategory");
        String second_category = data.getString("secondCategory");
        String third_category = data.getString("thirdCategory");
        System.out.println("我进入类别控制器添加类别函数，然后获取类别信息：" + first_category + " " + second_category + " " + third_category);
        int add_num = categoryAndGoodsService.addNewCategory(first_category, second_category, third_category);
        //插入操作记录
        String log = "获取类别信息：" + first_category + " " + second_category + " " + third_category;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return JSON.toJSONString(add_num);
    }

    @RequestMapping("updateCategory.do")
    public String updateCategory(@RequestBody JSONObject data, HttpServletRequest request) {
        String first_category = data.getString("firstCategory");
        String second_category = data.getString("secondCategory");
        String third_category = data.getString("thirdCategory");
        int map23Id = data.getIntValue("id");
        System.out.println("my id：" + map23Id);
//        System.out.println("我进入类别控制器更新类别函数，然后获取类别信息："+first_category+" "+second_category+" "+third_category);
        //插入操作记录
        String log = "更新类别信息：" + first_category + " " + second_category + " " + third_category;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return categoryAndGoodsService.updateCategory(map23Id, first_category, second_category, third_category);
    }

    @RequestMapping("deleteCategory.do")
    public String deleteCategory(@RequestBody JSONObject data, HttpServletRequest request) {
        String first_category = data.getString("firstCategory");
        String second_category = data.getString("secondCategory");
        String third_category = data.getString("thirdCategory");
        System.out.println("我进入类别控制器删除类别函数，然后获取类别信息：" + first_category + " " + second_category + " " + third_category);
        //插入操作记录
        String log = "删除类别信息：" + first_category + " " + second_category + " " + third_category;
        webService.managementLog((Integer) request.getSession().getAttribute("current_login_staff_id"), log);
        return categoryAndGoodsService.deleteCategory(first_category, second_category, third_category);
    }


    @RequestMapping(value = "addProduct.do")
    @ResponseBody
    public String addProduct(HttpServletRequest request, @RequestParam("file0") MultipartFile file0, @RequestParam("file1")
            MultipartFile file1, @RequestParam("file2") MultipartFile file2, @RequestParam("file3") MultipartFile file3) throws IOException {
        System.out.println("我进入了添加商品的控制类");
        String product_id_str = request.getParameter("id");
        int product_id = Integer.parseInt(product_id_str);
        String product_name = request.getParameter("name");
        String product_details = request.getParameter("details");
        String product_short_introduction = request.getParameter("short_introduction");
        String product_unit = request.getParameter("unit");
        String product_third_category = request.getParameter("third_category");
        String product_current_time = request.getParameter("current_time");
        String product_current_date=request.getParameter("current_date");
        System.out.println("获取的时间："+product_current_time);
        int hr=0;
        int hrIndex=product_current_time.indexOf(':');
        if(product_current_time.contains("下")){
            hr=Integer.parseInt(product_current_time.substring(product_current_time.indexOf('午')+1,hrIndex));
            product_current_time=(hr+12)+product_current_time.substring(hrIndex);
        }else{
            product_current_time=product_current_time.substring(product_current_time.indexOf('午')+1);
        }
        String processed_current_time=product_current_date+" "+product_current_time;
        CategoryMapper2 categorymap23 = categoryAndGoodsService.getcategoryMapper2ByThirdCategory(product_third_category);
        CategoryMapper1 categorymap12 = categoryAndGoodsService.getcategoryMapper1Bysecond_category(categorymap23.getFather_category());

        MultipartFile files[] = {file0, file1, file2, file3};
        List<String> urls = new ArrayList<>();
        List<String> fileNameList = new ArrayList<>();
        List<String> relaPathList = new ArrayList<>();
        List<String> realPathList = new ArrayList<>();
        net.sf.json.JSONObject jo = new net.sf.json.JSONObject();
        File toFile = null;
        int photos_num = Integer.parseInt(request.getParameter("diffPhotos"));
        for (int i = 0; i < photos_num; i++) {
            System.out.println("至少我是进入循环了的！");
            if (files[i].equals("") || files[i].getSize() <= 0) {
                files[i] = null;
                fileNameList.add("");
                relaPathList.add("");
                realPathList.add("");
            } else {
                System.out.println("我处理了" + files[i].getOriginalFilename());
                InputStream ins = null;
                ins = files[i].getInputStream();
                String ext = StringUtils.substring(files[i].getOriginalFilename(), files[i].getOriginalFilename().lastIndexOf("."));
                String filepath = UUID.randomUUID().toString() + ext;
                String loadPath = "C:\\\\PatrickAdminUploadFolder\\" + filepath;
                toFile = new File(loadPath);
                if(!toFile.getParentFile().exists()){
                    toFile.getParentFile().mkdirs();
                }
                inputStreamToFile(ins, toFile);
                ins.close();
                fileNameList.add(files[i].getOriginalFilename());
                relaPathList.add(filepath);
//                loadPath=loadPath.replaceAll("/","\\\\");
                realPathList.add(loadPath);
            }
            jo.put("success", 1);
            jo.put("error", null);
            jo.put("fileNameList", fileNameList);
            jo.put("relaPathList", relaPathList);
            jo.put("realPathList", realPathList);
            urls.addAll(realPathList);
        }
        if (urls.size() < 4) {
            for (int i = 3; i >=urls.size(); i--) {
                urls.add(i, "");
//                urls.add("");
            }
            //如果不满足的话，用空字符串代替，否则插入的时候仅仅用前4张的url字符串
        }
        String uploadFeedback = categoryAndGoodsService.addNewProduct(product_id, product_name, product_short_introduction, product_details,
                categorymap12.getFather_category(), categorymap12.getSon_category(), product_third_category,
                urls.get(0), urls.get(1), urls.get(2), urls.get(3), processed_current_time, processed_current_time, product_unit);
        jo.put("add_num", uploadFeedback);
        return JSONObject.toJSONString(jo);
    }

    public static void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

