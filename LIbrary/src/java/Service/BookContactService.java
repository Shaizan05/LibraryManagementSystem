/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Repository.BookContactRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author njuser
 */
public class BookContactService {

    BookContactRepository bookContactRepository = new BookContactRepository();

    public int insertQuery(String name, String email, String subject, String message) throws SQLException {
        return bookContactRepository.insertQuery(name, email, subject, message);
    }

    public ResultSet getallbooks() throws SQLException {
        return bookContactRepository.getAllBooks();
    }

    public int countBook(String BookId) throws SQLException {
        return bookContactRepository.countBook(BookId);
    }

   
}