package com.mphasis.covidvaccine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/covid")
public class Indexcontroller {

	@RequestMapping("/index")
	public ModelAndView getIndex()
	{
		ModelAndView model=new ModelAndView("indexpage");
		
		return model;
	
	}
	
	
	
}