/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.UserModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import main.DBConnector;

/**
 *
 * @author softnut
 */
public class UserController {

    static String sql = "";
    static Connection con = null;
    static PreparedStatement pst = null;
    static ResultSet rs = null;

    public static boolean checkUserName(UserModel model) throws ClassNotFoundException, SQLException {
        sql = "select * from users where username=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getUsername());
        rs = pst.executeQuery();
        return rs.next();
    }

    public static boolean checkEmailAddress(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "select * from users where email=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getEmail());
        rs = pst.executeQuery();
        return rs.next();
    }

    public static boolean checkPhone(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "select * from users where phone=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getPhone());
        rs = pst.executeQuery();
        return rs.next();
    }

    public static int saveUser(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "insert into users (username, password, category) values (?,?,?)";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getUsername());
        pst.setString(2, model.getPassword());
        pst.setString(3, model.getCategory());
        int i = pst.executeUpdate();
        return i;
    }

    public static int deleteUser(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "delete from users where username=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getUsername());
        int i = pst.executeUpdate();
        return i;
    }

    public static int changePassword(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "update users set password=? where username=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getPassword());
        pst.setString(2, model.getUsername());
        int i = pst.executeUpdate();
        return i;
    }

    public static int changeUsername(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "update users set username=? where id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getUsername());
        pst.setInt(2, model.getId());
        int i = pst.executeUpdate();
        return i;
    }

    public static ResultSet userLogin(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "SELECT id, category, status FROM users WHERE username=? and password=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getUsername());
        pst.setString(2, model.getPassword());
        rs = pst.executeQuery();
        return rs;
    }

    public static int saveProfile(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "insert into profile "
                + "(user, first_name, last_name, phone,email, address) "
                + "values "
                + "(?,?,?,?,?,?)";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setInt(1, model.getId());
        pst.setString(2, model.getFirst_name());
        pst.setString(3, model.getLast_name());
        pst.setString(4, model.getPhone());
        pst.setString(5, model.getEmail());
        pst.setString(6, model.getAddress());
        int i = pst.executeUpdate();
        return i;
    }

    public static int updateProfile(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "update profile set "
                + "first_name=?, last_name=?, phone=?, email=? address=? "
                + "where "
                + "user=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getFirst_name());
        pst.setString(2, model.getLast_name());
        pst.setString(3, model.getPhone());
        pst.setString(4, model.getEmail());
        pst.setString(5, model.getAddress());
        pst.setInt(6, model.getId());
        int i = pst.executeUpdate();
        return i;
    }
     public static ResultSet inactiveAccounts(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "SELECT id, username, category, status FROM users WHERE status=? and username!=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1,"inactive");
        pst.setString(2, model.getExcept());
        rs = pst.executeQuery();
        return rs;
    }
     
      public static ResultSet activeAccounts(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "SELECT id, username, category, status FROM users WHERE status=? and username!=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1,"active");
        pst.setString(2, model.getExcept());
        rs = pst.executeQuery();
        return rs;
    }
      public static ResultSet suspendedAccounts(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "SELECT id, username, category, status FROM users WHERE status=? and username!=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1,"suspended");
        pst.setString(2, model.getExcept());
        rs = pst.executeQuery();
        return rs;
    }
     
     public static int activateAccount(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "update users set status=? where username=? and id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1,"active");
        pst.setString(2, model.getUsername());
        pst.setInt(3, model.getId());
        int i=pst.executeUpdate();
        return i;
     }
     
     public static int suspendAccount(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "update users set status=? where username=? and id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1,"suspended");
        pst.setString(2, model.getUsername());
        pst.setInt(3, model.getId());
        int i=pst.executeUpdate();
        return i;
     }
     
     public static int restoreAccount(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "update users set status=? where username=? and id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1,"active");
        pst.setString(2, model.getUsername());
        pst.setInt(3, model.getId());
        int i=pst.executeUpdate();
        return i;
     }
     
    public static ResultSet allAccounts(UserModel model)
            throws ClassNotFoundException, SQLException {
        sql = "SELECT id,username, category, status FROM users where username!=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getUsername());
        rs = pst.executeQuery();
        return rs;
    }
    

}
