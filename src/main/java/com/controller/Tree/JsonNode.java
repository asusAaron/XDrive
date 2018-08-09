package com.controller.Tree;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JsonNode
{
    private String name;
    private List<JsonNode> children=new ArrayList<>();

    public void addChild(JsonNode children)
    {
        this.children.add(children);
    }

    public List<JsonNode> getChildren()
    {
        return children;
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
