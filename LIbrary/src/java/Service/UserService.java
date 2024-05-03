/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Repository.UserRepository;
import java.sql.SQLException;

/**
 *
 * @author njuser
 */
public class UserService {
    
        UserRepository userRepository = new UserRepository();
    
           public int updated(String userId,String username,String bookId , String bookName , String startDate , String endDate ,String Status) throws SQLException {
            return userRepository.updated(userId,username,bookId ,bookName , startDate , endDate, Status);
        }
}