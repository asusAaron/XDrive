package com.model.tools.file;

import java.io.File;

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




}
