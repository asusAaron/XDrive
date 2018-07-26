import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FileTest
{
    public static void main(String[] args)
    {
        String path ="D:\\JAVA";
        List<String> list=getFiles(path);
        for (String s:list)
        {
            System.out.println(s);
        }
    }

    private static List<String> getFiles(String path)
    {
        List<String> list=new ArrayList<>();
        List<String> paths=new ArrayList<>();
        paths.add(path);

        while (paths.size()!=0)
        {
            File file=new File(paths.get(0));
            File[] templist=file.listFiles();
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

}
