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
public class AdminRepository {

    String url = "jdbc:mysql://localhost:3306/training";
    String userName = "root";
    String conPass = "";

    public ResultSet getAllUser() throws SQLException {

        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stm = con.prepareStatement("select userId,userName,email,userPass,bid,startDate,endDate from userDetail;");

        ResultSet rs = stm.executeQuery();
        return rs;

    }

    public ResultSet getAllBooks() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select bookId,bookName,authorName,image,descp,btype,price,stock from bookDetail;");
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet getAllQuery() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select queryId,Name, Email, Subject, Message from userQuery;");
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public int addUser(String username, String email, String passWord) throws SQLException {

        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stm = con.prepareStatement("insert into userDetail(userName,email,userPass) values(?,?,?);");
        stm.setString(1, username);
        stm.setString(2, email);
        stm.setString(3, passWord);
        int rs = stm.executeUpdate();
        return rs;
    }

    public int deleteUser(int userId) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("delete from userDetail where userId = ?;");
        stmt.setInt(1, userId);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

    public int addBooks(String name, String author, String image, String desc, String category, int price, int stock) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("insert into bookDetail(bookName, authorName, image, descp, btype, price, stock) values(?, ?, ?, ?, ?, ?, ?);");

        stmt.setString(1, name);
        stmt.setString(2, author);
        stmt.setString(3, image);
        stmt.setString(4, desc);
        stmt.setString(5, category);
        stmt.setInt(6, price);
        stmt.setInt(7, stock);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

    public int deleteBook(int bookId) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("delete from bookDetail where bookId = ?;");
        stmt.setInt(1, bookId);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

    public ResultSet ShowBook(int bookId) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select bookId,bookName,authorName,image,descp,btype,price,stock from bookDetail where bookId = ?;");
        stmt.setInt(1, bookId);
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public int updateBook(int bookId, String name, String author, String image, String desc, String category, int price, int stock) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("update bookDetail set bookName = ?, authorName = ?, image = ?, descp = ?, btype = ?, price = ?, stock = ? where bookId = ?;");

        stmt.setString(1, name);
        stmt.setString(2, author);
        stmt.setString(3, image);
        stmt.setString(4, desc);
        stmt.setString(5, category);
        stmt.setInt(6, price);
        stmt.setInt(7, stock);
        stmt.setInt(8, bookId);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

    public int deleteQuery(int id) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("delete from userQuery where queryId = ?;");
        stmt.setInt(1, id);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

    public ResultSet editUser(int id) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stm = con.prepareStatement("select userId,userName,email,userPass,bid,startDate,endDate from userDetail where userId=?;");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        return rs;

    }

    public int updateUser(int id, String username, String email, String password) throws SQLException {

        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stm = con.prepareStatement("update userDetail set userName=?,email=?,userPass=? where userId=?;");
        stm.setString(1, username);
        stm.setString(2, email);
        stm.setString(3, password);
        stm.setInt(4, id);

        int rs = stm.executeUpdate();
        return rs;
    }

    public ResultSet issuedBooks() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select issueId,userId,userName,bookId,bookName,startDate,endDate,issueStatus from issuedBooks;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public int getBookCount() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select count(bookId) from bookDetail;");
        ResultSet rs = stmt.executeQuery();
        int bookCount = 0;
        if (rs.next()) {
            bookCount = rs.getInt(1);
        }
        return bookCount;
    }

    public int getUserCount() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select count(userId) from userDetail;");
        ResultSet rs = stmt.executeQuery();
        int userCount = 0;
        if (rs.next()) {
            userCount = rs.getInt(1);
        }
        return userCount;
    }

    public int getIssuedBooksCount() throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("select count(issueId) from issuedBooks;");
        ResultSet rs = stmt.executeQuery();
        int issuedBooksCount = 0;
        if (rs.next()) {
            issuedBooksCount = rs.getInt(1);
        }
        return issuedBooksCount;
    }

    public int deleteIssue(int id) throws SQLException {
        Connection con = DriverManager.getConnection(url, userName, conPass);
        PreparedStatement stmt = con.prepareStatement("delete from issuedBooks where issueId = ?;");
        stmt.setInt(1, id);
        int status = stmt.executeUpdate();
        con.close();
        return status;
    }

}