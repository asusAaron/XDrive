import com.model.services.FileIdServices;

public class IDtest
{
    public static void main(String[] args)
    {
        try
        {
            System.out.println(new FileIdServices().getId());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
