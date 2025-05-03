-- Database: hamro_basti_db

CREATE DATABASE IF NOT EXISTS hamro_basti_db;
USE hamro_basti_db;

-- 1. Create roles table
CREATE TABLE roles (
                       role_id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(50) NOT NULL
);

-- 2. Create users table
CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       role_id INT NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       user_profile MEDIUMBLOB NULL,
                       bio VARCHAR(100) NULL,
                       FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- 3. Create priorities table
CREATE TABLE priorities (
                            priority_id INT AUTO_INCREMENT PRIMARY KEY,
                            label VARCHAR(50) NOT NULL
);

-- 4. Create report_status table
CREATE TABLE report_status (
                               status_id INT AUTO_INCREMENT PRIMARY KEY,
                               label VARCHAR(50) NOT NULL
);

-- 5. Create reports table
CREATE TABLE reports (
                         report_id INT AUTO_INCREMENT PRIMARY KEY,
                         user_id INT NOT NULL,
                         title VARCHAR(50) NOT NULL,
                         description VARCHAR(100) NOT NULL,
                         priority_id INT NOT NULL,
                         status_id INT NOT NULL DEFAULT 1,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
                         FOREIGN KEY (priority_id) REFERENCES priorities(priority_id),
                         FOREIGN KEY (status_id) REFERENCES report_status(status_id)
);

-- 6. Create report_images table
CREATE TABLE report_images (
                               image_id INT AUTO_INCREMENT PRIMARY KEY,
                               report_id INT NOT NULL,
                               report_image MEDIUMBLOB,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               FOREIGN KEY (report_id) REFERENCES reports(report_id) ON DELETE CASCADE
);

-- Create the activity_logs table to track user activities
CREATE TABLE activity_logs (
                                             activity_id INT AUTO_INCREMENT PRIMARY KEY,
                                             activity VARCHAR(255) NOT NULL,       -- Description of the activity
                                             activity_type VARCHAR(50),            -- Type of activity (upload, delete, login, etc.)
                                             user_id INT,                          -- Foreign key to link the activity to a user
                                             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Track when the activity occurred
                                             FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE -- Ensure logs are deleted if the user is deleted
);

-- Insert initial data
INSERT INTO roles (name) VALUES
                             ('resident'),
                             ('admin');

INSERT INTO priorities (label) VALUES
                                   ('Not Set'),
                                   ('Critical'),
                                   ('Medium'),
                                   ('Normal');

INSERT INTO report_status (label) VALUES
                                      ('Submitted'),
                                      ('In Progress'),
                                      ('Completed');