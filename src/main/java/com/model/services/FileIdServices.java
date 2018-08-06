package com.model.services;

import java.util.List;
import java.util.Map;

public class FileIdServices extends ServicesSupport
{

    public int getId(String sname) throws Exception
    {
        //查询序列
        String s="select id from fileid";
        //查询
        List<Map<String,String>> mapList=query(s);
        if(mapList.size()==0)
        {
            return 0;
        }
        //序列当前值
        int current_val=Integer.parseInt(mapList.get(0).get("id"));
        //修改当前值
        String sql="update fileid set id = ?";
        update(sql,current_val+1);

        return current_val+1;
    }
}
