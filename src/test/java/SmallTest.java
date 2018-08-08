import com.model.services.UserServices;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.net.URL;

public class SmallTest {
    public static void main(String[] args) throws Exception {
        JSONObject j=new JSONObject();
        org.json.JSONObject jsonObject=new org.json.JSONObject().put("1","2");
        j.put("status","s");
        System.out.println(j.toString());
        System.out.println(jsonObject.toString());

        new UserServices().addUser("zzs","zhangzuosen","123");
    }
}
