package com.controller;

import com.model.services.UserServices;
import com.model.tools.User.RSAUtils;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam("user")String account,
                        @RequestParam("pwd")String pwd){
        String usr=RSAUtils.decryptBase64(account);
        String password=RSAUtils.decryptBase64(pwd);
        JSONObject result=new JSONObject();

        System.out.println(usr);
        System.out.println(password);

        Map<String, String> userInfo=null;
        try {
             userInfo= new UserServices().identifyUser(usr, password);
            System.out.println(userInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(userInfo!=null){
            result.put("status","success");
            result.put("name",userInfo.get("u_name"));
        }else {
            result.put("status","fail");
        }

        return result.toString();
    }

    @RequestMapping(value = "/rdspwd",method = RequestMethod.POST)
    public Object rdspwd(){
        String key=RSAUtils.generateBase64PublicKey();
        return key;
    }
}
