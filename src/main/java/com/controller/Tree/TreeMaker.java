package com.controller.Tree;

import net.sf.json.JSON;
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
        Map<String,String> childP=new HashMap<>();
        Map<String,JSONObject> jsonObjectMap=new HashMap<>();

        String id;
        String parent;
        String name;
        JSONObject jsonObject;
        for (Map<String,String> map:mapList)
        {
            id=map.get("f_id");
            parent=map.get("f_parent");
            name=map.get("f_name");
            //形成父子结构
            childP.put(id,parent);
            jsonObject=new JSONObject();
            jsonObject.put("name",name);
            jsonObjectMap.put(id,jsonObject);
        }

        //起始点
        JSONObject root=new JSONObject();
        root.put("name","root");
        List<JSONObject> jsonObjects=new ArrayList<>();
        jsonObjects.add(root);

        //遍历
        List<String> idlist=new ArrayList<>();
        idlist.add(null);
        JSONObject json;

        return null;
    }

}
