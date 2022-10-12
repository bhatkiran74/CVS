package com.mphasis.covidvaccine.servicelayer;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mphasis.covidvaccine.DAO.Userdao;
import com.mphasis.covidvaccine.entity.User;

@Service
@Component
public class UserserviceImp implements Userservice {

	//Inject UserDAO
	
	@Autowired
	private Userdao userdao;
	
	@Transactional
	public List<User> getUsers(int mobileNo) {
		// TODO Auto-generated method stub
		return userdao.getUsers(mobileNo);
	}

	@Transactional
	public void addUser(User user) {
		// TODO Auto-generated method stub
          userdao.addUser(user);
	}
 
	@Transactional
	public void getUpdate(User user) {
		// TODO Auto-generated method stub
		
		 userdao.getUpdate(user);
	}
	@Transactional
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return userdao.getUser(userId);
	}
	@Transactional
	public void deleteUser(int userId) {
		// TODO Auto-generated method stub
           userdao.deleteUser(userId);
	}

	@Override
	@Transactional
	public void deleteUsers(int mobileNo) {
		// TODO Auto-generated method stub
		userdao.deleteUsers(mobileNo);
	}

}
