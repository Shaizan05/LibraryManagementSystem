/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Repository.AdminRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author njuser
 */
public class AdminService {

    AdminRepository adminRepository = new AdminRepository();

    public ResultSet getAllUser() throws SQLException {
        return adminRepository.getAllUser();
    }

    public ResultSet getAllBooks() throws SQLException {
        return adminRepository.getAllBooks();
    }

    public ResultSet getAllQuery() throws SQLException {
        return adminRepository.getAllQuery();
    }

    public int addUser(String username, String email, String passWord) throws SQLException {
        return adminRepository.addUser(username, email, passWord);
    }

    public int deleteUser(int userId) throws SQLException {
        return adminRepository.deleteUser(userId);
    }

    public int addBooks(String name, String author, String image, String desc, String category, int price, int stock) throws SQLException {
        return adminRepository.addBooks(name, author, image, desc, category, price, stock);
    }

    public int deleteBook(int bookId) throws SQLException {
        return adminRepository.deleteBook(bookId);
    }

    public ResultSet ShowBook(int bookId) throws SQLException {
        return adminRepository.ShowBook(bookId);
    }

    public int updateBook(int bookId, String name, String author, String image, String desc, String category, int price, int stock) throws SQLException {
        return adminRepository.updateBook(bookId, name, author, image, desc, category, price, stock);
    }

    public int deleteQuery(int id) throws SQLException {
        return adminRepository.deleteQuery(id);

    }

    public ResultSet editUser(int id) throws SQLException {
        return adminRepository.editUser(id);

    }

    public int updateUser(int id, String username, String email, String password) throws SQLException {
        return adminRepository.updateUser(id, username, email, password);

    }

    public ResultSet issuedBooks() throws SQLException {
        return adminRepository.issuedBooks();
    }

    public int getBookCount() throws SQLException {
        return adminRepository.getBookCount();
    }

    public int getUserCount() throws SQLException {
        return adminRepository.getUserCount();
    }

    public int getIssuedBooksCount() throws SQLException {
        return adminRepository.getIssuedBooksCount();
    }
    
      public int deleteIssue(int id) throws SQLException {
        return adminRepository.deleteIssue(id);

    }
}