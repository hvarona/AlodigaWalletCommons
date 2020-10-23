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
public enum TransactionTypeE {

    PROREC(1, "PRODUCT_RECHARGE", "PROREC"),
    PROPAY(2, "PRODUCT_PAYMENT", "PROPAY"),
    PROTRA(3, "PRODUCT_TRANSFER", "PROTRA"),
    PROEXC(4, "PRODUCT_EXCHANGE", "PROEXC"),
    WITMAN(5, "WITHDRAWALS_MANUAL", "WITMAN"),
    MANREC(6, "MANUAL_RECHARGE", "MANREC"),
    TOPREC(7, "TOP_UP_RECHARGE", "TOPREC"),
    TRACAR(8, "TRANSFER_CARD_TO_CARD", "TRACAR"),
    TRAREM(9, "TRANSFER_REMITTANCE", "TRAREM"),
    PURBAL(10, "PURCHASE_BALANCE", "PURBAL"),
    BUSWIM(11, "BUSINESS_ WITHDRAWALS_MANUAL", "BUSWIM");
    
    private int id;
    private String transactionTypeValue;
    private String transactionTypeCode; 
    
    private TransactionTypeE(int id, String transactionTypeValue, String transactionTypeCode) {
        this.id = id;
        this.transactionTypeValue= transactionTypeValue;
        this.transactionTypeCode = transactionTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTransactionTypeValue() {
        return transactionTypeValue;
    }

    public void setTransactionTypeValue(String transactionTypeValue) {
        this.transactionTypeValue = transactionTypeValue;
    }

    public String getTransactionTypeCode() {
        return transactionTypeCode;
    }

    public void setTransactionTypeCode(String transactionTypeCode) {
        this.transactionTypeCode = transactionTypeCode;
    }
    
    
}
