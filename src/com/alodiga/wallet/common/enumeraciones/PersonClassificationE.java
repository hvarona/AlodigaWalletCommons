/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.enumeraciones;

public enum PersonClassificationE {

	NABUAP(1, "Natural Business Applicant", "NABUAP"),
	LEBUAP(2, "Legal Business Applicant", "LEBUAP"),
        EMPLEA(3, "Employee", "EMPLEA"),
        USER(4, "User", "USER"),
        REUNUS(5, "Register Unified User", "REUNUS"),
        LEGREP(6, "Legal Representatives", "LEGREP");
	
    private int id;
    private String personClassificationDescription;
    private String personClassificationCode;

    private PersonClassificationE(int id, String personClassificationDescription, String personClassificationCode) {
        this.id = id;
        this.personClassificationDescription = personClassificationDescription;
        this.personClassificationCode = personClassificationCode;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getPersonClassificationDescription() {
        return personClassificationDescription;
    }

    public void setPersonClassificationDescription(String personClassificationDescription) {
        this.personClassificationDescription = personClassificationDescription;
    }

    public String getPersonClassificationCode() {
        return personClassificationCode;
    }

    public void setPersonClassificationCode(String personClassificationCode) {
        this.personClassificationCode = personClassificationCode;
    }  
    
}
