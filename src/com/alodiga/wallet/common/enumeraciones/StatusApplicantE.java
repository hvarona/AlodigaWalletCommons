/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum StatusApplicantE {

	ACTIVO(1,"ACTIVO" ,"ACTIVO"),
	LISNOK(2, "LISTA NEGRA OK", "LISNOK"),
	LISNEG(3, "LISTA NEGRA", "LISNEG"),
        INACTI(4, "INACTIVO", "INACTI"),
        NEGOCI(5, "NEGOCIO", "NEGOCI");
        
    private int id;
    private String statusApplicantDescription;
    private String statusApplicantCode;

    private StatusApplicantE(int id, String statusApplicantDescription, String statusApplicantCode) {
        this.id = id;
        this.statusApplicantDescription = statusApplicantDescription;
        this.statusApplicantCode = statusApplicantCode;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getStatusApplicantDescription() {
        return statusApplicantDescription;
    }

    public void setStatusApplicantDescription(String statusApplicantDescription) {
        this.statusApplicantDescription = statusApplicantDescription;
    }

    public String getStatusApplicantCode() {
        return statusApplicantCode;
    }

    public void setStatusApplicantCode(String statusApplicantCode) {
        this.statusApplicantCode = statusApplicantCode;
    }

   
    
    
}
