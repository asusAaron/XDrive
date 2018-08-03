package com.controller;

import com.controller.UploadProgressListener;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class MyMultipartResolver extends CommonsMultipartResolver {


    private UploadProgressListener uploadProgressListener;

    @Override
    public MultipartParsingResult parseRequest(HttpServletRequest request) throws MultipartException {
        String encoding=determineEncoding(request);
        FileUpload fileUpload=prepareFileUpload(encoding);

        //让监听器获得session，并设置监听器
        uploadProgressListener.setSession(request.getSession());
        fileUpload.setProgressListener(uploadProgressListener);

        try {
            List<FileItem> fileItems= ((ServletFileUpload)fileUpload).parseRequest(request);
            return parseFileItems(fileItems,encoding);
        } catch (FileUploadException e) {
            throw new MultipartException("无法解析");
        }
    }
}
