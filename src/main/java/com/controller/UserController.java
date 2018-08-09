package com.controller;

import com.controller.Tree.TreeMaker;
import com.model.services.FileServices;
import com.model.services.UserServices;
import com.model.tools.User.RSAUtils;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
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
    public Object getAllFiles(@RequestParam("account") String account,
                              HttpServletRequest request) {

        List<Map<String, String>> fileInfos = null;
        JSONObject res=new JSONObject();
        try {
            fileInfos = new FileServices().queryFileByUser(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (fileInfos != null) {
            request.getSession().setAttribute("fileInfos",fileInfos);
            request.getSession().setAttribute("filetree",new TreeMaker().getTree(fileInfos));
            request.getSession().setAttribute("filejson",new TreeMaker().getJson(fileInfos));
            System.out.println(fileInfos);
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
