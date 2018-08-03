package com.model.services;

import java.util.List;
import java.util.Map;

public class FilePathServices extends ServicesSupport
{
    /**
     * 上传文件后添加文件路径
     * @param arr --- String[4] 文件id，组，文件扩展名，文件在storage的路径
     * @return
     * @throws Exception
     */
    public boolean addPath(Object...arr) throws Exception
    {
        String s="insert into filepath(f_id,f_group,f_ext,f_path) values (?,?,?,?)";
        return update(s,arr);
    }

    /**
     * 查找文件路径（by f_id）
     * @param id
     * @return
     * @throws Exception
     */
    public Map<String,String> queryPath(String id) throws Exception
    {
        String s="select * from filepath where f_id=?";
        List<Map<String,String>> list=query(s,id);
        if(list.size()==0)
        {
            return null;
        }
        return list.get(0);
    }
}
