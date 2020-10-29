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
public enum RequestTypeE {

    SOAFNE(1, "Solicitudes de Afiliación de Negocios", "SOAFNE"),
    SORUBI(2, "Solicitudes de Registro de Usuarios de Billetera", "SORUBI");
    
    private int id;
    private String requestTypeDescription;
    private String requestTypeCode; 
    
    private RequestTypeE(int id, String requestTypeDescription, String requestTypeCode) {
        this.id = id;
        this.requestTypeDescription = requestTypeDescription;
        this.requestTypeCode = requestTypeCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRequestTypeDescription() {
        return requestTypeDescription;
    }

    public void setRequestTypeDescription(String requestTypeDescription) {
        this.requestTypeDescription = requestTypeDescription;
    }

    public String getRequestTypeCode() {
        return requestTypeCode;
    }

    public void setRequestTypeCode(String requestTypeCode) {
        this.requestTypeCode = requestTypeCode;
    }
    
    
}
