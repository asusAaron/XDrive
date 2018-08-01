import com.model.services.UserInfoServices;

public class InfoTest
{
    public static void main(String[] args)
    {
        UserInfoServices s=new UserInfoServices();
        try
        {
            System.out.println(s.queryInfo("gyx"));
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
