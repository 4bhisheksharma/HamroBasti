package dao;

import utils.DBUtil;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setBio(rs.getString("bio"));
                return user;
            }
        }catch (Exception e){
            System.err.println(e.getMessage());
        }
        return null;
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
}
