/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum DocumentTypeE {

	MRAR(1, "Manual Recharge Approval Request", "MRAR"),
	MWAR(2, "Manual Withdrawal Approval Request", "MWAR"),
        PCR(3, "Password Changed Request", "PCR"),
        PROREC(4, "PRODUCT_RECHARGE", "PROREC"),
        PROPAY(5, "PRODUCT_PAYMENT", "PROPAY"),
        PROTRA(6, "PRODUCT_TRANSFER", "PROTRA"),
        PROEXC(7, "PRODUCT_EXCHANGE", "PROEXC"),
        WITMAN(8, "WITHDRAWALS_MANUAL", "WITMAN"),
        MANREC(9, "MANUAL_RECHARGE", "MANREC"),
        TOPREC(10, "TOP_UP_RECHARGE", "TOPREC"),
        TRACAR(11, "TRANSFER_CARD_TO_CARD", "TRACAR"),
        TRAREM(12, "TRANSFER_REMITTANCE", "TRAREM"),
        PURBAL(13, "PURCHASE_BALANCE", "PURBAL"),
        BUSWIM(14, "BUSINESS_ WITHDRAWALS_MANUAL", "BUSWIM"),
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
