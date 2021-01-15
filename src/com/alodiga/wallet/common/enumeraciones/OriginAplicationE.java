/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum OriginAplicationE {

	AWAAPP(1, "AlodigaWallet App", "AWAAPP"),
	AWAWEB(2, "Alodiga Wallet Admin Web", "AWAWEB"),
        PORNEG(3, "Portal de Negocios", "PORNEG");

	
    private int id;
    private String originAplicationName;
    private String originAplicationCode;

    private OriginAplicationE(int id, String originAplicationName, String originAplicationCode) {
        this.id = id;
        this.originAplicationName = originAplicationName;
        this.originAplicationCode = originAplicationCode;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getOriginAplicationName() {
        return originAplicationName;
    }

    public void setOriginAplicationName(String originAplicationName) {
        this.originAplicationName = originAplicationName;
    }

    public String getOriginAplicationCode() {
        return originAplicationCode;
    }

    public void setOriginAplicationCode(String originAplicationCode) {
        this.originAplicationCode = originAplicationCode;
    }

    
}
