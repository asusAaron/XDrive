import com.model.services.FileServices;
import com.model.tools.page.MySearch;
import com.model.tools.page.MySort;

public class SortTest
{
    public static void main(String[] args)
    {
        sortfile();
        searchfile();
    }

    private static void sortfile()
    {
        FileServices fs=new FileServices();
        MySort sort=new MySort();
        try
        {
            System.out.println(fs.queryAll());
            System.out.println(sort.sortByDate(fs.queryAll()));
            System.out.println(sort.sortByName(fs.queryAll()));
            System.out.println(sort.sortBySize(fs.queryAll()));
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    private static void searchfile()
    {
        FileServices fs=new FileServices();
        MySearch search=new MySearch();
        try
        {
            System.out.println(search.search(fs.queryAll(),"k"));
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
