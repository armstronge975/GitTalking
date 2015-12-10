package com.foobar.gittalking;

import java.sql.SQLException;

public interface UserDAO {
	
		// add user
		public void register(User user) throws SQLException;
		// user login
		public User login(String userID, String password);
		// authenticate credentials during login
		public boolean userExists(String userID) throws SQLException;
		public boolean accountExists(String userID, String password) throws SQLException;
		// update account details
		public void updateUser(User user, String oldUserID) throws SQLException;
    }
    
    


