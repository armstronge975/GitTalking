package com.foobar.gittalking;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
 
import javax.sql.DataSource;
 
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class UserDAOImpl implements UserDAO {
	private DataSource dataSource;
	 
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }
     
    @Override
    public void register(User user) {
    	 String query = "insert into standard_users (user_id) values (?)";         
         JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);          
         Object[] args = new Object[] {user.getUserID()};          
         int out = jdbcTemplate.update(query, args);         
         if(out !=0){
             System.out.println("User saved with id="+user.getUserID());
         }else System.out.println("User save failed with id="+user.getUserID());
    }
    
    // check if userID available
    @Override
    public User checkUserID(String userID) {
    	String query = "SELECT user_id from standard_user, admin_user WHERE user_id = ?";
    	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        
        //using RowMapper anonymous class, we can create a separate RowMapper for reuse
        User user = jdbcTemplate.queryForObject(query, new Object[]{userID}, new RowMapper<User>(){
 
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            	User user = new User();
            	user.setUserID(rs.getString("userID"));
            	return user;
            }});
        return user;
    }
}
