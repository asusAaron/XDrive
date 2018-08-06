import com.model.tools.file.FileOperations;

public class UploadTest
{
    public static void main(String[] args)
    {
        FileOperations fileUpload=new FileOperations();
        try
        {
            fileUpload.uploadFile(new byte[]{2,13,2,3,4},"jpg","gyx");
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
