import com.model.services.UserServices;

import java.util.ArrayList;
import java.util.List;

public class UserTest
{
    public static void main(String[] args)
    {
        Object o[]={"gyx","龚宇祥","123456","1"};
        UserServices userServices=new UserServices();
        try
        {
            userServices.addUser(o);
            System.out.println(userServices.queryUser("gyx"));
            userServices.modifyUserName("龚宇祥","gyx");
            System.out.println(userServices.queryUser("gyx"));
            userServices.deleteUser("gyx");
            System.out.println(userServices.queryUser("gyx"));
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
