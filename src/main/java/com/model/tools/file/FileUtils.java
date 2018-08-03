package com.model.tools.file;

import org.csource.fastdfs.*;

public class FileUtils
{
    private static final String conf_path="D:\\大三下\\暑期实训\\XDrive\\src\\main\\resources\\fdfs_client.conf";
    /**
     * 工具方法
     * @return
     * @throws Exception
     */
    public static StorageClient initClient() throws Exception
    {
        ClientGlobal.init(conf_path);

        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = tracker.getConnection();
        StorageServer storageServer = null;

        return new StorageClient(trackerServer, storageServer);
    }

}
