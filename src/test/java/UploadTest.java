import com.model.tools.file.FileOperations;

public class UploadTest
{
    public static void main(String[] args)
    {
        FileOperations fileUpload=new FileOperations();
        try
        {
            fileUpload.uploadFile("2","D:\\大三下\\暑期实训\\XDrive\\src\\test\\resources\\testFile3.jpg","jpg","gyx");
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
