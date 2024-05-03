/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author njuser
 */
public class UserRepository {

   String url = "jdbc:mysql://localhost:3306/training";
    String userName = "root";
    String conPass = "";

  
    public int updated(String userId,String username,String bookId , String bookName , String startDate , String endDate ,String Status) throws SQLException {

        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("insert into issuedBooks (userId, userName , bookId , bookName , startDate , endDate ,issueStatus) values(?,?,?,?,?,?,?);");
        stmt.setString(1, userId);
        stmt.setString(2, username);
        stmt.setString(3, bookId);
        stmt.setString(4, bookName);
        stmt.setString(5, startDate);
        stmt.setString(6, endDate);
        stmt.setString(7, Status);

        int status = stmt.executeUpdate();
        con.close();
        return status;
    }
}