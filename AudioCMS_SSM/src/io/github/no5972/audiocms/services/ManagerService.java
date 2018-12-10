package io.github.no5972.audiocms.services;

import io.github.no5972.audiocms.models.Manager;

public interface ManagerService {
	public Manager checkLogin(String account, String password);
	public void addLoginCount(int id);
	public void changePassword(int id, String newPassword);
	public int getManagerId(String account);
	public String getManagerAccount(int id);
}
