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

    public static User validateUser(String email, String password) throws SQLException {
        // Get the user by email (will need to modify UserDAO to get user by email only)
        User user = UserDAO.getUserByEmailOnly(email);

        // If user exists and password matches the stored hash
        if (user != null && PasswordHashUtil.verifyPassword(password, user.getPassword())) {
            return user;
        }
        return null;

    }

    public static boolean hasAdminAccess(User user) {
        if (user == null) return false;
        return user.hasAdminPermissions();
    }

}
