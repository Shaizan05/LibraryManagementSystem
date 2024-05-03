/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Repository.LoginRegisterRepository;
import java.sql.SQLException;

/**
 *
 * @author njuser
 */
public class LoginRegisterService {

    LoginRegisterRepository loginRegisterRepository = new LoginRegisterRepository();

    public int registerUser(String username, String email, String password) throws SQLException {
        return loginRegisterRepository.registerUser(username, email, password);
    }

    public int checkLogin(String username, String password) throws SQLException {
        return loginRegisterRepository.checkLogin(username, password);
    }

    public int checkAdmin(String username, String password) throws SQLException {
        return loginRegisterRepository.checkAdmin(username, password);
    }

    public String getEmail(String username, String password) throws SQLException {
        return loginRegisterRepository.getEmail(username, password);
    }
     public String getName(String username, String password) throws SQLException {
        return loginRegisterRepository.getName(username, password);
    }
      public String getId(String username, String password) throws SQLException {
        return loginRegisterRepository.getId(username, password);
    }
}