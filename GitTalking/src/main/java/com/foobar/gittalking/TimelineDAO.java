package com.foobar.gittalking;

import java.sql.*;

public interface TimelineDAO {
	public Timeline findUserTimeline(String userID) throws SQLException;
	public void updateTimeline(String content,String userID) throws SQLException;
	public int getMaxInt() throws SQLException;
}
