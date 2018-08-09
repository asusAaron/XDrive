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
    @RequestMapping("/index")
    public String toMain(){
        return "login";
    }

    @RequestMapping("/login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/detailedinfo")
    public String toDetail(){return "detailedinfo";}

    @RequestMapping("/userInfo")
    public String toUser(){return "userInfo";}

    @RequestMapping("/home")
    public String toHome(){return "home";}

    @RequestMapping("/safe")
    public String toSafe(){return "safe";}

    @RequestMapping("/sign")
    public String toSign(){
        return "sign";
    }

    @RequestMapping("/search")
    public String toSearch(){
        return "search";
    }

    @RequestMapping("/searchResult")
    public String toSearchResult(){
        return "searchResult";
    }

    @RequestMapping("/aboutUs")
    public String toAboutUs(){
        return "aboutUs";
    }

    @RequestMapping("/recycle")
    public String toRecycle(){
        return "recycle";
    }

    @RequestMapping("/echarts2")
    public String toEcharts2(){return "echarts2";}

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
