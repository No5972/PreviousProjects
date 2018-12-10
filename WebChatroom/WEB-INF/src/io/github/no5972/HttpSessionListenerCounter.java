package io.github.no5972;

import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;

public class HttpSessionListenerCounter implements HttpSessionListener {

	/* Session创建事件 */
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	/* Session失效事件 */
	public void sessionDestroyed(HttpSessionEvent se) {  
		HttpSession session=se.getSession();
		String username = (String) session.getAttribute("userName");
		List<String> onlineUserList = new ArrayList();
		try {
			FileReader in=new FileReader("users.dat");
			BufferedReader br=new BufferedReader(in);
			String str;
			while((str=br.readLine()) != null ){
				onlineUserList.add(str);
			}
			in.close();
			FileWriter oup=new FileWriter("users.dat");
			for (int i=0;i<onlineUserList.size();i++) {
				if (!onlineUserList.get(i).equals(username)) {
					oup.write(onlineUserList.get(i));
					oup.write("\r\n");
				}
			}
			oup.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}