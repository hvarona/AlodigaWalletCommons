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
public enum StreetTypeE {
    
    CALLE(1, "CALLE", "CALLE"),
    AVENID(2, "AVENIDA", "AVENID"),
    VEREDA(3, "VEREDA", "VEREDA"),
    REDOMA(4, "REDOMA", "REDOMA"),
    AUTOPI(5, "AUTOPISTA", "AUTOPI"),
    BULEVA(6, "BULEVAR", "BULEVA"),
    CARRET(7, "CARRETERA", "CARRET");  
    
    private int id;
    private String streetTypeDescription;
    private String streetTypeCode;
    
    private StreetTypeE(int id, String streetTypeDescription, String streetTypeCode) {
        this.id = id;
        this.streetTypeDescription = streetTypeDescription;
        this.streetTypeCode = streetTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStreetTypeDescription() {
        return streetTypeDescription;
    }

    public void setStreetTypeDescription(String streetTypeDescription) {
        this.streetTypeDescription = streetTypeDescription;
    }

    public String getStreetTypeCode() {
        return streetTypeCode;
    }

    public void setStreetTypeCode(String streetTypeCode) {
        this.streetTypeCode = streetTypeCode;
    }

    
    
}
