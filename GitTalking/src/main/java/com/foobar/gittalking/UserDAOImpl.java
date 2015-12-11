package com.foobar.gittalking;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.sql.DataSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

// class designated to all Database connections related to user beans
public class UserDAOImpl implements UserDAO {
	// references bean in spring.xml for database connection
	private DataSource dataSource;
	 
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    public DataSource getDataSource() {
    	return this.dataSource;
    }
    
    // creates a standard user based on user input
    // uses traditional JDBC code 
    // AES_ENCRYPT is a way to encrypt your data when entering it into the database; its arguments are the field to encrypt followed by a programmer-selected key
    @Override
    public void register(User user) throws SQLException {
    		String query = "INSERT INTO users VALUES (?,?,?,?,?,AES_ENCRYPT(?,'.key.'),'standard')";
        	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
        	// setString fills in values of each question mark
         	pstmt.setString(1, user.getUserID());
         	pstmt.setString(2, user.getFirstName());
         	pstmt.setString(3, user.getLastName());
         	pstmt.setString(4, user.getAccountType());
         	pstmt.setString(5, user.getEmail());
         	pstmt.setString(6, user.getPassword());
         	pstmt.executeUpdate();    
         	
         	// Automatically create timeline as well
         	// get database connection
    		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");     
            //Get the Bean from spring.xml
            TimelineDAO tlDao = ctx.getBean("timelineDao", TimelineDAO.class);
         	tlDao.createTimeline(user.getUserID());       	
    }
    
    // update standard user when they edit their account details
    // This method uses JDBCTemplate, a spring class used to reduce the amount of code needed to run queries
    @Override
    public void updateUser(User user,String oldUserID) throws SQLException {
    	String query = "UPDATE users SET user_id = ?, first_name = ?, last_name = ?, account_type = ?, email = ?, password = AES_ENCRYPT(?,'.key.') WHERE user_id = ?";
    	//String query = "UPDATE users SET user_id = ?, first_name = ?, last_name = ?, account_type = ?, email = ?, password = ? WHERE user_id = ?";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
    	System.out.println("UPDATE users SET user_id = " + user.getUserID() + ", first_name = " + user.getFirstName() + ", last_name = " + user.getLastName() + ", account_type = " + user.getAccountType() + ", email = " + user.getEmail() + ", password = " + user.getPassword() + " WHERE user_id = " + oldUserID);
        Object[] args = new Object[] {user.getUserID(), user.getFirstName(), user.getLastName(),user.getAccountType(),user.getEmail(),user.getPassword(),oldUserID};
        jdbcTemplate.update(query, args);
    }
    
 // check if userID  in users
    @Override
    public boolean userExists(String userID) throws SQLException {
    	String query = "SELECT count(*) from users WHERE user_id = ?";
    	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
    	pstmt.setString(1, userID);  	
    	ResultSet resultSet = pstmt.executeQuery();
    	return (resultSet.next() && resultSet.getInt(1) == 1);
    }
    
    // authenticate during login
    // AES_DECRYPT used to read encrypted fields in database. All are based on the key, which can be any value but must match the Encrypt key
 	@Override
 	public boolean accountExists(String userID, String password) throws SQLException {
 		try {
 			String query = "SELECT count(*) from users WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
 	    	PreparedStatement pstmt = dataSource.getConnection().prepareStatement(query);
 	    	pstmt.setString(1, userID);
 	    	pstmt.setString(2, password);	    	
 	    	ResultSet resultSet = pstmt.executeQuery();	    	
 	    	return (resultSet.next() && (resultSet.getInt(1) == 1));
 		}
 		catch(Exception e) {
 			e.printStackTrace();
 		}

 		return false;
 	}
 	
    // This method uses JDBCTemplate, a spring class used to reduce the amount of code needed to run queries
    // It uses a rowMapper to iterate over the rows returned from the query execution. We need it to return user.
    @SuppressWarnings("finally")
	@Override
    public User login(String userID, String password) {
    	User user = null;
    	String query;
    	try {
    		if (accountExists(userID, password)) {   			
    			query = "SELECT * from users WHERE user_id = ? AND AES_DECRYPT(password,'.key.') = ?";
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
                        user.setUserLevel(rs.getString("user_level"));
                        return user;
                    }});  
    		} 
    		return null;
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	finally {
    		return user;
    	}		
    }
}
