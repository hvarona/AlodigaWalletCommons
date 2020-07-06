package com.alodiga.wallet.common.utils;

import java.io.Serializable;

public class WalletWSMediaType implements Serializable {

    public static final String APPLICATION = "application";
    public static final String APPLICATION_FORM_URLENCODED = "x-www-form-urlencoded";
    private String type;
    private String subtype;

    public WalletWSMediaType() {
        this.type = APPLICATION;
        this.subtype = APPLICATION_FORM_URLENCODED;
    }

    public WalletWSMediaType(String type, String subtype) {
        this.type = type;
        this.subtype = subtype;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSubtype() {
        return subtype;
    }

    public void setSubtype(String subtype) {
        this.subtype = subtype;
    }
}
