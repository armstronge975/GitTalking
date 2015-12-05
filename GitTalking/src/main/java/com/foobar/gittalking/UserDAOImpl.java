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

public class UserDAOImpl implements UserDAO {
	private DataSource dataSource;
	 
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    public DataSource getDataSource() {
    	return this.dataSource;
    }
    
    @Override
    public void register(User user) throws SQLException {
    		String query = "INSERT INTO standard_users VALUES (?,?,?,?,?,AES_ENCRYPT(?,'.key.'))";         
        	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
         	pstmt.setString(1, user.getUserID());
         	pstmt.setString(2, user.getFirstName());
         	pstmt.setString(3, user.getLastName());
         	pstmt.setString(4, user.getAccountType());
         	pstmt.setString(5, user.getEmail());
         	pstmt.setString(6, "'" + user.getPassword() + "'");
         	
         	int result = pstmt.executeUpdate();
         	if(result != 0) 
         		System.out.println("Insert successful");         	   	    	
    }
    
    // check if userID available
    @Override
    public boolean userIDAvailable(String userID) throws SQLException {
    	String query = "SELECT count(*) from standard_users, admin_user WHERE standard_users.user_id = ? OR admin_user.user_id = ?";
    	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
    	pstmt.setString(1, userID);
    	pstmt.setString(2, userID);
    	ResultSet resultSet = pstmt.executeQuery();
    	return (resultSet.next() && resultSet.getInt(1) == 0);
    }
    
    // checks if user enters valid username and password when logging in
    //@Override
    //public boolean accountExists(String userID,String password) throws SQLException {
    	
    //}
    
    @SuppressWarnings("finally")
	@Override
    public User login(String userID, String password) {
    	User user = null;
    	String query;
    	try {
    		if (accountInAdmin(userID, password)) {
    			query = "SELECT * from admin_user WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
    			 JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
                 
    	            //using RowMapper anonymous class, we can create a separate RowMapper for reuse
    	            user = jdbcTemplate.queryForObject(query, new Object[]{userID, password}, new RowMapper<User>(){
    	     
    	                @Override
    	                public User mapRow(ResultSet rs, int rowNum)
    	                        throws SQLException {
    	                    User user = new User();
    	                    user.setUserID(rs.getString("user_id"));
    	                    user.setFirstName(rs.getString("admin_firstname"));
    	                    user.setLastName(rs.getString("admin_lastname"));
    	                    user.setPassword(rs.getString("password"));
    	                    return user;
    	                }});   
    		}
    		else {
    			query = "SELECT * from standard_users WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
    			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
                
                //using RowMapper anonymous class, we can create a separate RowMapper for reuse
                user = jdbcTemplate.queryForObject(query, new Object[]{userID, password}, new RowMapper<User>(){
         
                    @Override
                    public User mapRow(ResultSet rs, int rowNum)
                            throws SQLException {
                        User user = new User();
                        user.setUserID(rs.getString("user_id"));
                        user.setFirstName(rs.getString("first_name"));
                        user.setLastName(rs.getString("last_name"));
                        user.setEmail(rs.getString("email"));
                        user.setAccountType(rs.getString("account_type"));
                        user.setPassword(rs.getString("password"));
                        return user;
                    }});  
    		}    		                     
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	finally {
    		return user;
    	}		
    }

	// determine if input username is unique from current database records
	@Override
	public boolean accountExists(String userID, String password) throws SQLException {
		try {
			String query = "SELECT count(*) from admin_user WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
			String query2 = "SELECT count(*) from standard_users WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
	    	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
	    	PreparedStatement pstmt2 = dataSource.getConnection().prepareStatement(query2);
	    	pstmt.setString(1, userID);
	    	pstmt.setString(2, password);	    	
	    	ResultSet resultSet = pstmt.executeQuery();
	    	pstmt2.setString(1, userID);
	    	pstmt2.setString(2, password);
	    	ResultSet resultSet2 = pstmt2.executeQuery();
	    	return (resultSet.next() && resultSet2.next() && (resultSet.getInt(1) == 1 || resultSet2.getInt(1) == 1));
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return false;
	}
	
	public boolean accountInAdmin(String userID, String password) throws SQLException {
		String query = "SELECT count(*) from admin_user WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, userID);
    	pstmt.setString(2, password);	    	
    	ResultSet resultSet = pstmt.executeQuery();
    	return (resultSet.next() && resultSet.getInt(1) == 1);
	}
	
	public boolean accountInStandard(String userID, String password) throws SQLException {
		String query = "SELECT count(*) from standard_users WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
		PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
		pstmt.setString(1, userID);
    	pstmt.setString(2, password);	    	
    	ResultSet resultSet = pstmt.executeQuery();
    	return (resultSet.next() && resultSet.getInt(1) == 1);
	}
}
