package com.model.services;

import java.util.List;
import java.util.Map;

public class FileServices extends ServicesSupport
{
    /**
     * 添加新文件
     * @param arr --- 文件名，权限，父文件夹，文件类型（0文件/1文件夹），文件大小（MB），文件所有者(用户)
     * @return
     * @throws Exception --- 数据库中对f_user字段使用FK约束，如果该USER不存在会出现异常
     */
    public boolean addFile(Object...arr) throws Exception
    {
        String s="insert into file(f_id,f_name,f_limit,f_uploadtime,f_parent,f_type,f_size,f_user) values (?,?,?,sysdate(),?,?,?,?)";
        return update(s,arr);
    }

    /**
     * 删除文件(加入回收站)
     * @param id --- 文件id
     * @return
     * @throws Exception
     */
    public boolean deleteFile(String id) throws Exception
    {
        String s="update file set f_state = 0 where f_id = ?";
        return update(s,id);
    }

    /**
     * 删除文件
     * @param id --- 文件id
     * @return
     * @throws Exception
     */
    public boolean realDelete(String id) throws Exception
    {
        String s="update file set f_state = 2 where f_id = ?";
        return update(s,id);
    }

    /**
     * 更改文件名
     * @param  name,id --- 文件名，id
     * @return
     * @throws Exception
     */
    public boolean modifyFileName(String name,String id) throws Exception
    {
        String s="update file set f_name=? where f_id = ? and f_state = 1";
        Object[] objects={name,id};
        return update(s,objects);
    }

    /**
     * 更改文件访问权限
     * @param limit,id --- 文件权限，id
     * @return
     * @throws Exception
     */
    public boolean modifyFlieLimit(String limit,String id) throws Exception
    {
        String s="update file set f_limit=? where f_id=? and f_state = 1";
        Object[] objects={limit,id};
        return update(s,objects);
    }

    /**
     * 更改文件位置
     * @param parent,id --- 文件的新父文件夹，id
     * @return
     * @throws Exception
     */
    public boolean modifyFileLimit(String parent,String id) throws Exception
    {
        String s="update file set f_parent=? where f_id=? and f_state = 1";
        Object[] objects={parent,id};
        return update(s,objects);
    }

    /**
     * 查询所有文件及其信息
     * @return List<Map<String,String>>
     * @throws Exception
     */
    public List<Map<String,String>> queryAll() throws Exception
    {
        String s="select * from file where f_state = 1";
        return query(s);
    }

    /**
     * 查询同一父目录下的所有子文件
     * @param parent --- 父文件夹名
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> queryChildFile(String parent) throws Exception
    {
        String s="select * from file where f_parent=? and f_state = 1";
        return query(s,parent);
    }

    /**
     * 查询文件详细信息
     * @param id --- 文件id
     * @return
     * @throws Exception
     */
    public Map<String,String> queryFileInfo(String id)throws Exception
    {
        String s="select * from file where f_id = ? and f_state = 1";
        List<Map<String,String>> list=query(s,id);
        return list.size()==0?null:list.get(0);
    }

    /**
     * 查询文件的父文件夹
     * @param id --- 文件id
     * @return
     * @throws Exception
     */
    public String queryFileParent(String id)throws Exception
    {
        String s="select f_parent from file where f_id=? and f_sate = 1";
        List<Map<String,String>> list=query(s,id);
        return list.size()==0?null:list.get(0).get("f_parent");
    }

    /**
     * 批量删除文件操作
     * @param ids --- 文件id
     * @return
     * @throws Exception
     */
    public boolean batchDelFile(String ids[])throws Exception
    {
        String s="update file set f_state = 0 where f_id = ?";
        return batchUpdate(s,ids);
    }

    /**
     * 根据用户查询文件
     * @param account --- 用户账号
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> queryFileByUser(String account)throws Exception
    {
        String s="select * from file where f_user = ? and f_state = 1";
        return query(s,account);
    }

    /**
     * 根据用户查询回收站文件
     * @param account --- 用户账号
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> queryFileDel(String account)throws Exception
    {
        String s="select * from file where f_user = ? and f_state = 0";
        return query(s,account);
    }

    /**
     * 查询共享的文件
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> queryShareFile()throws Exception
    {
        String s="select * from file where f_limit = 0";
        return query(s);
    }
}
