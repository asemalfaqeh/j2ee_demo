package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataBaseSQL {

  private Connection connection;
  private String key;


public DataBaseSQL(Connection connection1){
	  this.connection = connection1;
  }

  
  public void insert(String name,String email,String password,String region,String country,String phone) throws SQLException{
	  
	  String queryinsert = "insert into account(Email,password,shopingname,region,country,phone) values(?,?,?,?,?,?)";
	  PreparedStatement preparedStatement0 = connection.prepareStatement(queryinsert);
	  preparedStatement0.setString(1,email);
	  preparedStatement0.setString(2,password);
	  preparedStatement0.setString(3,password);
	  preparedStatement0.setString(4,region);
	  preparedStatement0.setString(5,country);
	  preparedStatement0.setString(6,phone);
	  preparedStatement0.executeUpdate();
	  preparedStatement0.close();
  }
  
  public boolean Validate(String email,String password) throws SQLException{
	  
	  String query = "select count(*) as count from account where Email=? and password=?";
	  
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1,email);
		preparedStatement.setString(2,password);
	    ResultSet rs = preparedStatement.executeQuery();
		int count = 0;
		if(rs.next()){
			count = rs.getInt("count");
		}
		rs.close();
		
		if(count == 0){
			return false;
		}else{
			return true;
		}
  }
  
  
	
}
