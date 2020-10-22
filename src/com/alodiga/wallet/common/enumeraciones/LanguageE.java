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
public enum LanguageE {

    ENGLI(1, "ENGLISH", "ENGLI"),
    SPANI(2, "SPANISH", "SPANI");
    
    private int id;
    private String languageDescription;
    private String languageCode; 
    
    private LanguageE(int id, String languageDescription, String languageCode) {
        this.id = id;
        this.languageDescription = languageDescription;
        this.languageCode = languageCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLanguageDescription() {
        return languageDescription;
    }

    public void setLanguageDescription(String languageDescription) {
        this.languageDescription = languageDescription;
    }
    
    public String getLanguageCode() {
        return languageCode;
    }

    public void setLanguageCode(String languageCode) {
        this.languageCode = languageCode;
    }
    
    
}
