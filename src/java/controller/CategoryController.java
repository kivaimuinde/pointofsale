/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.CategoryModel;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import main.DBConnector;
import model.UserModel;

/**
 *
 * @author sa
 */
public class CategoryController {

    //global variables
    static String sql = "";
    static Connection con = null;
    static PreparedStatement pst = null;
    static ResultSet rs = null;
    
    public static int addCategory(CategoryModel model) throws SQLException, ClassNotFoundException {
        sql = "insert into categories (name, description) values (?,?)";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getName());
        pst.setString(2, model.getDescription());
        
        int i = pst.executeUpdate();
        
        return i;
    }
    
    public static int deleteCategory(CategoryModel model) throws ClassNotFoundException, SQLException {
        sql = "delete from categories where id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setInt(1, model.getId());
        
        int i = pst.executeUpdate();
        
        return i;
    }
    
    public static int updateCategory(CategoryModel model) throws ClassNotFoundException, SQLException {
        sql = "update categories set name=?, description=? where id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, model.getName());
        pst.setString(2, model.getDescription());
        pst.setInt(3, model.getId());
        
        int i = pst.executeUpdate();
        
        return i;
    }
    
    public static ResultSet allCategories() throws ClassNotFoundException, SQLException {
        
        sql = "select * from categories order by name";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        rs = pst.executeQuery();
        return rs;
        
    }
    
    public static ResultSet categoryDetails(CategoryModel model) throws ClassNotFoundException, SQLException {
        
        sql = "select id, name, description from categories where id=?";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setInt(1, model.getId());
        
        rs = pst.executeQuery();
        return rs;
    }
    
    public static int saveUpdate(CategoryModel cm, UserModel um) throws ClassNotFoundException, SQLException {
         sql = "insert into category_updates (old_name, old_description, category_id, updated_by)  values (?,?,?,?)";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setString(1, cm.getOld_name());
        pst.setString(2, cm.getOld_description());
        pst.setInt(3,cm.getId());
        pst.setInt(4, um.getId());
        
        
        int x=pst.executeUpdate();
        return x;
    }
     public static int saveDelete(CategoryModel cm, UserModel um) throws ClassNotFoundException, SQLException {
         sql = "insert into category_deletion (category_id, category_name, deleted_by)  values (?,?,?)";
        con = DBConnector.ConnectDb();
        pst = con.prepareStatement(sql);
        pst.setInt(1,cm.getId());
        pst.setString(2, cm.getName());
        pst.setInt(3, um.getId());
        
        
        int x=pst.executeUpdate();
        return x;
    }
}
