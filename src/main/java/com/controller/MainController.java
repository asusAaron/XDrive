package com.controller;

import com.controller.Tree.TreeMaker;
import com.controller.Tree.TreeNode;
import com.model.services.FileServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {
    @RequestMapping("/test")
    public String toMain(){
        return "test";
    }

    public String displayfile(HttpServletRequest request)
    {
        FileServices services=new FileServices();
        try
        {
            List<Map<String,String>> fileList=services.queryAll();
            TreeMaker treeMaker=new TreeMaker();
            Map<String,TreeNode> treeNodeMap=treeMaker.getTree(fileList);
            request.getSession().setAttribute("fileList",fileList);
            request.getSession().setAttribute("treeNodeMap",treeNodeMap);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return "display";
    }
}
