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

    /**
     * 获取数据库连接
     * @return
     * @throws Exception
     */
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

    /**
     * 预编译sql语句，返回statement
     * @param sql
     * @return
     * @throws Exception
     */
    public static PreparedStatement prepareStatement(String sql) throws Exception
    {
        return getConnection().prepareStatement(sql);
    }

    /**
     * 开启事务
     * @throws Exception
     */
    public static void startTransaction() throws Exception
    {
        getConnection().setAutoCommit(false);
    }

    /**
     * 结束事务
     * @throws Exception
     */
    public static void closeTransaction()throws Exception
    {
        getConnection().setAutoCommit(true);
    }

    /**
     * 提交
     * @throws Exception
     */
    public static void commit()throws Exception
    {
        getConnection().commit();
    }

    /**
     * 回滚
     * @throws Exception
     */
    public static void rollback()
    {
        try
        {
            getConnection().rollback();
        } catch (Exception e)
        {
            try
            {
                getConnection().rollback();
            } catch (Exception e1)
            {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
    }


    /**-------------------------------------------------------------------------------------
     *              数据库关闭操作
     --------------------------------------------------------------------------------------*/

    /**
     *     关闭Connection
     */
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

    /**
     *     关闭PreparedStatement
     * @param pstm
     */
    public static void close(PreparedStatement pstm){
        try{
            if(pstm!=null){
                pstm.close();
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
    }

    /**
     * 关闭ResultSet
     * @param rs
     */
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
