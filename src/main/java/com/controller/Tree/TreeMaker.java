package com.controller.Tree;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class TreeMaker
{
    /**
     * 将文件结构生成一颗树
     * @param mapList
     * @return
     */
    public Map<String,TreeNode> getTree(List<Map<String,String>> mapList)
    {
        Map<String,TreeNode> treeNodeMap=new HashMap<>();
        Map<String,String> childP=new HashMap<>();
        TreeNode treeNode;

        String id;
        String parent;
        for (Map<String,String> map:mapList)
        {
           id=map.get("f_id");
           parent=map.get("f_parent");
           childP.put(id,parent);
           treeNode=new TreeNode(map);
           treeNodeMap.put(id,treeNode);
        }

        Set<Entry<String,String>> entrySet=childP.entrySet();
        //子文件id
        String entryid;
        //父文件id
        String entryparent;
        TreeNode childNode;
        for(Entry<String,String> entry:entrySet)
        {
            entryparent = entry.getValue();
            if(entryparent!=null)
            {
                entryid=entry.getKey();
                childNode=treeNodeMap.get(entryid);
                treeNodeMap.get(entryparent).addChild(childNode);
            }
        }

        return treeNodeMap;
    }
}
