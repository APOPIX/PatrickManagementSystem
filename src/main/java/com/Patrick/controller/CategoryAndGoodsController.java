package com.Patrick.controller;

import com.Patrick.service.CategoryAndGoodsService;
import com.Patrick.utils.Upload;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

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
//#不知道文件上传是不是写在这里
//            uploadHost=PatrickManagementSystem_war_exploded/
//    imgPath=
//    @Value(value = "${imgPath}")
    private String imgPath="http://localhost:8080/";
//    @Value(value = "${uploadHost}")
    private String uploadHost="upload/";

    Upload uploader;
    @RequestMapping("addNewCategory.do")
    public String addNewCategory(@RequestBody JSONObject data){
        String first_category=data.getString("firstCategory");
        String second_category=data.getString("secondCategory");
        String third_category=data.getString("thirdCategory");
        System.out.println("我进入类别控制器添加类别函数，然后获取类别信息："+first_category+" "+second_category+" "+third_category);
        int add_num=categoryAndGoodsService.addNewCategory(first_category,second_category,third_category);
        return JSON.toJSONString(add_num);
    }
    @RequestMapping("updateCategory.do")
    public String updateCategory(@RequestBody JSONObject data)
    {
        String first_category=data.getString("firstCategory");
        String second_category=data.getString("secondCategory");
        String third_category=data.getString("thirdCategory");
        int map23Id=data.getIntValue("id");
        System.out.println("my id："+map23Id);
//        System.out.println("我进入类别控制器更新类别函数，然后获取类别信息："+first_category+" "+second_category+" "+third_category);
        String handleResult=categoryAndGoodsService.updateCategory(map23Id,first_category,second_category,third_category);
        return handleResult;
    }
    @RequestMapping("deleteCategory.do")
    public String deleteCategory(@RequestBody JSONObject data){
        String first_category=data.getString("firstCategory");
        String second_category=data.getString("secondCategory");
        String third_category=data.getString("thirdCategory");
        System.out.println("我进入类别控制器删除类别函数，然后获取类别信息："+first_category+" "+second_category+" "+third_category);
        String handleResult=categoryAndGoodsService.deleteCategory(first_category,second_category,third_category);
        return handleResult;
    }
    @RequestMapping(value="addProduct.do")
    @ResponseBody
    public String addProduct(HttpServletRequest request, @RequestParam("files") MultipartFile file) throws IOException {
        System.out.println("我进入了添加商品的控制类");
        String third_category = request.getParameter("third_category");
        System.out.println("I got the third category:"+third_category);
        File toFile = null;
//        for(MultipartFile file : files){
            if (file.equals("") || file.getSize() <= 0) {
                file = null;
            } else {
                InputStream ins = null;
                ins = file.getInputStream();
                toFile = new File("F:\\"+file.getOriginalFilename());
                inputStreamToFile(ins, toFile);
                ins.close();
            }
//        }


//        System.out.println(userName);

        return "file";
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
//    @RequestMapping(value="addProduct.do")
//    @ResponseBody
//    public String addProduct(HttpServletRequest request, @RequestParam("files") MultipartFile[] files){
//        System.out.println("我进入了添加商品的控制类");
//        String product_id_str=request.getParameter("id");
//        int product_id=Integer.parseInt(product_id_str);
//        String product_name=request.getParameter("name");
//        String product_details=request.getParameter("details");
//        String product_short_introduction=request.getParameter("short_introduction");
//        String product_uint=request.getParameter("uint");
//        String product_third_category=request.getParameter("third_category");
//        String product_current_time=request.getParameter("current_time");
//        CategoryMapper2 categorymap23 = categoryAndGoodsService.getcategoryMapper2ByThirdCategory(product_third_category);
//        CategoryMapper1 categorymap12 = categoryAndGoodsService.getcategoryMapper1Bysecond_category(categorymap23.getFather_category());
//
//        List<String> urls = new ArrayList<>();
//        List<String> fileNameList = new ArrayList<>();
//        List<String> relaPathList = new ArrayList<>();
//        List<String> realPathList = new ArrayList<>();
//        net.sf.json.JSONObject jo = new net.sf.json.JSONObject();
//        Client client = new Client();
//        try {
//            for (MultipartFile file : files) {
////            String ext = StringUtils.substring(file.getOriginalFilename(), file.getOriginalFilename().lastIndexOf("."));
////            String filepath= UUID.randomUUID().toString()+ext;
//                System.out.println("我进入了上传文件的地方！");
//                String upload_info = uploader.upload(client, file, uploadHost, imgPath);
////            System.out.println(upload_num);
//                //明天研究文件保存的方式
//                if (!"".equals(upload_info)) {
//                    String[] infoList = upload_info.split(";");
//                    fileNameList.add(infoList[0]);
//                    relaPathList.add(infoList[1]);
//                    realPathList.add(infoList[2]);
//                } else {    //上传失败
//                    fileNameList.add("");
//                    relaPathList.add("");
//                    realPathList.add("");
//                }
//                jo.put("success", 1);
//                jo.put("error", null);
//                jo.put("fileNameList", fileNameList);
//                jo.put("relaPathList", relaPathList);
//                jo.put("realPathList", realPathList);
//                urls = realPathList;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            jo.put("success", 0);
//            jo.put("error", " 上传失败！");
//        }
//        if (urls.size() < 4) {
//            for (int i = 3; i > urls.size(); i++) {
//                urls.add(i, "");
//            }
//            //如果不满足的话，用空字符串代替，否则插入的时候仅仅用前4张的url字符串
//        }
//
//
//        String uploadFeedback= categoryAndGoodsService.addNewProduct(product_id, product_name,product_short_introduction,product_details,
//                categorymap12.getFather_category(),categorymap12.getSon_category(),product_third_category,
//                urls.get(0), urls.get(1), urls.get(2), urls.get(3), product_current_time, product_current_time, product_uint);
//        jo.put("add_num",uploadFeedback);
//        return JSON.toJSONString(jo);
//    }
//}
