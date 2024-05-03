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
public class BookContactRepository {

   String url = "jdbc:mysql://localhost:3306/training";
    String userName = "root";
    String conPass = "";

    public int insertQuery(String name, String email, String subject, String message) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("insert into userQuery(Name, Email, Subject, Message) values(?, ?, ?, ?);");

        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, subject);
        stmt.setString(4, message);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

    public ResultSet getAllBooks() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select bookId,bookName,authorName,image,descp,btype,price,stock from bookDetail;");
        ResultSet rs = stmt.executeQuery();

        return rs;
        
    }
    
    public int countBook(String BookId) throws SQLException {
        
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("update bookDetail set stock= stock-1 where bookId=?;");
        stmt.setString(1, BookId);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }
    
    
}