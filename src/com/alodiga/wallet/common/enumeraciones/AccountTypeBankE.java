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
public enum AccountTypeBankE {
    
    CTACOR(1, "Cuenta Corriente", "CTACOR"),
    CTAAHO(2, "Cuenta de Ahorros", "CTAAHO"),
    CTAUNI(3, "Cuenta Unica", "CTAUNI");
    
    
    private int id;
    private String accountTypeBankDescription;
    private String accountTypeBankCode;
    
    private AccountTypeBankE(int id, String accountTypeBankDescription, String accountTypeBankCode) {
        this.id = id;
        this.accountTypeBankDescription = accountTypeBankDescription;
        this.accountTypeBankCode = accountTypeBankCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccountTypeBankDescription() {
        return accountTypeBankDescription;
    }

    public void setAccountTypeBankDescription(String accountTypeBankDescription) {
        this.accountTypeBankDescription = accountTypeBankDescription;
    }

    public String getAccountTypeBankCode() {
        return accountTypeBankCode;
    }

    public void setAccountTypeBankCode(String accountTypeBankCode) {
        this.accountTypeBankCode = accountTypeBankCode;
    }

    
    
}
