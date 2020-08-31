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
public enum BusinessTypeE {
    
    
    CORRES(7, "CORRESPONSAL", "CORRES"),
    COMERC(8, "COMERCIO", "COMERC");
    
    private int id;
    private String businessTypeDescription;
    private String businessTypeCode;
    
    private BusinessTypeE(int id, String businessTypeDescription, String businessTypeCode) {
        this.id = id;
        this.businessTypeDescription = businessTypeDescription;
        this.businessTypeCode = businessTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBusinessTypeDescription() {
        return businessTypeDescription;
    }

    public void setBusinessTypeDescription(String businessTypeDescription) {
        this.businessTypeDescription = businessTypeDescription;
    }

    public String getBusinessTypeCode() {
        return businessTypeCode;
    }

    public void setBusinessTypeCode(String businessTypeCode) {
        this.businessTypeCode = businessTypeCode;
    }   
    
}
