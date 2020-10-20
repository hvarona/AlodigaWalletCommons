/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum StatusTransactionApproveRequestE {

        PENDIEN(1, "Pendiente", "PENDIE"),
	APROBA(2, "Aprobada", "APROBA"),
	RECHAZ(3, "Rechazada", "RECHAZ");
        
    private int id;
    private String statusTransactionApproveRequestDescription;
    private String statusTransactionApproveRequestCode;

    private StatusTransactionApproveRequestE(int id, String statusTransactionApproveRequestDescription, String statusTransactionApproveRequestCode) {
        this.id = id;
        this.statusTransactionApproveRequestDescription = statusTransactionApproveRequestDescription;
        this.statusTransactionApproveRequestCode = statusTransactionApproveRequestCode;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getStatusTransactionApproveRequestDescription() {
        return statusTransactionApproveRequestDescription;
    }

    public void setStatusTransactionApproveRequestDescription(String statusTransactionApproveRequestDescription) {
        this.statusTransactionApproveRequestDescription = statusTransactionApproveRequestDescription;
    }

    public String getStatusTransactionApproveRequestCode() {
        return statusTransactionApproveRequestCode;
    }

    public void setStatusTransactionApproveRequestCode(String statusTransactionApproveRequestCode) {
        this.statusTransactionApproveRequestCode = statusTransactionApproveRequestCode;
    }

   

    
    
}
