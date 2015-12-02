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
}
