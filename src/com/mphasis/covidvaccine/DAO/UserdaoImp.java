package com.mphasis.covidvaccine.DAO;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mphasis.covidvaccine.entity.User;

@Repository
public class UserdaoImp implements Userdao {
	
	//Inject SessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getUsers(int mobileNo) {
		// TODO Auto-generated method stub
		
		// get the current hibernate session object
		
			Session currentSession = sessionFactory.getCurrentSession();
		
		// get the Query object
		
			Query<User> theQuery = 
				currentSession.createQuery("from User s Where mobileNo=:mobileNo", User.class);
		      theQuery.setParameter("mobileNo",mobileNo);
		// Execute the query and get the result i.e. list of customer objects
		
			List<User> users = theQuery.getResultList();
		
		// returning this List of Customers
			return users;

				
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		// get the current hibernate session object
		
			Session currentSession = sessionFactory.getCurrentSession();
		
			currentSession.saveOrUpdate(user);
	}

	@Override
	public void getUpdate(User user) {
		// TODO Auto-generated method stub
		
		// get the current hibernate session object
         	Session currentSession = sessionFactory.getCurrentSession();
		
         	currentSession.merge(user);
			
	}

	@Override
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		// get the current hibernate session object
		
	        Session currentSession = sessionFactory.getCurrentSession();
	   
	   // Retrieve the object required object from database using theId
	        User user = currentSession.get(User.class, userId);
	   
		   return user;
	}
    
	@Override
	public void deleteUser(int userId) {
		// TODO Auto-generated method stub
		// get the current hibernate session object
		
		   Session currentSession = sessionFactory.getCurrentSession(); 
		   
		// get the Query object
			
		    Query theQuery = 
		 			currentSession.createQuery("DELETE From User u WHERE u.userId= :userId AND u.totalVaccine= :totalVaccine");
		// set the value of parameter
			theQuery.setParameter("userId",userId);
			theQuery.setParameter("totalVaccine",2);
			
			theQuery.executeUpdate();		
	}

	@Override
	public void deleteUsers(int mobileNo) {
		// TODO Auto-generated method stub
		// get the current hibernate session object
		
		   Session currentSession = sessionFactory.getCurrentSession(); 
		   
		// get the Query object
			
		    Query theQuery = 
		 			currentSession.createQuery("DELETE From User u WHERE u.mobileNo= :mobileNo ");
		// set the value of parameter
			theQuery.setParameter("mobileNo",mobileNo);
			theQuery.executeUpdate();
	}



}
