package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.entity.UserEntity;

public class LoginDao {
    private Connection connect;

    public LoginDao(Connection conn) {
        this.connect = conn;
    }

    public UserEntity getUsers(String email, String password) {
        UserEntity userEntity = null;
        String sqlString = "SELECT * FROM user WHERE email=? AND password=?";
        
        try {
            PreparedStatement pStatement = connect.prepareStatement(sqlString);
            pStatement.setString(1, email);
            pStatement.setString(2, password);

            ResultSet rSet = pStatement.executeQuery();

            while (rSet.next()) {
                userEntity = new UserEntity();
                userEntity.setId(rSet.getInt(1));
                userEntity.setFullNameString(rSet.getString(2));
                userEntity.setEmailString(rSet.getString(3));
                userEntity.setPasswordString(rSet.getString(4));

                java.sql.Date sqlDate = rSet.getDate(5);
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                userEntity.setDobString(sdf.format(sqlDate));

                userEntity.setContactString(rSet.getLong(6));
                userEntity.setRoleString(rSet.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userEntity;
    }
}

