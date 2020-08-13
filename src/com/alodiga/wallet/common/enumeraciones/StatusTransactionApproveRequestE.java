/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum StatusTransactionApproveRequestE {

	PEND(1, "Pendiente", "PEND"),
	APPR(2, "Aprovada", "APPR"),
	REJE(3, "Rechazada", "REJE");
        
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
