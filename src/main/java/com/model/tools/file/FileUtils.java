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

}
