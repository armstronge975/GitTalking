package com.foobar.gittalking;

import java.util.List;
import java.sql.SQLException;

public interface UserDAO {
	
		// add user
		public void register(User user) throws SQLException;
		// read user; check that user ID isn't already taken when registering user
		public boolean userIDAvailable(String userID) throws SQLException;
		// user login
		public User login(String userID, String password);
		// authenticate credentials during login
		public boolean accountExists(String userID, String password) throws SQLException;
		public boolean accountInAdmin(String userID, String password) throws SQLException;
		public boolean accountInStandard(String userID, String password) throws SQLException;
		// update account details for standard users
		public void updateUser(User user) throws SQLException;
    }
    
    


