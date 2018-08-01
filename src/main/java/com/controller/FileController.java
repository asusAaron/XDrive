package com.controller;

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

@RequestMapping("/file")
@RestController
public class FileController {
    /**
     * 单一文件上传
     * @param file
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
    public String singleUpload(@RequestParam("file")MultipartFile file, HttpServletRequest request)throws Exception{
        String filePath1=request.getServletContext().getRealPath("upload");
        System.out.println(filePath1);
        String fileName=file.getOriginalFilename();
        String filePath="F:\\uploadFile";
        System.out.println(fileName);
        File tFile=new File(filePath+File.separator+fileName);
        File parentFile=tFile.getParentFile();
        if(!parentFile.exists()){
            parentFile.mkdirs();
        }
        tFile.createNewFile();
        try{
            file.transferTo(tFile);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "status:success";
    }

    /**
     * 多个文件上传功能
     * @param files
     * @param request
     * @return
     * @throws Exception
     * @throws IOException
     */
    @RequestMapping("/BatchUpload")
    public String BatchUpload(@RequestParam("files")MultipartFile[] files,HttpServletRequest request) throws Exception, IOException{
        String filePath = request.getServletContext().getRealPath("upload");
        System.out.println("----------------------"+filePath+"------------------------");
        List<String> path =  new ArrayList<>();
        List<String> fullPath =  new ArrayList<>();
        for(MultipartFile file:files){
            String filename = file.getOriginalFilename();
            File targetFile = new File(filePath,filename);
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


    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public @ResponseBody ResponseEntity<byte[]> download(HttpServletRequest request, HttpServletResponse response)throws Exception{
        File file=new File("F:/uploadFile/11.jpg");
        byte[] body = null;
        InputStream is = new FileInputStream(file);
        body = new byte[is.available()];
        is.read(body);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + file.getName());
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<>(body, headers, statusCode);
        return entity;
    }
}
