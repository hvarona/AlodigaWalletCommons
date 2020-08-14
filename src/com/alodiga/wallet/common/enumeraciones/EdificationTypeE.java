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
public enum EdificationTypeE {
    
    DEB(1, "DEBITO", "DEB"),
    CRED(2, "CREDITO", "CRED");
    
    
    private int id;
    private String edificationTypeDescription;
    private String edificationTypeCode;
    
    private EdificationTypeE(int id, String edificationTypeDescription, String edificationTypeCode) {
        this.id = id;
        this.edificationTypeDescription = edificationTypeDescription;
        this.edificationTypeCode = edificationTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEdificationTypeDescription() {
        return edificationTypeDescription;
    }

    public void setEdificationTypeDescription(String edificationTypeDescription) {
        this.edificationTypeDescription = edificationTypeDescription;
    }

    public String getEdificationTypeCode() {
        return edificationTypeCode;
    }

    public void setEdificationTypeCode(String edificationTypeCode) {
        this.edificationTypeCode = edificationTypeCode;
    }

    
    
}
