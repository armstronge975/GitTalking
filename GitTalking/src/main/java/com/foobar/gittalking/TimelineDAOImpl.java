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


	    // automatically occurs every time a new user is registered
	    @Override
	    public void createTimeline(String userID) throws SQLException {
	    	String query = "INSERT INTO timeline VALUES (?,'No information available', (SELECT DISTINCT(user_id) FROM users WHERE user_id = ?))";         
        	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
        	// setInt/setString fills in values of each question mark
        	// setInt is to create unique int PK. It will automatically increment
         	pstmt.setInt(1, getMaxInt() + 1);
         	pstmt.setString(2, userID);        	       	
         	pstmt.executeUpdate();    
	    }
	    
	@Override
	public Timeline findUserTimeline(String userID) throws SQLException {
		String query = "SELECT * from timeline INNER JOIN users ON timeline.user_id_fk = users.user_id WHERE timeline.user_id_fk = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);      
        //using RowMapper anonymous class, we can create a separate RowMapper for reuse
        Timeline timeline = jdbcTemplate.queryForObject(query, new Object[]{userID}, new RowMapper<Timeline>(){ 
               @Override
               public Timeline mapRow(ResultSet rs, int rowNum)
                       throws SQLException {
                   Timeline tl = new Timeline();
                   tl.setID(rs.getInt("timeline_id"));
                   tl.setContent(rs.getString("timeline_content"));
                   tl.setUserID(rs.getString("user_id_fk"));
                   return tl;
               }}); 
        return timeline;
	}
	
	@Override
    public void updateTimeline(String content,String userID) throws SQLException {
    	String query = "UPDATE timeline SET timeline_content = ? WHERE user_id_fk = ?";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        Object[] args = new Object[] {content, userID};
        jdbcTemplate.update(query, args);
    }
	
	// The PK is only useful to the system but is needed to increment the next PK
		@Override
		public int getMaxInt() throws SQLException {
			String query = "select MAX(timeline_id) from timeline";
	        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	        return jdbcTemplate.queryForInt(query);
		}
}
