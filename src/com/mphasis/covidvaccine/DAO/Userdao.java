package com.mphasis.covidvaccine.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mphasis.covidvaccine.entity.User;

public interface Userdao {

	public List<User> getUsers(int mobileNo);
	
	public void addUser(User user);
	
	public void getUpdate(User user);
	
	public User getUser(int userId);
	
	public void deleteUser(int userId);
	
	public void deleteUsers(int mobileNo);
}