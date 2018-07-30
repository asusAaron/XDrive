package com.model.tools.page;

import java.util.*;

public class MySearch
{
    /**
     * 搜索
     * @param params --- 需要查询的列表
     * @param str --- 用户输入的字段
     * @return
     */
    public List<Map<String,String>> search(List<Map<String,String>> params,String str)
    {
        List<Map<String,String>> resultList=new ArrayList<>();
        for (Map<String,String> map:params)
        {
            if (map.get("f_name").contains(str))
            {
                resultList.add(map);
            }

        }
        return resultList;
    }
}
