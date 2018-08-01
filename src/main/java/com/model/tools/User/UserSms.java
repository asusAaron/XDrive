package com.model.tools.User;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

/**
 *短信API服务调用 － 聚合数据
 **/
public class UserSms
{

    /**
     * fa♂送短信功能的实现
     * 生成六位随机数字验证码
     * @param phonenum --- 目标手机号码，字符串型
     * @return 返回一个jsonObject，格式为：
     * {
     *     "reason": 发送成功/失败的提示消息,
     *     "result":（发送失败时result为[]）
     *     {
     *         "count": 发送数量
     *         "fee": 扣除条数
     *         "sid": 短信ID
     *     },
     *     "error_code": 返回码，为0时表示发送成功
     * }
     */
    public JSONObject getRequest(String phonenum){
            String result;
            String url ="http://v.juhe.cn/sms/send";        //请求接口地址
            Map<String,Object> params = new HashMap<>();        //请求参数
            params.put("mobile",phonenum);      //接收短信的手机号码
            params.put("tpl_id",91303);       //短信模板ID，请参考个人中心短信模板设置

            /*
            变量名和变量值对。
            如果你的变量名或者变量值中带有#&=中的任意一个特殊符号，请先分别进行urlencode编码后再传递，
            <a href="http://www.juhe.cn/news/index/id/50" target="_blank">详细说明></a>
             */
            params.put("tpl_value",getRandom());
            params.put("key","581348a0a5178bef9ad81bc0bcf02a7f");      //应用APPKEY(应用详细页查询)
            params.put("dtype","json");      //返回数据的格式,xml或json，默认json

            try
            {
                result =net(url, params, "GET");

                return JSONObject.fromObject(result);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            return null;
        }

        /**
         *
         * @param strUrl 请求地址
         * @param params 请求参数
         * @param method 请求方法
         * @return  网络请求字符串
         * @throws Exception
         */
        private String net(String strUrl, final Map<String,Object> params,final String method) throws Exception {
            //请求头
            final String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
            HttpURLConnection conn = null;
            BufferedReader reader = null;
            String rs = null;
            try
            {
                StringBuilder sb = new StringBuilder();
                if(method==null || method.equals("GET"))
                {
                    strUrl = strUrl+"?"+urlencode(params);
                }
                URL url = new URL(strUrl);
                conn = (HttpURLConnection) url.openConnection();
                if(method==null || method.equals("GET"))
                {
                    conn.setRequestMethod("GET");
                }
                else
                    {
                    conn.setRequestMethod("POST");
                    conn.setDoOutput(true);
                }
                conn.setRequestProperty("User-agent", userAgent);
                conn.setUseCaches(false);
                conn.setConnectTimeout(30000);
                conn.setReadTimeout(30000);
                conn.setInstanceFollowRedirects(false);
                conn.connect();
                if (params!= null  && "POST".equals(method))
                {
                    try
                    {
                        DataOutputStream out = new DataOutputStream(conn.getOutputStream());
                        out.writeBytes(urlencode(params));
                    }
                    catch (Exception e)
                    {
                        e.printStackTrace();
                    }
                }
                InputStream is = conn.getInputStream();
                reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                String strRead;
                while ((strRead = reader.readLine()) != null)
                {
                    sb.append(strRead);
                }
                rs = sb.toString();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
            finally
            {
                if (reader != null)
                {
                    reader.close();
                }
                if (conn != null)
                {
                    conn.disconnect();
                }
            }
            return rs;
        }

        //将map型转为请求参数型
        private String urlencode(Map<String,Object> data)
        {
            StringBuilder sb = new StringBuilder();
            for (Map.Entry i : data.entrySet())
            {
                try
                {
                    sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
                }
                catch (UnsupportedEncodingException e)
                {
                    e.printStackTrace();
                }
            }
            return sb.toString();
        }

        //生成6位随机码
        private String getRandom()
        {
            StringBuilder ran=new StringBuilder().append("#code#=");
            for (int i=0;i<6;i++)
            {
                int a=(int)Math.floor(Math.random()*10);
                ran.append(String.valueOf(a));
            }
            return ran.toString();
        }

}
