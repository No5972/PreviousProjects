package io.github.no5972.dbsp.services;

import io.github.no5972.dbsp.models.Admin;

public interface AdminService {
	public Admin getLogin(String username, String password);
	public void changePassword(String username, String newPassword);
}
