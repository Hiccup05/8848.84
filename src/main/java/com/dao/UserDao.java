package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.entity.UserEntity;

public class UserDao {
	private Connection conn;
	public UserDao(Connection conn) {
		this.conn=conn;
	}
	
	public boolean registerUser(UserEntity userEntity) {
		boolean f=false;
		String sqlString="INSERT INTO user (full_name, email, password, date_of_birth, contact, role) VALUES (?,?,?,?,?,?)";
		try {
		    PreparedStatement pStatement = conn.prepareStatement(sqlString);
		    pStatement.setString(1, userEntity.getFullNameString());
		    pStatement.setString(2, userEntity.getEmailString());
		    pStatement.setString(3, userEntity.getPasswordString());

		    // Parse the date string into java.util.Date with the correct format
		    String dobString = userEntity.getDobString();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  // Update format to match "2025-04-17"
		    Date formattedDate = sdf.parse(dobString);

		    // Convert java.util.Date to java.sql.Date
		    java.sql.Date sqlDate = new java.sql.Date(formattedDate.getTime());
		    
		    // Set the converted sqlDate into the PreparedStatement
		    pStatement.setDate(4, sqlDate);

		    pStatement.setLong(5, userEntity.getContactString()); // Assuming contact is a long
		    pStatement.setString(6, userEntity.getRoleString());

		    int register = pStatement.executeUpdate();
		    if (register == 1) {
		        f = true;
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return f;
	}
	public ArrayList<UserEntity> getUsers(){
		UserEntity userEntity=null;
		ArrayList<UserEntity> staffs = new ArrayList<>();
		String sqlString="select * from user order by user_id desc";
		try {
			
			PreparedStatement pStatement=conn.prepareStatement(sqlString);
			
			ResultSet rSet=pStatement.executeQuery();
			while(rSet.next()) {
				userEntity=new UserEntity();
				userEntity.setId(rSet.getInt(1));
				userEntity.setFullNameString(rSet.getString(2));
				userEntity.setEmailString(rSet.getString(3));
				userEntity.setPasswordString(rSet.getString(4));
					java.sql.Date sqlDate = rSet.getDate(5);
	               SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	            userEntity.setDobString(sdf.format(sqlDate));
				userEntity.setContactString(rSet.getLong(6));
				userEntity.setRoleString(rSet.getString(7));
				staffs.add(userEntity);
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return staffs;
	}
	
}
