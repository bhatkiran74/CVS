package com.mphasis.covidvaccine.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mphasis.covidvaccine.entity.User;

@Repository
public class AdmindaoImp implements Admindao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> getUser() {
		        // TODO Auto-generated method stub
				// get the current hibernate session object
				
				Session currentSession = sessionFactory.getCurrentSession();
				
				// get the Query object
				
				Query<User> theQuery = 
						currentSession.createQuery("from User",User.class);
				
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
		
		 currentSession.saveOrUpdate(user);
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

}
