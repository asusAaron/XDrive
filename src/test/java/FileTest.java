import com.model.services.FileServices;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class FileTest
{
    public static void main(String[] args)
    {
//        String path ="D:\\JAVA";
//        List<String> list=getFiles(path);
//        for (String s:list)
//        {
//            System.out.println(s);
//        }
        testfile();
    }

    private static List<String> getFiles(String path)
    {
        List<String> list=new ArrayList<>();
        List<String> paths=new ArrayList<>();
        paths.add(path);
        File file;
        File[] templist;
        while (paths.size()!=0)
        {
            file=new File(paths.get(0));
            templist=file.listFiles();
            if (templist!=null)
            {
                for (File f:templist)
                {
                    if(f.isFile())
                    {
                        list.add("文件："+f.toString());
                    }
                    if (f.isDirectory())
                    {
                        paths.add(f.toString());
                    }
                }
            }
            paths.remove(0);
        }
        return list;
    }

    private static void testfile()
    {
        FileServices fs=new FileServices();
        //文件名，权限，父文件夹，文件类型（0文件/1文件夹），文件所有者(用户)
        Object[] strings={"test.txt","1","tester","0","gyx"};
        try
        {
            fs.addFile(strings);
            System.out.println(fs.queryFileInfo("3"));
            fs.modifyFileName("where","3");
            System.out.println(fs.queryFileInfo("3"));
            fs.deleteFile("3");
            System.out.println(fs.queryFileInfo("3"));
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
