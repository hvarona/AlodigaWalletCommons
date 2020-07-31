package com.alodiga.wallet.common.model;

public enum StatusTransactionApproveRequestEnum {

	PEND(1L, "PEND"),
	APPR(2L,"APPR"),
	REJE(3l,"REJE");
	
    private Long id;
    private String statusTransactionApproveRequest;

    private StatusTransactionApproveRequestEnum(Long id, String statusTransactionApproveRequest) {
        this.id = id;
        this.statusTransactionApproveRequest = statusTransactionApproveRequest;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

	public String getStatusTransactionApproveRequest() {
		return statusTransactionApproveRequest;
	}

	public void setStatusTransactionApproveRequest(String statusTransactionApproveRequest) {
		this.statusTransactionApproveRequest = statusTransactionApproveRequest;
	}
   
}
