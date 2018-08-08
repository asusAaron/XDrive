package com.controller;

import com.model.db.DBUtils;
import com.model.services.FileIdServices;
import com.model.services.FilePathServices;
import com.model.services.FileServices;
import com.model.tools.file.FileOperations;
import org.apache.commons.io.FileUtils;
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
     * @param account    用户id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    public String singleUpload(@RequestParam("file") MultipartFile file,
                               @RequestParam("path") String filePathId,
                               @RequestParam("account") String account,
                               HttpServletRequest request
    ) throws Exception {
        String extName = file.getOriginalFilename().split("\\.")[1];
        String fileName = file.getOriginalFilename();
        long fileSize = file.getSize();
        byte[] bytes = null;
        try {
            bytes = file.getBytes();
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, String> fileInfo = new FileOperations().uploadFile(bytes, extName, "zzs");
        if (fileInfo != null) {
            try {
                String id = new FileIdServices().getId();
                FileServices fileServices = new FileServices();
                Boolean success=fileServices.addFile(fileName, 1, filePathId, 0, fileSize, account);
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
}
