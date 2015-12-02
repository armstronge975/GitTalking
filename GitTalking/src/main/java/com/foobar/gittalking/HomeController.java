package com.foobar.gittalking;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {			
		return "index";
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.POST)
	public String loginToSite(Locale locale, Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/register", method= RequestMethod.POST)
	public String register(Locale locale, Model model) {
		return "register";
	}
	
	@RequestMapping(value = "/tutorial", method = RequestMethod.GET)
    public String login(Locale locale, Model model) {
        return "tutorial";
    }
	
	@RequestMapping(value = "/welcome", method = RequestMethod.POST)
	public String welcome(@Validated User user, Model model) {	
		model.addAttribute("userId", user.getUserID());
		return "welcome";
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String returnToHome(Model model) {		
		return "welcome";
	}
}
