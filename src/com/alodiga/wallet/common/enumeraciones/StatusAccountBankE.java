/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum StatusAccountBankE {

	ACTI(1, "Activa", "ACTI"),
	INAC(2, "Inactiva", "INAC"),
	BLOQ(3, "Bloqueada", "BLOQ");
        
    private int id;
    private String statusAccountDescription;
    private String statusAccountCode;

    private StatusAccountBankE(int id, String statusAccountDescription, String statusAccountCode) {
        this.id = id;
        this.statusAccountDescription = statusAccountDescription;
        this.statusAccountCode = statusAccountCode;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getStatusAccountDescription() {
        return statusAccountDescription;
    }

    public void setStatusAccountDescription(String statusAccountDescription) {
        this.statusAccountDescription = statusAccountDescription;
    }

    public String getStatusAccountCode() {
        return statusAccountCode;
    }

    public void setStatusAccountCode(String statusAccountCode) {
        this.statusAccountCode = statusAccountCode;
    }

   
    
    
}
