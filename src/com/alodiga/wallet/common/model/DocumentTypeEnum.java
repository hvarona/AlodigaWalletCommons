package com.alodiga.wallet.common.model;

public enum DocumentTypeEnum {

	MRAR(1L, "MRAR"),
	MWAR(2L,"MWAR");
	
    private Long id;
    private String documentType;

    private DocumentTypeEnum(Long id, String documentType) {
        this.id = id;
        this.documentType = documentType;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

   
}
