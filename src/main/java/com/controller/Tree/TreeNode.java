package com.controller.Tree;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TreeNode
{
    private Map<String,String> fileInfo;
    private List<TreeNode> childs=new ArrayList<>();

    TreeNode(Map<String,String> fileInfo)
    {
        this.fileInfo=fileInfo;
    }

    public void addChild(TreeNode child)
    {
        this.childs.add(child);
    }

    public List<TreeNode> getChilds()
    {
        return childs;
    }

    public Map<String, String> getFileInfo()
    {
        return fileInfo;
    }
}
