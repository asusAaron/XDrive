package com.model.services;

import com.model.db.DBUtils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class ServicesSupport
{
    /**
     * 通用更新操作，适用insert/update/delete语句
     * @param sql --- sql语句
     * @param arr --- sql语句参数数组
     * @return boolean
     * @throws Exception
     */
    protected final boolean update(String sql, Object... arr) throws Exception
    {
        PreparedStatement pstm = DBUtils.prepareStatement(sql);
        if (arr != null)
        {
            int index = 1;
            for (Object object : arr)
            {
                pstm.setObject(index++, object);
            }
        }
        return pstm.executeUpdate()>0;
    }

    /**
     * 通用查询操作
     * @param sql --- sql语句
     * @param arr --- sql语句参数数组
     * @return List<Map<String,String>>
     * @throws Exception
     */
    protected final List<Map<String,String>> query(String sql,Object...arr) throws Exception
    {
        PreparedStatement pstm=DBUtils.prepareStatement(sql);
        if (arr!=null)
        {
            int index=1;
            for (Object object : arr)
            {
                pstm.setObject(index++, object);
            }
        }
        ResultSet rs=pstm.executeQuery();
        //查询结束，获取查询结果
        List<Map<String,String>> list=new ArrayList<>();
        ResultSetMetaData rsmd;
        HashMap<String,String> map;
        while (rs.next())
        {
            rsmd=rs.getMetaData();
            map=new HashMap<>();
            //key为列名
            for (int i=1;i<=rsmd.getColumnCount();i++)
            {
                map.put(rsmd.getColumnLabel(i),rs.getString(i));
            }
            list.add(map);
        }
        return list;
    }

}
