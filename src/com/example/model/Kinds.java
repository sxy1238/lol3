package com.example.model;

import java.io.Serializable;

/**
 * kinds
 * @author 
 */
public class Kinds implements Serializable {
    private Integer id;

    private String kind;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }
}