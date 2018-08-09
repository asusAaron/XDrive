package com.controller;

import com.controller.Tree.TreeMaker;
import com.model.services.FileServices;
import com.model.services.UserInfoServices;
import com.model.services.UserServices;
import com.model.tools.User.RSAUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("user") String account,
                        @RequestParam("pwd") String pwd,
                        HttpServletRequest request) {
        String usr = RSAUtils.decryptBase64(account);
        String password = RSAUtils.decryptBase64(pwd);
        JSONObject result = new JSONObject();

        System.out.println(usr);
        System.out.println(password);

        Map<String, String> userInfo = null;
        try {
            userInfo = new UserServices().identifyUser(usr, password);
            System.out.println(userInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (userInfo != null) {
            result.put("status", "success");
            request.getSession().setAttribute("u_name",userInfo.get("u_name"));
            request.getSession().setAttribute("u_account",userInfo.get("u_account"));
        } else {
            result.put("status", "fail");
        }

        return result.toString();
    }

    @RequestMapping(value = "/rdspwd", method = RequestMethod.POST)
    public Object rdspwd() {
        String key = RSAUtils.generateBase64PublicKey();
        return key;
    }

    @RequestMapping(value = "/files")
    public Object getAllFiles(HttpServletRequest request) {
        String account=request.getSession().getAttribute("u_account").toString();
        List<Map<String, String>> fileInfos = null;
        JSONObject res=new JSONObject();
        try {
            fileInfos = new FileServices().queryFileByUser(account);
            System.out.println(fileInfos);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (fileInfos != null) {
            request.getSession().setAttribute("fileInfos",fileInfos);
            //request.getSession().setAttribute("filetree",new TreeMaker().getTree(fileInfos));
            request.getSession().setAttribute("filejson",new TreeMaker().getJson(fileInfos));
            System.out.println(fileInfos);
            System.out.println(new TreeMaker().getJson(fileInfos));
            res.put("status","success");
        }else {
            res.put("status","fail");
        }
        return res.toString();
    }

    @RequestMapping(value = "/signup")
    public Object signUp(@RequestParam("phone")String phone,
                         @RequestParam("username")String userName,
                         @RequestParam("pwd")String pwd){
        String usr = RSAUtils.decryptBase64(phone);
        String password = RSAUtils.decryptBase64(pwd);
        JSONObject result = new JSONObject();
        Boolean state=false;
        try {
            state=new UserServices().addUser(usr,userName,password);
            new UserInfoServices().addInfo("1","","","","","",usr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(state){
            result.put("status","success");
        }else {
            result.put("status","fail");
        }
        return result.toString();
    }

    @RequestMapping(value = "/detailInfos",produces = "text/json;charset=UTF-8")
    public Object getDetail(HttpServletRequest request){
        JSONObject result = new JSONObject();
        String account= (String) request.getSession().getAttribute("u_account");
        String name= (String) request.getSession().getAttribute("u_name");
        Map<String,String> detailInfos=new HashMap<>();
            detailInfos.put("u_account",account);
            detailInfos.put("u_name",name);
        try {
            detailInfos.putAll(new UserInfoServices().queryInfo(account));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(detailInfos.size()>2){
            result.put("status","success");
            result.put("body",detailInfos);
        }else {
            result.put("status","fail");
        }

        return result.toString();
    }

    @RequestMapping(value = "/modifyInfos",produces = "text/json;charset=UTF-8")
    public Object modifyInfos(@RequestParam("detailedInfos")String info){
        JSONArray infos=new JSONArray(info);
        JSONObject result = new JSONObject();
        Boolean state=false;
        try {
            state=new UserInfoServices().modifyInfo(infos.get(2),infos.get(3),infos.get(4),infos.get(5),
                                                    infos.get(6),infos.get(7),infos.get(8),infos.get(0));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(state){
            result.put("status","success");
        }else {
            result.put("status","fail");
        }

        return result.toString();
    }
}
