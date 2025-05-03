package dao;

import utils.DBUtil;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public static int createUser(User user) {
        String sql = "INSERT INTO users (full_name, email, password) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, user.getFullName());
            System.out.println(user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return generated user ID
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }

    public static int getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("user_id");
            }
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return -1;
    }

    public static User getUserById(int user_id) throws SQLException {
        String sql = "SELECT user_id, full_name, email, created_at, bio, user_profile FROM users WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setBio(rs.getString("bio"));
                user.setUserImage(rs.getBytes("user_profile")); // Fetch image
                return user;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public static boolean updateUser(User user) {
        String sql = "UPDATE users SET full_name = ?, bio = ?, user_profile = ? WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getBio());
            ps.setBytes(3, user.getUserImage());
            ps.setInt(4, user.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public static User getUserByEmailOnly(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try(Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRoleId(rs.getInt("role_id"));
                return user;
            }
        }
        catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    // Get all users
    public static List<User> getAllUsers() throws SQLException {
        String sql = "SELECT user_id, full_name, email, role_id, created_at, bio, user_profile FROM users";
        List<User> users = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setRoleId(rs.getInt("role_id"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setBio(rs.getString("bio"));
                user.setUserImage(rs.getBytes("user_profile"));
                users.add(user);
            }
        }
        return users;
    }

    // Delete user
    public static boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting user: " + e.getMessage());
            return false;
        }
    }
}
