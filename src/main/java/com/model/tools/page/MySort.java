package com.model.tools.page;

import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class MySort
{
    /**
     * 按照日期排序（最新修改的在最前面）
     * @param params --- 要排序的列表
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> sortByDate(List<Map<String,String>> params) throws Exception
    {
        final SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        //在内部类重写compare方法
        params.sort(new Comparator<Map<String, String>>()
        {
            @Override
            public int compare(Map<String, String> o1, Map<String, String> o2)
            {
                try
                {
                    return df.parse(o2.get("f_uploadtime")).compareTo(df.parse(o1.get("f_uploadtime")));
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                return 0;
            }
        });
        return params;
    }

    /**
     * 按名称排序（字母顺序）
     * @param params --- 要排序的参数列表
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> sortByName(List<Map<String,String>> params) throws Exception
    {
        params.sort(new Comparator<Map<String, String>>()
        {
            @Override
            public int compare(Map<String, String> o1, Map<String, String> o2)
            {
                try
                {
                    return o1.get("f_name").compareTo(o2.get("f_name"));
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                return 0;
            }
        });
        return params;
    }

    /**
     * 按文件大小排序（小的在前）
     * @param params --- 要排序的参数列表
     * @return
     * @throws Exception
     */
    public List<Map<String,String>> sortBySize(List<Map<String,String>> params) throws Exception
    {
        params.sort(new Comparator<Map<String, String>>()
        {
            @Override
            public int compare(Map<String, String> o1, Map<String, String> o2)
            {
                try
                {
                    Double d=Double.parseDouble(o1.get("f_size"))-(Double.parseDouble(o2.get("f_size")));
                    return (int)Math.floor(d);
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                return 0;
            }
        });
        return params;
    }
}
