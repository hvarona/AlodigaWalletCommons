/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

/**
 *
 * @author jose
 */
public enum PreferenceClassificationE {

    CLIEN(1, "cliente", "CLIEN"),
    NEGOC(2, "negocio", "NEGOC");
    
    private int id;
    private String preferenceClassificationName;
    private String preferenceClassificationCode; 
    
    private PreferenceClassificationE(int id, String preferenceClassificationName, String preferenceClassificationCode) {
        this.id = id;
        this.preferenceClassificationName = preferenceClassificationName;
        this.preferenceClassificationCode = preferenceClassificationCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPreferenceClassificationName() {
        return preferenceClassificationName;
    }

    public void setPreferenceClassificationName(String preferenceClassificationName) {
        this.preferenceClassificationName = preferenceClassificationName;
    }
    
    public String getPreferenceClassificationCode() {
        return preferenceClassificationCode;
    }

    public void setPreferenceClassificationCode(String preferenceClassificationCode) {
        this.preferenceClassificationCode = preferenceClassificationCode;
    }
    
    
}
