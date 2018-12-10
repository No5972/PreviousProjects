package io.github.no5972.listener;

import javax.servlet.ServletContextEvent;  
import javax.servlet.ServletContextListener;  
  
public class Listener implements ServletContextListener {  
    @Override  
    public void contextInitialized(ServletContextEvent servletContextEvent) {  
        String webroot = servletContextEvent.getServletContext().getRealPath("/");  
        System.setProperty("webapp.root", webroot);  
    }  
  
    @Override  
    public void contextDestroyed(ServletContextEvent servletContextEvent) {  
    }  
}