package com.controller.Tree;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JsonNode
{
    private String name;
    private List<JsonNode> childs=new ArrayList<>();

    public void addChild(JsonNode child)
    {
        this.childs.add(child);
    }

    public List<JsonNode> getChilds()
    {
        return childs;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
}
