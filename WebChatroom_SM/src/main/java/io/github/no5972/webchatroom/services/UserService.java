package io.github.no5972.webchatroom.services;

import java.util.List;

import io.github.no5972.webchatroom.models.User;

public interface UserService {
	public List<User> getAllUsers();
	public boolean login(String name);
	public void logout(int id);
	public User getUserId(String name);
}
