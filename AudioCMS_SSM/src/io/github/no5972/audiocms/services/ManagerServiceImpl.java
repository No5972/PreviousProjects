package io.github.no5972.audiocms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.audiocms.dao.ManagerDao;
import io.github.no5972.audiocms.models.Manager;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerDao md;
	
	@Override
	public Manager checkLogin(String account, String password) {
		// TODO Auto-generated method stub
		return md.getLogin(account, password);
	}

	@Override
	public void changePassword(int id, String newPassword) {
		// TODO Auto-generated method stub 
		md.updatePassword(id, newPassword);
	}

	@Override
	public void addLoginCount(int id) {
		// TODO Auto-generated method stub
		//System.out.println("Login count: "+md.getLoginCount(id));
		md.updateLoginCount(id, md.getLoginCount(id)+1);
	}

	@Override
	public int getManagerId(String account) {
		// TODO Auto-generated method stub
		return md.getManagerId(account);
	}

	@Override
	public String getManagerAccount(int id) {
		// TODO Auto-generated method stub
		return md.getManagerAccount(id);
	}

}
