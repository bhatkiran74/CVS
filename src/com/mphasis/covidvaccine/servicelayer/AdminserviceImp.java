package com.mphasis.covidvaccine.servicelayer;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mphasis.covidvaccine.DAO.Admindao;
import com.mphasis.covidvaccine.entity.User;

@Service
@Component
public class AdminserviceImp implements Adminservice {

	@Autowired
	private Admindao admindao;
	
	@Transactional
	@Override
	public List<User> getUser() {
		// TODO Auto-generated method stub
		return admindao.getUser();
	}

	@Transactional
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		admindao.addUser(user);
	}

	@Transactional
	@Override
	public void getUpdate(User user) {
		// TODO Auto-generated method stub
		admindao.getUpdate(user);
	}

	@Transactional
	@Override
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return admindao.getUser(userId);
	}

	@Transactional
	@Override
	public void deleteUser(int userId) {
		// TODO Auto-generated method stub
		admindao.deleteUser(userId);
	}

}
