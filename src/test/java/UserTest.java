import com.model.services.UserServices;

import java.util.ArrayList;
import java.util.List;

public class UserTest
{
    public static void main(String[] args)
    {
        Object o[]={"lvchao","超","122356","1"};
        UserServices userServices=new UserServices();
        try
        {
            userServices.addUser(o);
            System.out.println(userServices.queryUser("gyx"));
            userServices.modifyUserName("龚宇祥","gyx");
            System.out.println(userServices.queryUser("gyx"));
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
