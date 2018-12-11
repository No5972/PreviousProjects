package io.github.no5972.dbsp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.dbsp.dao.AdminDao;
import io.github.no5972.dbsp.models.Admin;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	public AdminDao ad;
	
	@Override
	public Admin getLogin(String username, String password) {
		// TODO Auto-generated method stub
		return ad.getLogin(username, password);
	}

	@Override
	public void changePassword(String username, String newPassword) {
		// TODO Auto-generated method stub
		ad.updatePassword(username, newPassword);
	}

}
