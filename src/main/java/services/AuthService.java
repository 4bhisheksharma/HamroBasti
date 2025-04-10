package services;

import dao.UserDAO;
import model.User;
import utils.PasswordHashUtil;

import java.sql.SQLException;

public class AuthService {
    public static int createUser(String fullName, String email, String password) throws SQLException {
        if(UserDAO.getUserByEmail(email)!=-1){
            return -1;
        }

        // Hash the password before storing it
        String hashedPassword = PasswordHashUtil.hashPassword(password);

        User newUser = new User(fullName, email, hashedPassword);
        return UserDAO.createUser(newUser);
    }

    public static int createAdminUser(String fullName, String email, String password, boolean isSuperAdmin) throws SQLException {
        if(UserDAO.getUserByEmail(email)!=-1){
            return -1;
        }

        // Hash the password before storing it
        String hashedPassword = PasswordHashUtil.hashPassword(password);

        // Set role: 0 for super admin, 2 for regular admin
        int role = isSuperAdmin ? 0 : 2;

        User newUser = new User(fullName, email, hashedPassword, role);
        return UserDAO.createUser(newUser);
    }

}
