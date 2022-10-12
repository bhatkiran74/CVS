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

import com.mphasis.covidvaccine.authenticate.AdminAuthencation;
import com.mphasis.covidvaccine.entity.User;
import com.mphasis.covidvaccine.servicelayer.Adminservice;


@Controller
@RequestMapping("/Admin")
public class Admincontroller {
	
	@Autowired
	private Adminservice adminservice;
	
	@RequestMapping("/index")
	public String getIndex()
	{
		
		
		return "indexpage";
	
	}
	@RequestMapping("/adminlogin")
	public ModelAndView getadminLogin()
	{
		ModelAndView model=new ModelAndView("login-admin");
		
		return model;
	
	}
	
	@GetMapping("/userlist")
	public String getUser(@RequestParam("mobileNo") int mobileNo, @RequestParam("password") String password,Model theModel) {
		// TODO Auto-generated method stub
		AdminAuthencation A1=new AdminAuthencation();
		boolean res= A1.authenticate(mobileNo,password);
		if(res)
		{
		List<User> users= adminservice.getUser();
		theModel.addAttribute("users",users);
		
		return "user-list";
		}
		else
		{
			return "indexpage";
		}
		
		
	}

	@GetMapping("/saveuser")
	public String  saveUser(@ModelAttribute("user") User theUser,Model theModel) {
		// TODO Auto-generated method stub
		User user=new User();
		if(theUser.getMobileNo()!=0)
		{
		adminservice.getUpdate(theUser);
		}
		List<User> users= adminservice.getUser();
		theModel.addAttribute("users",users);
		
		return "user-list";
		
	}
	@GetMapping("/backuser")
	public String  backUser(@ModelAttribute("user") User theUser,Model theModel) {
		// TODO Auto-generated method stub
	
		List<User> users= adminservice.getUser();
		theModel.addAttribute("users",users);
		
		return "user-list";
		
	}
	@GetMapping("/updateuser")
	public String  upadteUser(@RequestParam("userId") int userId, 
			Model theModel) {
		// TODO Auto-generated method stub
		// Getting specific customer data from database via Service
		User user = adminservice.getUser(userId);	
		// Setting customer data to Model Attribute to pre-populate the form 
		theModel.addAttribute("user", user);
		// This is a key player here ---- because this will be used by form to pre-populate the data
		// Sending over the actual form
		 int t=user.getTotalVaccine();
		  if(t==0)
		   {
				return "aupdateatzerodose-user";
		   }
		   else if(t==1)
		   {
			   return "aupdateatfirstdose-user";
			   
		   }
		   else
			   return "aupdate-user";
	
	}

	@GetMapping("/getuser")
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return adminservice.getUser(userId);
	}

	@GetMapping("/deleteuser/{userId}")
	public String deleteUser(@PathVariable("userId") int userId,Model theModel) {
		// TODO Auto-generated method stub
		adminservice.deleteUser(userId);
           
		List<User> users= adminservice.getUser();
		theModel.addAttribute("users",users);
		
		return "user-list";
	}



}
