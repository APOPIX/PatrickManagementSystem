package com.Patrick.utils;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 上传文件工具类
 * @author libo
 */
public class Upload {

    /**
     * 上传文件
     * @param request
     * @param response
     * @param serverPath    服务器地址:(http://172.16.5.102:8090/)
     * @param path             文件路径（不包含服务器地址：upload/）
     * @return
     */
    public static String upload(Client client, MultipartFile file, String serverPath, String path){
//        HttpServletRequest request,HttpServletResponse response,              都是没有使用的参数
        // 文件名称生成策略（UUID uuid = UUID.randomUUID()）
        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String formatDate = format.format(d);
        String str = "";
        for(int i=0 ;i <5; i++){
            int n = (int)(Math.random()*90)+10;
            str += n;
        }
        // 获取文件的扩展名
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        // 文件名
        String fileName = formatDate + str + "." + extension;
        //相对路径
        String relaPath = path + fileName;

        String a = serverPath + path.substring(0, path.lastIndexOf("/"));
        File file2 = new File(a);
        if(!file2.exists()){
            boolean mkdirs = file2.mkdirs();
            System.out.println(mkdirs);
        }

        // 另一台tomcat的URL（真实路径）
        String realPath = serverPath + relaPath;
        // 设置请求路径
        WebResource resource = client.resource(realPath);

        // 发送开始post get put（基于put提交）
        try {
            resource.put(String.class, file.getBytes());
            return fileName+";"+relaPath+";"+realPath;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * 删除文件
     * @param filePath（文件完整地址：http://172.16.5.102:8090/upload/1234.jpg）
     * @return
     */
    public static String delete(String filePath){
        try {
            Client client = new Client();
            WebResource resource = client.resource(filePath);
            resource.delete();
            return "y";
        } catch (Exception e) {
            e.printStackTrace();
            return "n";
        }
    }
}