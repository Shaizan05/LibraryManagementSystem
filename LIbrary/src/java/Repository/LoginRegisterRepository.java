/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author njuser
 */
public class LoginRegisterRepository {

   String url = "jdbc:mysql://localhost:3306/training";
    String userName = "root";
    String conPass = "";

//    user register function
    public int registerUser(String username, String email, String password) throws SQLException {

        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("insert into userDetail(userName,email,userPass) values(?, ?, ?);");
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, password);

        int status = stmt.executeUpdate();
        con.close();
        return status;
    }
    
    //    user login function
    public int checkLogin(String username, String password) throws SQLException {
        
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select count(username),adminAccess from userDetail where userName = ? and userPass = ?;");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        int status = 0;
        if (rs.next()) {
            status = rs.getInt(1);
        }
        con.close();
        return status;
    }
//    user admin function
    public int checkAdmin(String username, String password) throws SQLException {
        
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select adminAccess from userDetail where userName = ? and userPass = ?;");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        int status = 0;

        if (rs.next()) {
            status = rs.getInt(1);

        }
        con.close();
        return status;
    }
    
//    getting email from database to store in session
    public String getEmail(String username, String password) throws SQLException {
        
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select email from userDetail where userName = ? and userPass = ?;");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        String email = "";
        if (rs.next()) {
            email = rs.getString("email");
        }
        return email;

    }
    public String getName(String username, String password) throws SQLException {
        
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select userName from userDetail where userName = ? and userPass = ?;");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        String name = "";
        if (rs.next()) {
            name = rs.getString("userName");
        }
        return name;

    }
    public String getId(String username, String password) throws SQLException {
        
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select userId from userDetail where userName = ? and userPass = ?;");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        String id = "";
        if (rs.next()) {
            id = rs.getString("userId");
        }
        return id;

    }
}