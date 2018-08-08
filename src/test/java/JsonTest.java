import com.controller.Tree.TreeMaker;
import com.model.services.FileServices;
import com.mysql.cj.xdevapi.JsonArray;
import net.sf.json.JSONObject;
import org.json.JSONArray;

import java.util.HashMap;
import java.util.List;

public class JsonTest
{
    public static void main(String[] args)
    {
        TreeMaker t=new TreeMaker();
        FileServices services=new FileServices();
        try
        {
            System.out.println(t.getJson(services.queryAll()));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
