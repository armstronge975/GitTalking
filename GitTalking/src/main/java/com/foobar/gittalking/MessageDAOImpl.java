package com.foobar.gittalking;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.sql.DataSource;
import java.util.ArrayList;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MessageDAOImpl implements MessageDAO {

	// references bean in spring.xml for database connection
			private DataSource dataSource;
			 
		    public void setDataSource(DataSource dataSource) {
		        this.dataSource = dataSource;
		    }
		    
		    public DataSource getDataSource() {
		    	return this.dataSource;
		    }
	
		    // obtain all messages sent to user, sort from newest to oldest
	@Override
	public List<Message> getToMessages(String userID) throws SQLException {
		 String query = "select * from public_message WHERE to_user = ? ORDER BY time_sent DESC";
		 JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	        List<Message> received = new ArrayList<Message>();
	        try {
	        	Object[] args = new Object[] {userID};
		        List<Map<String,Object>> msgRows = jdbcTemplate.queryForList(query,args);
		         
		        for(Map<String,Object> msgRow : msgRows){
		            Message msg = new Message();
		            msg.setID(Integer.parseInt(String.valueOf(msgRow.get("pub_id"))));
		            msg.setFromUser(String.valueOf(msgRow.get("from_user")));
		            msg.setToUser(String.valueOf(msgRow.get("to_user")));
		            msg.setContent(String.valueOf(msgRow.get("public_messagecontent")));
		            msg.setTimeSent((Timestamp)msgRow.get("time_sent"));
		            msg.setLikes(Integer.parseInt(String.valueOf(msgRow.get("likes"))));
		            msg.setComments(Integer.parseInt(String.valueOf(msgRow.get("comments"))));
		            received.add(msg);
		        }
		        return received;
		        }
		        catch(Exception ex) {
		        		return null;
			        }
		        }	        	                	    
	
	// The PK is only useful to the system but is needed to increment the next PK
	@Override
	public int getMaxInt() throws SQLException {
		String query = "select MAX(pub_id) from public_message";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        return jdbcTemplate.queryForInt(query);
	}
}

