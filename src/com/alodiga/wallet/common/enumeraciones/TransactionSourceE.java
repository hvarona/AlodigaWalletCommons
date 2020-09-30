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
public enum TransactionSourceE {

    APPBIL(1, "APP BILLETERA", "APPBIL"),
    PORNEG(2, "PORTAL DE NEGOCIOS", "PORNEG");
    
    private int id;
    private String transactionSourceDescription;
    private String transactionSourceCode; 
    
    private TransactionSourceE(int id, String transactionSourceDescription, String transactionSourceCode) {
        this.id = id;
        this.transactionSourceDescription = transactionSourceDescription;
        this.transactionSourceCode = transactionSourceCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTransactionSourceDescription() {
        return transactionSourceDescription;
    }

    public void setTransactionSourceDescription(String transactionSourceDescription) {
        this.transactionSourceDescription = transactionSourceDescription;
    }

    public String getTransactionSourceCode() {
        return transactionSourceCode;
    }

    public void setTransactionSourceCode(String transactionSourceCode) {
        this.transactionSourceCode = transactionSourceCode;
    }
    
    
}
