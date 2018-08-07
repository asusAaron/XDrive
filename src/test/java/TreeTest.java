import com.controller.Tree.TreeMaker;
import com.controller.Tree.TreeNode;
import com.model.services.FileServices;
import java.util.Map;
import java.util.Map.Entry;

public class TreeTest
{
    public static void main(String[] args)
    {
        TreeMaker t=new TreeMaker();
        try
        {
            Map<String,TreeNode> map=t.getTree(new FileServices().queryAll());
            for (Entry<String,TreeNode> entry:map.entrySet())
            {
                System.out.println(entry.getKey()+",");
                for(TreeNode treeNode:entry.getValue().getChilds())
                {
                    System.out.println(treeNode.getFileInfo());
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
