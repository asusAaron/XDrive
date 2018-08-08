package com.model.tools.file;

import org.csource.fastdfs.*;

public class FileUtils
{
    private static final String conf_path="../resources/fdfs_client.conf";
    /**
     * 工具方法
     * @return
     * @throws Exception
     */
    public static String getConf_path(){
        String configPath = FileUtils.class
                .getResource("/fdfs_client.conf").getFile();
        return configPath;
    }
    public static StorageClient initClient() throws Exception
    {
        ClientGlobal.init(getConf_path());

        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = tracker.getConnection();
        StorageServer storageServer = null;

        return new StorageClient(trackerServer, storageServer);
    }

    public static int getFileType(String extName){
        if(extName.equals("txt")){
            return 1;
        }else if(extName.equals("jpg")||extName.equals("png")||extName.equals("jpeg")||extName.equals("gif")){
            return 2;
        }else if(extName.equals("mp4")||extName.equals("avi")||extName.equals("rmvb")){
            return 3;
        }else if(extName.equals("mp3")||extName.equals("flac")||extName.equals("wav")){
            return 4;
        }else {
            return 9;
        }
    }

}
