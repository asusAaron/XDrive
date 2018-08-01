package com.model.tools.system;

import com.model.db.DBUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")
public class Filter implements javax.servlet.Filter
{
    public void destroy()
    {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException
    {
        try
        {
            chain.doFilter(req, resp);
        } finally
        {
            DBUtils.close();
        }
    }

    public void init(FilterConfig config) throws ServletException
    {

    }

}
