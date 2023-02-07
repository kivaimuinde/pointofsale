/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author sa
 */
public class CategoryModel {
    private int id;
    private String name;
    private String description;
    private Timestamp date_added;
    private String old_name;
    private String old_description;
    
    public CategoryModel(){}

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the date_added
     */
    public Timestamp getDate_added() {
        return date_added;
    }

    /**
     * @param date_added the date_added to set
     */
    public void setDate_added(Timestamp date_added) {
        this.date_added = date_added;
    }

    /**
     * @return the old_name
     */
    public String getOld_name() {
        return old_name;
    }

    /**
     * @param old_name the old_name to set
     */
    public void setOld_name(String old_name) {
        this.old_name = old_name;
    }

    /**
     * @return the old_description
     */
    public String getOld_description() {
        return old_description;
    }

    /**
     * @param old_description the old_description to set
     */
    public void setOld_description(String old_description) {
        this.old_description = old_description;
    }

}