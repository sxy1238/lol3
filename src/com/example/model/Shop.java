package com.example.model;

import java.io.Serializable;

/**
 * shop
 * @author 
 */
public class Shop implements Serializable {
    private String username;

    private Integer foodid;

    private Integer count;

    private static final long serialVersionUID = 1L;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getFoodid() {
        return foodid;
    }

    public void setFoodid(Integer foodid) {
        this.foodid = foodid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}