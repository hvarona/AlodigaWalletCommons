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
public enum StatusBusinessAffiliationRequestE {
    
    PENDIE(1, "PENDIENTE", "PENDIE"),
    RECCOM(2, "RECAUDOS COMPLETOS", "RECCOM"),
    RECINC(3, "RECAUDOS INCOMPLETOS", "RECINC"),
    PELINE(4, "PENDIENTE LISTA NEGRA", "PELINE"),
    APLINE(5, "APROBADA LISTA NEGRA", "APLINE"),
    APROBA(7, "APROBADA", "APROBA"),
    RECHAZ(6, "RECHAZADA", "RECHAZ");
    
    
    private int id;
    private String statusBusinessAffiliationRequestDescription;
    private String statusBusinessAffiliationRequestCode;
    
    private StatusBusinessAffiliationRequestE(int id, String statusBusinessAffiliationRequestDescription, String statusBusinessAffiliationRequestCode) {
        this.id = id;
        this.statusBusinessAffiliationRequestDescription = statusBusinessAffiliationRequestDescription;
        this.statusBusinessAffiliationRequestCode = statusBusinessAffiliationRequestCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusBusinessAffiliationRequestDescription() {
        return statusBusinessAffiliationRequestDescription;
    }

    public void setStatusBusinessAffiliationRequestDescription(String statusBusinessAffiliationRequestDescription) {
        this.statusBusinessAffiliationRequestDescription = statusBusinessAffiliationRequestDescription;
    }

    public String getStatusBusinessAffiliationRequestCode() {
        return statusBusinessAffiliationRequestCode;
    }

    public void setStatusBusinessAffiliationRequestCode(String statusBusinessAffiliationRequestCode) {
        this.statusBusinessAffiliationRequestCode = statusBusinessAffiliationRequestCode;
    }

    

    
    
}
