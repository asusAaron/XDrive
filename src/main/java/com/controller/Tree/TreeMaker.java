package com.controller.Tree;

import com.sun.org.apache.xerces.internal.xs.datatypes.ObjectList;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.*;
import java.util.Map.Entry;

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

    public JSONObject getJson(List<Map<String,String>> mapList)
    {
        Map<String,JsonNode> jsonNodeMap=new HashMap<>();
        Map<String,String> childP=new HashMap<>();
        JsonNode jsonNode;

        String id;
        String parent;
        String name;
        for (Map<String,String> map:mapList)
        {
            id=map.get("f_id");
            parent=map.get("f_parent");
            name=map.get("f_name");
            childP.put(id,parent);
            jsonNode=new JsonNode();
            jsonNode.setName(name);
            jsonNodeMap.put(id,jsonNode);
        }

        Set<Entry<String,String>> entrySet=childP.entrySet();
        //子文件id
        String entryid;
        //父文件id
        String entryparent;
        JsonNode childNode;
        //根节点
        JsonNode root=new JsonNode();
        for(Entry<String,String> entry:entrySet)
        {
            entryparent = entry.getValue();
            entryid=entry.getKey();
            if(entryparent!=null)
            {
                childNode=jsonNodeMap.get(entryid);
                jsonNodeMap.get(entryparent).addChild(childNode);
            }
            else
            {
                root=jsonNodeMap.get(entryid);
            }
        }
        return JSONObject.fromObject(root);

    }

}
