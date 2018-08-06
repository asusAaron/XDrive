package com.model.tools.file;

import com.model.services.FilePathServices;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;

import java.io.File;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

import static org.springframework.util.StringUtils.getFilename;

public class FileOperations
{
    /**
     * 按照路径和确切的文件名查找并返回文件
     * @param path --- 文件路径
     * @param filename --- 文件名
     * @return
     */
    public File getFile(String path,String filename)
    {
        //文件路径
        File files=new File(path);
        if(!files.exists()||!files.isDirectory())
        {
            return null;
        }
        //当路径存在时
        File[] filelist=files.listFiles();
        if(filelist==null||filelist.length==0)
        {
            return null;
        }

        for (File file:filelist)
        {
            if (file.isFile() && file.getName().equals(filename))
            {
                return file;
            }
        }
        //没有符合条件的文件，返回null
        return null;
    }

    /**------------------------------------------------------------------------------------------------------------
     *          连接文件服务器
     -------------------------------------------------------------------------------------------------------------*/

    /**
     * 用于上传文件的方法，目标地址192.168.6.128，端口22122
     * @param file --- 文件字节流
     * @param fileExtName --- 文件扩展名
     * @param account --- 用户账号
     * @throws Exception
     */
    public Map<String,String> uploadFile(byte file[], String fileExtName, String account) throws Exception
    {

        StorageClient storageClient=FileUtils.initClient();
        NameValuePair nvp [] = new NameValuePair[]{
                new NameValuePair("account", account)
        };
        String results[]=storageClient.upload_file(file,fileExtName,nvp);

        Map<String,String> map=new HashMap<>();
        map.put("group",results[0]);
        map.put("path",results[1]);
        map.put("ext",fileExtName);

//        FilePathServices fps=new FilePathServices();
//        Object strings[]={fileId,results[0],fileExtName,results[1]};
//        fps.addPath(strings);

        return map;
    }

    /**
     * 用于下载的方法，目标地址192.168.6.129
     * @param group --- 分组
     * @param filepath --- 目标文件路径
     * @return
     * @throws Exception
     */
    public byte[] downloadFile(String group,String filepath) throws Exception
    {
        StorageClient storageClient=FileUtils.initClient();
        //获取的文件为字节码形式
        return storageClient.download_file(group,filepath);
    }

    /**
     * 获取文件详细信息
     * @param group --- 分组
     * @param filepath --- 目标文件路径
     * @return
     * @throws Exception
     */
    public Map<String,String> getFileInfo(String group,String filepath) throws Exception
    {
        StorageClient storageClient=FileUtils.initClient();

        FileInfo fi=storageClient.get_file_info(group,filepath);
        Map<String,String> map=new HashMap<>();
        map.put("sourceip",fi.getSourceIpAddr());
        map.put("filesize",String.valueOf(fi.getFileSize()));
        map.put("createtime",String.valueOf(fi.getCreateTimestamp()));
        map.put("crc32",String.valueOf(fi.getCrc32()));

        return map;
    }

    /**
     * 估计用不到
     * @param group
     * @param filepath
     * @return
     * @throws Exception
     */
    public NameValuePair[] getFileMate(String group,String filepath)throws Exception
    {
        StorageClient storageClient = FileUtils.initClient();
        NameValuePair nvps [] = storageClient.get_metadata(group, filepath);

        for(NameValuePair nvp : nvps){
            System.out.println(nvp.getName() + ":" + nvp.getValue());
        }

        return nvps;
    }

    /**
     * 删除文件，暂时也用不到
     * @param group
     * @param filepath
     * @return
     * @throws Exception
     */
    public boolean delFile(String group,String filepath)throws Exception
    {
        StorageClient storageClient=FileUtils.initClient();

        int i=storageClient.delete_file(group,filepath);
        System.out.println(i);
        return i==0;
    }


    /**
     * 获取访问服务器的token，拼接到地址后面
     *
     * @param fullpath 完整文件路径 group1/M00/00/00/***************.**
     * @param httpSecretKey 密钥
     * @return 返回token，如： token=078d370098b03e9020b82c829c205e1f&ts=1508141521
     */
    public static String getToken(String fullpath, String httpSecretKey){
        // unix seconds
        int ts = (int) Instant.now().getEpochSecond();
        // token
        String token = "null";
        try
        {
            token = ProtoCommon.getToken(getFilename(fullpath), ts, httpSecretKey);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        StringBuilder sb = new StringBuilder()
                .append("token=")
                .append(token)
                .append("&ts=")
                .append(ts);

        return sb.toString();
    }

}
