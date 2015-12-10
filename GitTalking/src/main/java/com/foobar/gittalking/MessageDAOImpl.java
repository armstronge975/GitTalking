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
	
	@Override
	public void createMessage(Message message) throws SQLException{
		String query = "INSERT INTO messages VALUES (?,?,?,?,NOW(),0,0)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		Object[] args = new Object[] {getMaxInt() + 1, message.getContent(), message.getToUser(), message.getFromUser()};       
        jdbcTemplate.update(query, args);
	}
	
	// obtain all messages sent to user, sort from newest to oldest
	@Override
	public List<Message> getToMessages(String userID) throws SQLException {
		 String query = "select * from messages WHERE to_user_fk = ? ORDER BY time_sent DESC";
		 JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	        List<Message> received = new ArrayList<Message>();
	        try {
	        	Object[] args = new Object[] {userID};
		        List<Map<String,Object>> msgRows = jdbcTemplate.queryForList(query,args);
		         
		        for(Map<String,Object> msgRow : msgRows){
		            Message msg = new Message();
		            msg.setID(Integer.parseInt(String.valueOf(msgRow.get("pub_id"))));
		            msg.setFromUser(String.valueOf(msgRow.get("from_user_fk")));
		            msg.setToUser(String.valueOf(msgRow.get("to_user_fk")));
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
		String query = "select MAX(pub_id) from messages";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        return jdbcTemplate.queryForInt(query);
	}
}

