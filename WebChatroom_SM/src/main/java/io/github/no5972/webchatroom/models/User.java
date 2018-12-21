package io.github.no5972.webchatroom.models;

public class User {

	private int id;
	private String name;
	private User() {}
	
	private static class UserInstance {
		private final static User instance = new User();
	}
	
	public static User getInstance() {
		return UserInstance.instance;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
