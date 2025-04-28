package com.dream11.dao;

import com.dream11.util.DataBaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserManger
{

    public static UserManger INSTANCE = new UserManger();

    private UserManger()
    {

    }


    public  int login(String userName,String password) throws SQLException {

        String qry  = "SELECT user_password FROM users_tbl WHERE user_name = ?";

        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(qry))
        {
            preparedStatement.setString(1, userName);


            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String realPassword = resultSet.getString("user_password");

                    if (realPassword.equals(password)) {
                        return 1;//if login successful
                    } else {
                        return 2;//if username ok but password wrong
                    }

                }
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
        return 3;// if user doesn't exist
    }

    public  boolean register(String userName,String password,String email) throws SQLException {

        String sql = "INSERT INTO users_tbl (user_name, user_password , user_email) VALUES (?, ?,?)";

        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, userName );
            preparedStatement.setString(2, password);
            preparedStatement.setString(3,email);


                return preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {

            throw new RuntimeException(e);
        }

    }

    public  int isValidForRegister(String userName,String email) throws SQLException {

        String sql = "INSERT INTO users_tbl (user_name,user_email) VALUES (?,?)";

        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, userName );
            preparedStatement.setString(2,email);

            return 1; // valid for resister

        } catch (SQLException e)
        {
            if ("23505".equals(e.getSQLState())) {

                String errorMessage = e.getMessage();

                String dbUserNameColumn = "user_name";
                String dbUserEmail = "user_email";

                if (errorMessage.contains(dbUserNameColumn)) {
                    return 2; // Username already exists
                } else if (errorMessage.contains(dbUserEmail)) {
                    return 3; // Email already exists
                }
            }
            throw new RuntimeException(); // Unknown SQL error
        } catch (Exception e) {

            throw new RuntimeException(e);
        }
    }

    public int getUserId(String userName)
    {
        String sql = "SELECT user_id from users_tbl WHERE user_name = ? ";

        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, userName);


            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("user_id");
                }

            }

        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

            return -1;
    }

    public boolean isValidUser(String  userName,String email)
    {

        String qry  = "SELECT * FROM users_tbl WHERE user_name = ? AND user_email = ?";

        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(qry))
        {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2,email);


            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                return resultSet.next();
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public boolean updatePassword(String userId,String newPassword)
    {
        String sql = "UPDATE users_tbl SET user_password = ? WHERE user_id = ?";

        try ( Connection connection = DataBaseConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setString(1,newPassword);
            preparedStatement.setInt(2,Integer.parseInt(userId));

            return preparedStatement.executeUpdate() > 0;

        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public String getPassword(String userId)
    {
        String sql = "SELECT user_password FROM users_tbl WHERE user_id = ?";

        try ( Connection connection = DataBaseConnection.getConnection();
              PreparedStatement preparedStatement = connection.prepareStatement(sql))
        {
            preparedStatement.setInt(1,Integer.parseInt(userId));


            try ( ResultSet resultSet = preparedStatement.executeQuery() )
            {
                if ( resultSet.next() )
                {
                    return resultSet.getString("user_password");
                }
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        return null;
    }








}
