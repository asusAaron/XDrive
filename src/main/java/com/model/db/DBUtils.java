package com.model.db;

import java.sql.*;
import java.util.ResourceBundle;

public class DBUtils
{
    //驱动串路径
    private static String driver=null;
    private static String url=null;
    private static String username=null;
    private static String password=null;
    private static ThreadLocal<Connection> threadLocal=new ThreadLocal<>();

    private DBUtils(){}

    static
    {
        try
        {
            //获取资源文件
            ResourceBundle bundle=ResourceBundle.getBundle("DBOptions");
            //根据资源文件按名取值（资源文件是有名无序的）
            driver=bundle.getString("driver");
            url=bundle.getString("url");
            username=bundle.getString("username");
            password=bundle.getString("password");

            Class.forName(driver);
            System.out.println("-------------------Loading driver successfully!--------------------------");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    private static Connection getConnection() throws Exception
    {
        //获取当前线程数据库连接
        Connection conn=threadLocal.get();
        //无连接则创建数据库连接
        if(conn==null){
            conn = DriverManager.getConnection(url, username, password);
            threadLocal.set(conn);
        }
        return conn;
    }

    public static PreparedStatement prepareStatement(String sql) throws Exception
    {
        return getConnection().prepareStatement(sql);
    }

    //关闭Connection
    public static void close()
    {
        try
        {
            Connection conn=getConnection();
            if(conn!=null)
            {
                threadLocal.set(null);
                conn.close();
                System.out.println("-------------------Close connection successfully!--------------------------");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    //关闭PreparedStatement
    public static void close(PreparedStatement pstm){
        try{
            if(pstm!=null){
                pstm.close();
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
    }

    //关闭ResultSet
    public static void close(ResultSet rs){
        try {
            if(rs!=null){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
