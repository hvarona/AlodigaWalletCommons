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
public enum StatusRequestE {
    
    PENDIE(1, "PENDIENTE", "PENDIE"),
    RECCOM(2, "RECAUDOS COMPLETOS", "RECCOM"),
    RECINC(3, "RECAUDOS INCOMPLETOS", "RECINC"),
    APLINE(4, "APROBADA LISTA NEGRA", "APLINE"),
    RELINE(6, "RECHAZADA LISTA NEGRA", "RELINE"),
    APROBA(7, "APROBADA", "APROBA"),
    RECHAZ(8, "RECHAZADA", "RECHAZ");
    
    
    private int id;
    private String statusRequestDescription;
    private String statusRequestCode;
    
    private StatusRequestE(int id, String statusRequestDescription, String statusRequestCode) {
        this.id = id;
        this.statusRequestDescription = statusRequestDescription;
        this.statusRequestCode = statusRequestCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusRequestDescription() {
        return statusRequestDescription;
    }

    public void setStatusRequestDescription(String statusRequestDescription) {
        this.statusRequestDescription = statusRequestDescription;
    }

    public String getStatusRequestCode() {
        return statusRequestCode;
    }

    public void setStatusRequestCode(String statusRequestCode) {
        this.statusRequestCode = statusRequestCode;
    }

    

    
    
}
