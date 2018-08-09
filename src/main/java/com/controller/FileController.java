package com.controller;

import com.model.db.DBUtils;
import com.model.services.FileIdServices;
import com.model.services.FilePathServices;
import com.model.services.FileServices;
import com.model.tools.file.FileOperations;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequestMapping("/file")
@RestController
public class FileController {
    /**
     * @param file       文件本身
     * @param filePathId 文件夹id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    public String singleUpload(@RequestParam("file") MultipartFile file,
                               @RequestParam("path") String filePathId,
                               HttpServletRequest request
    ) throws Exception {
        String account=request.getSession().getAttribute("u_account").toString();
        String extName = file.getOriginalFilename().split("\\.")[1];
        String fileName = file.getOriginalFilename();
        String[] filenames=fileName.split("\\\\");
        fileName=filenames[filenames.length-1];
        long fileSize = file.getSize();
        byte[] bytes = null;
        try {
            bytes = file.getBytes();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, String> fileInfo = new FileOperations().uploadFile(bytes, extName, account);
        if (fileInfo != null) {
            try {
                String id = new FileIdServices().getId();
                FileServices fileServices = new FileServices();
                int fileType= com.model.tools.file.FileUtils.getFileType(extName);
                Boolean success=fileServices.addFile(id,fileName, 1, filePathId, fileType, fileSize, account);
                if(success){
                    new FilePathServices().addPath(id, fileInfo.get("group"), extName, fileInfo.get("path"));
                }
                List<Map<String, String>> fileInfos = (List<Map<String, String>>) request.getSession().getAttribute("fileInfos");
                if (fileInfos == null) {
                    fileInfos = new ArrayList<>();
                }

                fileInfos.add(fileServices.queryFileInfo(id));
                request.getSession().setAttribute("fileInfos", fileInfos);
                System.out.println(fileInfos);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "status:success";
    }

    /**
     * 多个文件上传功能
     *
     * @param files   多个文件
     * @param request
     * @return
     * @throws Exception
     * @throws IOException
     */
    @RequestMapping("/BatchUpload")
    public String BatchUpload(@RequestParam("files") MultipartFile[] files, HttpServletRequest request) {
        String filePath = request.getServletContext().getRealPath("upload");
        System.out.println("----------------------" + filePath + "------------------------");
        List<String> path = new ArrayList<>();
        List<String> fullPath = new ArrayList<>();
        for (MultipartFile file : files) {
            String filename = file.getOriginalFilename();
            File targetFile = new File(filePath, filename);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            // 保存
            try {
                file.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            /* String path1 = "upload/" + filename;
             String path2 = targetFile.getPath();*/
            path.add("upload/" + filename);
            fullPath.add(targetFile.getPath());
        }

        return "/success";
    }


    @RequestMapping(value = "/download", method = RequestMethod.POST)
    public ResponseEntity<byte[]> download(@RequestParam("fileId") String fileId) throws Exception {
        Map<String, String> pathInfo=null;
        Map<String, String> fileInfo = null;
        try {
            pathInfo= new FilePathServices().queryPath(fileId);
            fileInfo=new FileServices().queryFileInfo(fileId);
        }catch (Exception e){
            e.printStackTrace();
        }

        String group = pathInfo.get("f_group");
        String path = pathInfo.get("f_path");
        String fileName=fileInfo.get("f_name");
        byte[] body;
        body = new FileOperations().downloadFile(group, path);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment;filename=" + fileName);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<>(body, headers, statusCode);
        return entity;
    }

    @RequestMapping(value = "/delete")
    public Object delete(@RequestParam("fileId")String fileId,HttpServletRequest request){
        String account= (String) request.getSession().getAttribute("u_account");
        boolean state=false;
        JSONObject result=new JSONObject();
        try{
            state=new FileServices().deleteFile(fileId);
            List<Map<String, String>> file = new FileServices().queryFileByUser(account);
            request.getSession().setAttribute("fileInfos",file);
            System.out.println(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(state){
            result.put("status","success");
        }else {
            result.put("status","fail");
        }
        return result.toString();
    }

    @RequestMapping(value = "/recycle")
    public Object delete(HttpServletRequest request){
        String account= (String) request.getSession().getAttribute("u_account");
        List<Map<String, String>> file=null;
        JSONObject result=new JSONObject();
        try{
            file = new FileServices().queryFileDel(account);
            request.getSession().setAttribute("recycleInfos",file);
            System.out.println(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(file!=null){
            result.put("status","success");
        }else {
            result.put("status","fail");
        }
        return result.toString();
    }

//    @RequestMapping(value = "/addFolder")
//    public Object addFolder(@RequestParam("parentId") String pid, HttpServletRequest request) {
//        JSONObject result = new JSONObject();
//        String account = (String) request.getSession().getAttribute("u_account");
//        Boolean state=false;
//        try {
//            String id = new FileIdServices().getId();
//            FileServices fileServices = new FileServices();
//            state=fileServices.addFile("新建文件夹", 1, pid, 0, 0, account);
//            if(state){
//                List<Map<String, String>> file = (List<Map<String, String>>) request.getSession().getAttribute("fileInfos");
//                file.add(fileServices.queryFileInfo(id));
//                request.getSession().setAttribute("fileInfos",file);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        if(state){
//            result.put("status", "success");
//        } else {
//            result.put("status", "fail");
//        }
//        return result.toString();
//    }

}
