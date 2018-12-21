package io.github.no5972.webchatroom.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.webchatroom.dao.MessageDao;
import io.github.no5972.webchatroom.dao.UserDao;
import io.github.no5972.webchatroom.models.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userDao.getAllUsers();
	}

	@Override
	public boolean login(String name) {
		// TODO Auto-generated method stub
		if (userDao.isNameExists(name)!=null) return false;
		userDao.login(name);
		messageDao.insertMessage(1, userDao.isNameExists(name).getId(), new Date(), null, 0, null, null);
		return true;
	}

	@Override
	public void logout(int id) {
		// TODO Auto-generated method stub
		userDao.logout(id);
	}

	@Override
	public User getUserId(String name) {
		// TODO Auto-generated method stub
		return userDao.isNameExists(name);
	}

}
