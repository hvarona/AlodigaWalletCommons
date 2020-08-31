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
public enum EdificationTypeE {
    
    CASA(1, "Casa", "CASA"),
    QUINTA(2, "Quinta", "QUINTA"),
    EDIFIC(3, "Edificio", "EDIFIC"),
    RESIDE(4, "Residencia", "RESIDE"),
    CENCOM(5, "Centro Comercial", "CENCOM"),
    CHALET(6, "Chalet", "CHALET"),
    DUPLEX(7, "Duplex", "DUPLEX");
    
    private int id;
    private String edificationTypeDescription;
    private String edificationTypeCode;
    
    private EdificationTypeE(int id, String edificationTypeDescription, String edificationTypeCode) {
        this.id = id;
        this.edificationTypeDescription = edificationTypeDescription;
        this.edificationTypeCode = edificationTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEdificationTypeDescription() {
        return edificationTypeDescription;
    }

    public void setEdificationTypeDescription(String edificationTypeDescription) {
        this.edificationTypeDescription = edificationTypeDescription;
    }

    public String getEdificationTypeCode() {
        return edificationTypeCode;
    }

    public void setEdificationTypeCode(String edificationTypeCode) {
        this.edificationTypeCode = edificationTypeCode;
    }

    
    
}
