package com.model.services;

import com.model.tools.system.Encryption;

import java.util.List;
import java.util.Map;

public class UserServices extends ServicesSupport
{
    /**
     * 添加新用户
     * @param arr --- 账号，用户名，密码
     * @return
     * @throws Exception --- 数据库中对u_account字段使用UNIQUE约束，如果插入已有账户会出现异常
     */
    public boolean addUser(Object...arr) throws Exception
    {
        //加密
        Encryption encryption=new Encryption();
        arr[2]=encryption.md5Password(arr[2].toString());
        String s="insert into user(u_account,u_name,u_password,u_date) values (?,?,?,curdate())";
        return update(s,arr);
    }

    /**
     * 验证登录
     * @param account --- 账户
     * @param password --- 密码
     * @return 返回null表示用户名不存在或者密码错误
     * @throws Exception
     */
    public Map<String,String> identifyUser(String account,String password) throws Exception
    {
        Encryption encryption=new Encryption();
        Map<String,String> map=queryUser(account);
        //查询不到该账户
        if(map==null)
        {
            return null;
        }
        //密码正确
        if(map.get("u_password").equals(encryption.md5Password(password)))
        {
            return map;
        }
        //密码不正确
        return null;
    }

    /**
     * 删除用户
     * @param account --- 账号
     * @return
     * @throws Exception
     */
    public boolean deleteUser(String account) throws Exception
    {
        String s="delete from user where u_account = ?";
        return update(s,account);
    }

    /**
     * 更改用户名
     * @param name,account --- 新用户名，账号
     * @return
     * @throws Exception
     */
    public boolean modifyUserName(String name,String account) throws Exception
    {
        String s="update user set u_name=? where u_account = ?";
        Object[] objects={name,account};
        return update(s,objects);
    }

    /**
     * 更改密码
     * @param password,account --- 新密码，账号
     * @return
     * @throws Exception
     */
    public boolean modifyUserPassword(String password,String account) throws Exception
    {
        String s="update user set u_password=? where u_account=?";
        Object[] objects={password,account};
        return update(s,objects);
    }

    /**
     * 更改用户权限
     * @param limit,account --- 新账户权限，账号
     * @return
     * @throws Exception
     */
    public boolean modifyUserLimit(String limit,String account) throws Exception
    {
        String s="update user set u_limit=? where u_account=?";
        Object[] objects={limit,account};
        return update(s,objects);
    }

    /**
     * 查询用户信息
     * @param account --- 账号
     * @return
     * @throws Exception
     */
    public Map<String,String> queryUser(String account) throws Exception
    {
        String s="select * from user where u_account=?";
        List<Map<String,String>> mapList=query(s,account);
        if (mapList.size()==0)
        {
            return null;
        }
        return mapList.get(0);
    }

}
