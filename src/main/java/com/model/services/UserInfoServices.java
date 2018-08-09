package com.model.services;

import java.util.List;
import java.util.Map;

public class UserInfoServices extends ServicesSupport
{
    /**
     * 添加个人详细信息
     * @param arr Object[8] 性别，生日，所在地，工作，学校，公司，个人说明，用户账号（外键约束）
     * @return true/false
     * @throws Exception
     */
    public boolean addInfo(Object...arr) throws Exception
    {
        String s="insert into userinfo(i_sex,i_birthday,i_location,i_job,i_school,i_company,i_signature,i_user) values (?,curdate(),?,?,?,?,?,?)";
        return update(s,arr);
    }

    /**
     * 修改个人详细信息
     * @param arr Object[8] 性别，生日，所在地，工作，学校，公司，个人说明，用户账号（外键约束）
     * @return true/false
     * @throws Exception
     */
    public boolean modifyInfo(Object...arr) throws Exception
    {
        String s="update userinfo set i_sex=?,i_birthday=?,i_location=?,i_job=?,i_school=?,i_company=?,i_signature=? where i_user=?";
        return update(s,arr);
    }

    /**
     * 查询个人详细信息
     * @param account --- 账号
     * @return --- Map
     * @throws Exception
     */
    public Map<String,String> queryInfo(String account)throws Exception
    {
        String s="select * from userinfo where i_user = ?";
        List<Map<String,String>> mapList=query(s,account);
        if (mapList.size()==0)
        {
            return null;
        }
        return mapList.get(0);
    }
}
