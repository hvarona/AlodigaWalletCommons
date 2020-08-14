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
public enum StatusBusinessAffiliationRequetsE {
    
    DEB(1, "DEBITO", "DEB"),
    CRED(2, "CREDITO", "CRED");
    
    
    private int id;
    private String statusBusinessAffiliationRequetsDescription;
    private String statusBusinessAffiliationRequetsCode;
    
    private StatusBusinessAffiliationRequetsE(int id, String statusBusinessAffiliationRequetsDescription, String statusBusinessAffiliationRequetsCode) {
        this.id = id;
        this.statusBusinessAffiliationRequetsDescription = statusBusinessAffiliationRequetsDescription;
        this.statusBusinessAffiliationRequetsCode = statusBusinessAffiliationRequetsCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusBusinessAffiliationRequetsDescription() {
        return statusBusinessAffiliationRequetsDescription;
    }

    public void setStatusBusinessAffiliationRequetsDescription(String statusBusinessAffiliationRequetsDescription) {
        this.statusBusinessAffiliationRequetsDescription = statusBusinessAffiliationRequetsDescription;
    }

    public String getStatusBusinessAffiliationRequetsCode() {
        return statusBusinessAffiliationRequetsCode;
    }

    public void setStatusBusinessAffiliationRequetsCode(String statusBusinessAffiliationRequetsCode) {
        this.statusBusinessAffiliationRequetsCode = statusBusinessAffiliationRequetsCode;
    }

    
    
}
