package com.mphasis.covidvaccine.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mphasis.covidvaccine.authenticate.LoginAuthencation;
import com.mphasis.covidvaccine.entity.User;
import com.mphasis.covidvaccine.servicelayer.Userservice;

@Controller
@RequestMapping("/Home")
public class Usercontroller {
	 //Inject userService Layer
		@Autowired
		private Userservice userservice;
		
		
		@RequestMapping("/index")
		public String getIndex()
		{
			
			
			return "indexpage";
		
		}
		@RequestMapping("/register")
		public String getRegister(Model theModel)
		{
			 User user=new User();
	          
	         theModel.addAttribute("user", user);
		
			return "register-user";
		
		}
		
		@RequestMapping("/userlogin")
		public ModelAndView getUserLogin()
		{
			ModelAndView model=new ModelAndView("login-user");
			
			return model;
		
		}
		@GetMapping("/userlist")
		public String getUsers(@RequestParam("mobileNo") int mobileNo, @RequestParam("password") String password,Model theModel) {
			// TODO Auto-generated method stub
			
			LoginAuthencation A1=new LoginAuthencation();
			boolean res= A1.authenticate(mobileNo,password);
			if(res)
			{
			List<User> users= userservice.getUsers(mobileNo);
			theModel.addAttribute("users",users);
			
			return "user-home";
			}
			else
			{
				return "indexpage";
			}
		}
		
		@GetMapping("/adduser")
		public String addUser(Model theModel) {
			// TODO Auto-generated method stub
	          User user=new User();
	          
	          theModel.addAttribute("user", user);
	          
	          return "add-user";
	         
		}
		@GetMapping("/updateuser")
		public String  upadteUser(@RequestParam("userId") int userId, 
				Model theModel) {
			// TODO Auto-generated method stub
			// Getting specific customer data from database via Service
			User user = userservice.getUser(userId);	
			// Setting customer data to Model Attribute to pre-populate the form 
			theModel.addAttribute("user", user);
			// This is a key player here ---- because this will be used by form to pre-populate the data
			// Sending over the actual form
			   int t=user.getTotalVaccine();
				  if(t==0)
				   {
						return "updateatzerodose-user";
				   }
				   else if(t==1)
				   {
					   return "updateatfirstdose-user";
					   
				   }
				   else
					   return "update-user";
					  
		
		}
		
		@GetMapping("/scheduleuser")
		public String  scheduleUser(@RequestParam("userId") int userId, 
				Model theModel) {
			// TODO Auto-generated method stub
			
			// Getting specific customer data from database via Service
			User user = userservice.getUser(userId);	
			// Setting customer data to Model Attribute to pre-populate the form 
			theModel.addAttribute("user", user);
			// This is a key player here ---- because this will be used by form to pre-populate the data
			// Sending over the actual form
		   int t=user.getTotalVaccine();
		  if(t==0)
		   {
			 return "firstdoseschedule-user";
		   }
		   else if(t==1)
		   {
			   return "seconddoseschedule-user";
			   
		   }
		   else
			   return "twodosesucess-user";
			  
			  
		}
		
		@GetMapping("/deleteuser/{userId}")
		public String deleteUser(@PathVariable("userId") int userId,@RequestParam("mobileNo") int mobileNo,Model theModel) {
			// TODO Auto-generated method stub
	           userservice.deleteUser(userId);
	           List<User> users= userservice.getUsers(mobileNo);
				theModel.addAttribute("users",users);
				
				return "user-home";
		}
		
		@PostMapping("/schedulesaveuser")
		public String  scheduleSave(@ModelAttribute("user") User theuser,@RequestParam("mobileNo") int mobileNo,Model theModel) {
			// TODO Auto-generated method stub
			userservice.getUpdate( theuser);
			List<User> users= userservice.getUsers(mobileNo);
			theModel.addAttribute("users",users);
			
			return "user-home";
			
		}
	    
		
		@GetMapping("/saveuser")
		public String  saveUser(@ModelAttribute("user") User theuser,@RequestParam("mobileNo") int mobileNo,Model theModel) {
			// TODO Auto-generated method stub
			if(theuser.getAge()!=0)
			{
			userservice.getUpdate(theuser);
			}
			List<User> users= userservice.getUsers(mobileNo);
			theModel.addAttribute("users",users);
			
			return "user-home";
			
		}
		@GetMapping("/backuser")
		public String  backUser(@ModelAttribute("user") User theuser,@RequestParam("mobileNo") int mobileNo,Model theModel) {
			// TODO Auto-generated method stub
		
			List<User> users= userservice.getUsers(mobileNo);
			theModel.addAttribute("users",users);
			
			return "user-home";
			
		}
		
		@GetMapping("/savereguser")
		public String  saveRegUser(@ModelAttribute("user") User theuser) {
			// TODO Auto-generated method stub
			userservice.getUpdate(theuser);
	
			return "cred-user";
			
		}
	    
		@GetMapping("/credentialsuser")
		public String getcredUser(@RequestParam("mobileNo") int mobileNo,@RequestParam("password") String password,@RequestParam("confirmpassword") String confirmpassword,Model theModel) {
			// TODO Auto-generated method stub
			if(password.equals(confirmpassword))
			{
			LoginAuthencation A1=new LoginAuthencation();
			 A1.addcred(mobileNo,password);
			}
			else
			{
				userservice.deleteUsers(mobileNo);
			}
				return "indexpage";
		
		}

		@GetMapping("/getuser")
		public User getUser(int userId) {
			// TODO Auto-generated method stub
			return userservice.getUser(userId);
		}


		
		}
		

