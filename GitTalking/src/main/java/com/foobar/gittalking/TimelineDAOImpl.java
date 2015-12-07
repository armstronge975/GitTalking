package com.foobar.gittalking;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.sql.PreparedStatement;
import javax.sql.DataSource;
 
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class TimelineDAOImpl implements TimelineDAO {

	// references bean in spring.xml for database connection
		private DataSource dataSource;
		 
	    public void setDataSource(DataSource dataSource) {
	        this.dataSource = dataSource;
	    }
	    
	    public DataSource getDataSource() {
	    	return this.dataSource;
	    }


	@Override
	public Timeline findStandardTimeline(String userID) throws SQLException {
		String query = "SELECT * from timeline INNER JOIN standard_users ON timeline.user_id = standard_users.user_id" +
				" WHERE timeline.user_id = ? AND standard_users.user_id = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);      
        //using RowMapper anonymous class, we can create a separate RowMapper for reuse
        Timeline timeline = jdbcTemplate.queryForObject(query, new Object[]{userID,userID}, new RowMapper<Timeline>(){ 
               @Override
               public Timeline mapRow(ResultSet rs, int rowNum)
                       throws SQLException {
                   Timeline tl = new Timeline();
                   tl.setID(rs.getInt("timeline_id"));
                   tl.setContent(rs.getString("timeline_content"));
                   tl.setUserID(rs.getString("user_id"));
                   return tl;
               }}); 
        return timeline;
	}

	@Override
	public Timeline findAdminTimeline(String userID) throws SQLException {
		String query = "SELECT * from timeline INNER JOIN admin_user ON timeline.user_id = admin_user.user_id" +
				" WHERE timeline.user_id = ? AND admin_user.user_id = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);      
        //using RowMapper anonymous class, we can create a separate RowMapper for reuse
        Timeline timeline = jdbcTemplate.queryForObject(query, new Object[]{userID,userID}, new RowMapper<Timeline>(){ 
               @Override
               public Timeline mapRow(ResultSet rs, int rowNum)
                       throws SQLException {
                   Timeline tl = new Timeline();
                   tl.setID(rs.getInt("timeline_id"));
                   tl.setContent(rs.getString("timeline_content"));
                   tl.setUserID(rs.getString("user_id"));
                   return tl;
               }}); 
        return timeline;
	}
	
	@Override
    public void updateTimeline(String content,String userID) throws SQLException {
    	String query = "UPDATE timeline SET timeline_content = ? WHERE user_id = ?";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        Object[] args = new Object[] {content, userID};
        jdbcTemplate.update(query, args);
    }
}
