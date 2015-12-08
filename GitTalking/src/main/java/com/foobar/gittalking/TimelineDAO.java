package com.foobar.gittalking;

import java.sql.*;

public interface TimelineDAO {
	public Timeline findStandardTimeline(String userID) throws SQLException;
	public Timeline findAdminTimeline(String userID) throws SQLException;
	public void updateTimeline(String content,String userID) throws SQLException;
	public int getMaxInt() throws SQLException;
}
