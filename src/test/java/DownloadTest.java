import com.model.tools.file.FileOperations;

import java.io.File;
import java.io.FileOutputStream;

public class DownloadTest
{

    public static void main(String[] args)
    {
        FileOperations fo=new FileOperations();

        try
        {
            byte[] b=fo.downloadFile("group1","M00/00/00/wKgGgVtkMOyAKPEbAAje_rmg9YA344.jpg");
            File file = new File("D:\\download.jpg");
            FileOutputStream fos=new FileOutputStream(file);
            fos.write(b,0,b.length);
            fos.flush();
            fos.close();

            fo.getFileInfo("group1","M00/00/00/wKgGgVtkMOyAKPEbAAje_rmg9YA344.jpg");

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
