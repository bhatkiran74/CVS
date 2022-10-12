package com.mphasis.covidvaccine.servicelayer;

import java.util.List;

import com.mphasis.covidvaccine.entity.User;

public interface Adminservice {
       
    public List<User> getUser();
	
	public void addUser(User user);
	
	public void getUpdate(User user);
	
	public User getUser(int userId);
	
	public void deleteUser(int userId);
}