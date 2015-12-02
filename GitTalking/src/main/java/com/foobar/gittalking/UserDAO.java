package com.foobar.gittalking;

import java.util.List;

public interface UserDAO {
	
		// add user
		public void register(User user);
		// read user
		public User checkUserID(String userID);
    }
    
    


