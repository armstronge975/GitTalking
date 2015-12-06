package com.foobar.gittalking;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	//private UserDelegate userDelegate;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {				
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String homePost(Locale locale, Model model) {				
		return "index";
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.GET)
	public String goToLogin(Model model) {
		System.out.println("Enter /login GET mapping");
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.POST)
	public String loginToSite(@ModelAttribute User user, Model model) throws SQLException {
		System.out.println("Enter /login POST mapping");
		//Get the Spring Context
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
         
        //Get the EmployeeDAO Bean
        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);       
        boolean success = userDao.accountExists(user.getUserID(),user.getPassword());
        if(success) {
        	User loginUser = new User();
        	loginUser = userDao.login(user.getUserID(),user.getPassword());
        	System.out.println("User found: username " + loginUser.getUserID() + ", password: " + loginUser.getPassword());
        	model.addAttribute("user", loginUser);
			model.addAttribute("username", user.getUserID());
			return "welcome";
        }
        else {
        	System.out.println("Invalid credentials");
        	model.addAttribute("message", "Error: Invalid Credentials");
        	return "login";
        }
	}
	
	@RequestMapping(value = "/register", method= RequestMethod.GET)	
	public String registerUser(Model model) {
		System.out.println("Enter /register GET mapping");		
		model.addAttribute("user", new User());
		return "register";
	
	}
	
	@RequestMapping(value = "/register", method= RequestMethod.POST)
	public String register(@ModelAttribute User user, Model model) {
		System.out.println("Enter /register POST mapping");
		System.out.println("User ID: " + user.getUserID());
	
		try {
			//Get the Spring Context
	        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	         
	        //Get the UserDAO Bean from spring.xml
	        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);
	        
			if(userDao.userIDAvailable(user.getUserID())) {
				System.out.println("Creating new user");
				System.out.println("Account type: " + user.getAccountType());
				// create new user
				userDao.register(user);
				model.addAttribute("user", user);
				model.addAttribute("username", user.getUserID());
				return "tutorial";
			}
			else {			
				System.out.println("Name already taken");
				model.addAttribute("message", "Username already taken");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
						
		return "register";
	}
	
	@RequestMapping(value = "/tutorial", method = RequestMethod.GET)
    public String login(Locale locale, Model model) {
		System.out.println("Enter /tutorial GET mapping");		
        return "tutorial";
    }
	
	@RequestMapping(value = "/tutorial", method = RequestMethod.POST)
    public String go(@ModelAttribute User user, Model model) {
		System.out.println("Enter /tutorial POST mapping");
		model.addAttribute("user", user);
        return "tutorial";
    }
	
	@RequestMapping(value = "/viewpublicrepository", method = RequestMethod.GET)
   public String loginvpr(Locale locale, Model model) {
		System.out.println("Enter /viewpublicrepository GET mapping");		
        return "viewpublicrepository";
    }
	
	@RequestMapping(value = "/viewpublicrepository", method = RequestMethod.POST)
   public String viewpublicrepository(@ModelAttribute User user, Model model) {
	System.out.println("Enter /viewpublicrepository POST mapping");
	model.addAttribute("user", user);
    return "viewpublicrepository";
   }
	
	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	   public String logintline(Locale locale, Model model) {
			System.out.println("Enter /timeline GET mapping");		
	        return "timeline";
	    }
		
		@RequestMapping(value = "/timeline", method = RequestMethod.POST)
	   public String timeline(@ModelAttribute User user, Model model) {
		System.out.println("Enter /timeline POST mapping");
		model.addAttribute("user", user);
	    return "timeline";
	   }


	@RequestMapping(value = "/pullrequest", method = RequestMethod.GET)
	   public String loginpullrequest(Locale locale, Model model) {
			System.out.println("Enter /pullrequest GET mapping");		
	        return "pullrequest";
	    }
		
		@RequestMapping(value = "/pullrequest", method = RequestMethod.POST)
	   public String pullrequest(@ModelAttribute User user, Model model) {
		System.out.println("Enter /pullrequest POST mapping");
		model.addAttribute("user", user);
	    return "pullrequest";
	   }	
	
	
	@RequestMapping(value = "/welcome", method = RequestMethod.POST)
	public String welcome(@ModelAttribute User user, Model model) {	
		model.addAttribute("userId", user.getUserID());
		System.out.println("Enter /welcome POST mapping");
		return "welcome";
	}
	//Added by Rich C.
	@RequestMapping(value = "/yourPRofile", method= RequestMethod.GET)
	public String goToLoginProfile(Model model) {
		System.out.println("Enter /login GET mapping");
		model.addAttribute("user", new User());
		return "yourPRofile";
	}
	
	@RequestMapping(value = "/team", method = RequestMethod.GET)
	   public String loginteam(Locale locale, Model model) {
			System.out.println("Enter /team GET mapping");		
	        return "team";
	    }
		
		@RequestMapping(value = "/team", method = RequestMethod.POST)
	   public String team(@ModelAttribute User user, Model model) {
		System.out.println("Enter /team POST mapping");
		model.addAttribute("user", user);
	    return "team";
	   }


	@RequestMapping(value = "/about", method = RequestMethod.GET)
	   public String loginabout(Locale locale, Model model) {
			System.out.println("Enter /about GET mapping");		
	        return "about";
	    }
		
		@RequestMapping(value = "/about", method = RequestMethod.POST)
	   public String about(@ModelAttribute User user, Model model) {
		System.out.println("Enter /about POST mapping");
		model.addAttribute("user", user);
	    return "about";
	   }
	
	
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String returnToHome(Model model) {	
		System.out.println("Enter /welcome GET mapping");
		return "welcome";
		
	}
	
	@RequestMapping(value = "/upcoming", method = RequestMethod.GET)
	public String upcoming(Model model) {
		System.out.println("Enter /upcoming GET mapping");
		return "upcoming";
		
	}
	
	@RequestMapping(value = "/account", method= RequestMethod.POST)
	public String account(@ModelAttribute User user, Model model) {
		try {
			//Get the Spring Context
	        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	         
	        //Get the UserDAO Bean from spring.xml
	        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);
	        
			if(userDao.userIDAvailable(user.getUserID())) {
				// update user
				userDao.updateUser(user);
				return "welcome";
			}
			else {			
				System.out.println("Name already taken");
				model.addAttribute("message", "Username already taken");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "account";
	}
}
