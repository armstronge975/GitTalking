/** HomeController tells Spring which file to go to next. Each JSP file gets its own "RequestMappings", or methods that return the name of the file to 
 * go to next. The value attribute of RequestMapping matches the end of an HREF or action attribute from a tag in JSP and method tells it whether to 
 * use GET or POST. SessionAttributes can be thought of as global variables shared across the whole session and all pages. These are used when data must
 * be sent across multiple pages. Models represent one page. Every time Spring goes to a different RequestMapping, it uses a new model, so it won't see
 * data you sent from a previous page UNLESS you use ModelAttributes. ModelAttributes are basically variables of a model that are only available to the 
 * next available mapping or JSP file you go to. Use model.AddAttribute("varName","value) to send data to your JSP page.
 * Use ctx to get beans specified in spring.xml. This will allow you to connect to the database. Call your DAOImpl methods here to query the database.
 * Make sure that each page has no more than 2 request mappings (1 for GET, 1 for POST)
 */

package com.foobar.gittalking;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes(value={"user","oldUserID"})
public class HomeController {
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
		model.addAttribute("user", new User());
		return "login";
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.POST)
	public String loginToSite(@ModelAttribute User user, Model model) throws SQLException {
		//Get the Spring Context
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
         
        //Get the EmployeeDAO Bean
        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);       
        boolean success = userDao.accountExists(user.getUserID(),user.getPassword());
        if(success) {
        	User loginUser = new User();        	
        	loginUser = userDao.login(user.getUserID(),user.getPassword());
        	// must set password because encrypted version is returned
        	loginUser.setPassword(user.getPassword());
        	model.addAttribute("user", loginUser);
			model.addAttribute("username", user.getUserID());
			// needed to make modelattribute available on welcome page
			// unless it's a session attribute, model attributes are only available to the single page
			model.addAttribute("newMsg", new Message());
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
		model.addAttribute("user", new User());
		return "register";
	
	}
	
	@RequestMapping(value = "/register", method= RequestMethod.POST)
	public String register(@ModelAttribute User user, Model model) {	
		try {
			//Get the Spring Context
	        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	         
	        //Get the UserDAO Bean from spring.xml
	        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);
	        
			if(!userDao.userExists(user.getUserID())) {
				System.out.println("Creating new user");
				// create new user
				userDao.register(user);
				model.addAttribute("user", user);
				model.addAttribute("username", user.getUserID());
				return "tutorial";
			}
			else {			
				model.addAttribute("message", "Username already taken");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
						
		return "register";
	}
	
	// simple mappings to pages without any forms or additional model attributes
	@RequestMapping(value = "/viewpublicrepository", method = RequestMethod.GET)
   public String loginvpr(Locale locale, Model model) {		
        return "viewpublicrepository";
    }
	
	@RequestMapping(value = "/viewpublicrepository", method = RequestMethod.POST)
   public String viewpublicrepository(@ModelAttribute User user, Model model) {
	model.addAttribute("user", user);
    return "viewpublicrepository";
   }

	@RequestMapping(value = "/pullrequest", method = RequestMethod.GET)
	   public String loginpullrequest(Locale locale, Model model) {	
	        return "pullrequest";
	    }
		
		@RequestMapping(value = "/pullrequest", method = RequestMethod.POST)
	   public String pullrequest(@ModelAttribute User user, Model model) {
		model.addAttribute("user", user);
		return "pullrequest";
    }
	
	// send public message with form
	@RequestMapping(value = "/welcome", method = RequestMethod.POST)
	public String welcome(@ModelAttribute User user, @ModelAttribute("newMsg") Message newMsg, Model model) throws SQLException {	
		model.addAttribute("userId", user.getUserID());
		newMsg.setFromUser(user.getUserID());
		//Get the Spring Context
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
         
        //Get the Beans; connect to both classes
        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);
        MessageDAO msgDao = ctx.getBean("messageDao", MessageDAO.class);
        if(userDao.userExists(newMsg.getToUser())) {
        	// create message
        	msgDao.createMessage(newMsg);
        	model.addAttribute("message", "Message Sent!");
        }
        else
        	model.addAttribute("message","Error: User doesn't exist");
        model.addAttribute("newMsg", new Message());
		return "welcome";
	}
	
	@RequestMapping(value = "/team", method = RequestMethod.GET)
	   public String loginteam(Locale locale, Model model) {		
	        return "team";
	    }
		
		@RequestMapping(value = "/team", method = RequestMethod.POST)
	   public String team(@ModelAttribute User user, Model model) {
		model.addAttribute("user", user);
	    return "team";
	   }


	@RequestMapping(value = "/about", method = RequestMethod.GET)
	   public String loginabout(Locale locale, Model model) {	
	        return "about";
	    }
		
		@RequestMapping(value = "/about", method = RequestMethod.POST)
	   public String about(@ModelAttribute User user, Model model) {
		model.addAttribute("user", user);
	    return "about";
	   }
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String returnToHome(@ModelAttribute User user, Model model) {
		System.out.println("Entering welcome GET");
		model.addAttribute("newMsg", new Message());
		return "welcome";
		
	}
	
	@RequestMapping(value = "/upcoming", method = RequestMethod.GET)
	public String upcoming(Model model) {
		return "upcoming";		
	}

	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String accountGet(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("oldUserID",user.getUserID());
		return "account";		
	}
	
	// calls database functions to edit account details
	@RequestMapping(value = "/account", method= RequestMethod.POST)
	public String account(@ModelAttribute("user")User user, @ModelAttribute("oldUserID") String oldUserID, Model model) {
		try {
			//Get the Spring Context
	        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	         
	        //Get the UserDAO Bean from spring.xml
	        UserDAO userDao = ctx.getBean("userDao", UserDAO.class);
	        if(!oldUserID.equals(user.getUserID())) {
	        	if(!userDao.userExists(user.getUserID())) {
					// update user
					userDao.updateUser(user,oldUserID);
					model.addAttribute("message", "Account successfully updated");
					model.addAttribute("oldUserID", user.getUserID());
					model.addAttribute("newMsg", new Message());
					return "welcome";
				}
				else {			
					model.addAttribute("message", "Username already taken");
				}
	        }
	        else {
	        	// update user
				userDao.updateUser(user,oldUserID);
				model.addAttribute("message", "Account successfully updated");
				model.addAttribute("username", user.getUserID());
				model.addAttribute("newMsg", new Message());
				return "welcome";				
	        }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "account";
	}
	
	// retrieves timeline information and list of received public messages
	@RequestMapping(value = "/timeline", method = RequestMethod.GET)
	public String timeline(@ModelAttribute User user, Model model) throws SQLException {
		// get database connection
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");     
        //Get the Bean from spring.xml
        TimelineDAO tlDao = ctx.getBean("timelineDao", TimelineDAO.class);
        Timeline tl = new Timeline();
        tl = tlDao.findUserTimeline(user.getUserID());
        model.addAttribute("timeline", new Timeline());
        model.addAttribute("timelineContent",tl.getContent());
        model.addAttribute("username",tl.getUserID());
        
        // get all public messages of user
        MessageDAO messageDao = ctx.getBean("messageDao", MessageDAO.class);
        List<Message> msgList = messageDao.getToMessages(user.getUserID());
        model.addAttribute("msgList",msgList);
		return "timeline";		
	}
	
	// handles update of user's timeline information
	@RequestMapping(value = "/timeline", method = RequestMethod.POST)
	public String timelinePost(@ModelAttribute("timeline") Timeline timeline,@ModelAttribute User user, Model model) throws SQLException {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
		TimelineDAO tlDao = ctx.getBean("timelineDao", TimelineDAO.class);
		tlDao.updateTimeline(timeline.getContent(), user.getUserID());
		model.addAttribute("timeline", timeline);
        model.addAttribute("timelineContent",timeline.getContent());
		model.addAttribute("username",user.getUserID());
		model.addAttribute("message", "Profile Successfully Updated");
		MessageDAO messageDao = ctx.getBean("messageDao", MessageDAO.class);
        List<Message> msgList = messageDao.getToMessages(user.getUserID());
		model.addAttribute("msgList",msgList);
		return "timeline";
	}
	
	@RequestMapping(value = "/createrepo", method = RequestMethod.GET)
	public String createRepo(Model model) {
		return "createrepo";		
	}
	
	@RequestMapping(value = "/collablist", method = RequestMethod.GET)
	public String collab(Model model) {
		return "collablist";		
	}
	
	@RequestMapping(value = "/createmessage", method = RequestMethod.GET)
	public String createMessage(Model model) {
		return "createmessage";		
	}
	
	@RequestMapping(value = "/messages", method = RequestMethod.GET)
	public String messages(Model model) {
		return "messages";		
	}
	
	@RequestMapping(value = "/publicrepos", method = RequestMethod.GET)
	public String publicRepos(Model model) {
		return "publicRepos";		
	}

	@RequestMapping(value = "/tutorial", method = RequestMethod.GET)
	public String tutorial(Model model) {
		return "tutorial";		
	}
	
	// clones of pages with similar names, but user is already logged in here 
	@RequestMapping(value = "/team2", method = RequestMethod.GET)
	public String team2(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("user", user);
		return "team2";		
	}
	
	@RequestMapping(value = "/upcoming2", method = RequestMethod.GET)
	public String upcoming2(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("user", user);
		return "upcoming2";		
	}
	
	@RequestMapping(value = "/about2", method = RequestMethod.GET)
	public String about2(@ModelAttribute("user") User user, Model model) {
		model.addAttribute("user", user);
		return "about2";		
	}
}
