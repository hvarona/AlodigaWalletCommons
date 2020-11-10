/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum DocumentTypeE {

	MRAR(1, "Manual Recharge Approval Request", "MRAR"),
	MWAR(2, "Manual Withdrawal Approval Request", "MWAR"),
        BUAFRQ(15, "BUSINESS_AFFILITION_REQUEST", "BUAFRQ"),
        USREAR(16, "USER_REGISTER_AFILIATION_REQUEST", "USREAR");
	
    private int id;
    private String documentTypeName;
    private String documentTypeAcronym;

    private DocumentTypeE(int id, String documentTypeName, String documentTypeAcronym) {
        this.id = id;
        this.documentTypeName = documentTypeName;
        this.documentTypeAcronym = documentTypeAcronym;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getDocumentTypeName() {
        return documentTypeName;
    }

    public void setDocumentTypeName(String documentTypeName) {
        this.documentTypeName = documentTypeName;
    }

    public String getDocumentTypeAcronym() {
        return documentTypeAcronym;
    }

    public void setDocumentTypeAcronym(String documentTypeAcronym) {
        this.documentTypeAcronym = documentTypeAcronym;
    }  
    
}
