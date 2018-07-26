import com.model.db.DBUtils;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *      2018/7/26 数据库连接测试用例
 */
public class DBtest
{
    public static void main(String[] args)
    {
        try
        {
            ResultSet rs=DBUtils.prepareStatement("select * from person").executeQuery();
            List<HashMap<String,String>> list=new ArrayList<>();
            ResultSetMetaData rsmd;
            HashMap<String,String> map;
            while (rs.next())
            {
                rsmd=rs.getMetaData();
                map=new HashMap<>();
                for (int i=1;i<=rsmd.getColumnCount();i++)
                {
                    map.put(rsmd.getColumnLabel(i),rs.getString(i));
                }
                list.add(map);
            }

            System.out.println(list);

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
