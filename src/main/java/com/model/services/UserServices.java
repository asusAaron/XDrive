package com.model.services;

import java.util.List;
import java.util.Map;

public class UserServices extends ServicesSupport
{
    /**
     * 添加新用户
     * @param arr --- 账号，用户名，密码，用户权限
     * @return
     * @throws Exception --- 数据库中对u_account字段使用UNIQUE约束，如果插入已有账户会出现异常
     */
    public boolean addUser(Object...arr) throws Exception
    {
        String s="insert into user(u_account,u_name,u_password,u_date,u_limit) values (?,?,?,curdate(),?)";
        return update(s,arr);
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
    public List<Map<String,String>> queryUser(String account) throws Exception
    {
        String s="select * from user where u_account=?";
        return query(s,account);
    }

}
