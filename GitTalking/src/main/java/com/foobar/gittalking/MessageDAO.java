package com.foobar.gittalking;

import java.util.List;
import java.sql.*;

public interface MessageDAO {
	
	public List<Message> getToMessages(String userID) throws SQLException;
	public int getMaxInt() throws SQLException;
}
