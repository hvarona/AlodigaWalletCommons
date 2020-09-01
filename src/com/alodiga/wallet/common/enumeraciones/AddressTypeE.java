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
public enum AddressTypeE {
    
    HABITA(1, "HABITACION", "HABITA"),
    DOMFIS(2, "DOMICILIO FISCAL", "DOMFIS"),
    FACTUR(3, "FACTURACION", "FACTUR"),
    EMPRES(4, "EMPRESA", "EMPRES");
    
    private int id;
    private String addressTypeDescription;
    private String addressTypeCode;
    
    private AddressTypeE(int id, String addressTypeDescription, String addressTypeCode) {
        this.id = id;
        this.addressTypeDescription = addressTypeDescription;
        this.addressTypeCode = addressTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddressTypeDescription() {
        return addressTypeDescription;
    }

    public void setAddressTypeDescription(String addressTypeDescription) {
        this.addressTypeDescription = addressTypeDescription;
    }

    public String getAddressTypeCode() {
        return addressTypeCode;
    }

    public void setAddressTypeCode(String addressTypeCode) {
        this.addressTypeCode = addressTypeCode;
    }

  
    
    
}
