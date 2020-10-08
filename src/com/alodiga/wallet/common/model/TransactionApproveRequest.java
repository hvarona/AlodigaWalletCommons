/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "transaction_approve_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TransactionApproveRequest.findAll", query = "SELECT t FROM TransactionApproveRequest t")
    , @NamedQuery(name = "TransactionApproveRequest.findById", query = "SELECT t FROM TransactionApproveRequest t WHERE t.id = :id")
    , @NamedQuery(name = "TransactionApproveRequest.findByUnifiedRegistryUserId", query = "SELECT t FROM TransactionApproveRequest t WHERE t.unifiedRegistryUserId = :unifiedRegistryUserId")
    , @NamedQuery(name = "TransactionApproveRequest.findByCreateDate", query = "SELECT t FROM TransactionApproveRequest t WHERE t.createDate = :createDate")
    , @NamedQuery(name = "TransactionApproveRequest.findByUpdateDate", query = "SELECT t FROM TransactionApproveRequest t WHERE t.updateDate = :updateDate")
    , @NamedQuery(name = "TransactionApproveRequest.findByRequestNumber", query = "SELECT t FROM TransactionApproveRequest t WHERE t.requestNumber = :requestNumber")
    , @NamedQuery(name = "TransactionApproveRequest.findByRequestDate", query = "SELECT t FROM TransactionApproveRequest t WHERE t.requestDate = :requestDate")
    , @NamedQuery(name = "TransactionApproveRequest.findByIndApproveRequest", query = "SELECT t FROM TransactionApproveRequest t WHERE t.indApproveRequest = :indApproveRequest")
    , @NamedQuery(name = "TransactionApproveRequest.findByApprovedRequestDate", query = "SELECT t FROM TransactionApproveRequest t WHERE t.approvedRequestDate = :approvedRequestDate")
    , @NamedQuery(name = "TransactionApproveRequest.findByObservations", query = "SELECT t FROM TransactionApproveRequest t WHERE t.observations = :observations")
    , @NamedQuery(name = "TransactionApproveRequest.findByBusinessId", query = "SELECT t FROM TransactionApproveRequest t WHERE t.businessId = :businessId")
    , @NamedQuery(name = QueryConstants.TRANSACTION_APPROVE_REQUEST_BY_STATUS, query = "SELECT t FROM TransactionApproveRequest t  WHERE t.requestNumber like CONCAT('%',:requestNumber,'%')")})

public class TransactionApproveRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "UnifiedRegistryUserId")
    private BigInteger unifiedRegistryUserId;
    @Basic(optional = false)
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @Basic(optional = false)
    @Column(name = "requestNumber")
    private String requestNumber;
    @Basic(optional = false)
    @Column(name = "requestDate")
    @Temporal(TemporalType.DATE)
    private Date requestDate;
    @Column(name = "indApproveRequest")
    private Boolean indApproveRequest;
    @Column(name = "approvedRequestDate")
    @Temporal(TemporalType.DATE)
    private Date approvedRequestDate;
    @Column(name = "observations")
    private String observations;
    @Column(name = "businessId")
    private BigInteger businessId;
    @JoinColumn(name = "bankOperationId", referencedColumnName = "id")
    @ManyToOne
    private BankOperation bankOperationId;
    @JoinColumn(name = "productId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Product productId;
    @JoinColumn(name = "statusTransactionApproveRequestId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusTransactionApproveRequest statusTransactionApproveRequestId;
    @JoinColumn(name = "transactionId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Transaction transactionId;
    @JoinColumn(name = "userApprovedRequestId", referencedColumnName = "id")
    @ManyToOne
    private User userApprovedRequestId;

    public TransactionApproveRequest() {
    }

    public TransactionApproveRequest(Long id) {
        this.id = id;
    }

    public TransactionApproveRequest(Long id, Date createDate, String requestNumber, Date requestDate) {
        this.id = id;
        this.createDate = createDate;
        this.requestNumber = requestNumber;
        this.requestDate = requestDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigInteger getUnifiedRegistryUserId() {
        return unifiedRegistryUserId;
    }

    public void setUnifiedRegistryUserId(BigInteger unifiedRegistryUserId) {
        this.unifiedRegistryUserId = unifiedRegistryUserId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRequestNumber() {
        return requestNumber;
    }

    public void setRequestNumber(String requestNumber) {
        this.requestNumber = requestNumber;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Boolean getIndApproveRequest() {
        return indApproveRequest;
    }

    public void setIndApproveRequest(Boolean indApproveRequest) {
        this.indApproveRequest = indApproveRequest;
    }

    public Date getApprovedRequestDate() {
        return approvedRequestDate;
    }

    public void setApprovedRequestDate(Date approvedRequestDate) {
        this.approvedRequestDate = approvedRequestDate;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public BigInteger getBusinessId() {
        return businessId;
    }

    public void setBusinessId(BigInteger businessId) {
        this.businessId = businessId;
    }

    public BankOperation getBankOperationId() {
        return bankOperationId;
    }

    public void setBankOperationId(BankOperation bankOperationId) {
        this.bankOperationId = bankOperationId;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public StatusTransactionApproveRequest getStatusTransactionApproveRequestId() {
        return statusTransactionApproveRequestId;
    }

    public void setStatusTransactionApproveRequestId(StatusTransactionApproveRequest statusTransactionApproveRequestId) {
        this.statusTransactionApproveRequestId = statusTransactionApproveRequestId;
    }

    public Transaction getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Transaction transactionId) {
        this.transactionId = transactionId;
    }

    public User getUserApprovedRequestId() {
        return userApprovedRequestId;
    }

    public void setUserApprovedRequestId(User userApprovedRequestId) {
        this.userApprovedRequestId = userApprovedRequestId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TransactionApproveRequest)) {
            return false;
        }
        TransactionApproveRequest other = (TransactionApproveRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.TransactionApproveRequest[ id=" + id + " ]";
    }

    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }
    
    
}
