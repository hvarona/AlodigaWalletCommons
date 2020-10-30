/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.math.BigInteger;
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
import javax.xml.bind.annotation.XmlRootElement;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.model.Bank;
import com.alodiga.wallet.common.model.BankOperation;
import com.alodiga.wallet.common.model.BankOperationMode;
import com.alodiga.wallet.common.model.BankOperationType;
import com.alodiga.wallet.common.model.Commission;
import com.alodiga.wallet.common.model.Product;
import com.alodiga.wallet.common.model.Transaction;
import java.util.Collection;
import java.util.Date;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "bank_operation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BankOperation.findAll", query = "SELECT b FROM BankOperation b"), 
    @NamedQuery(name = "BankOperation.findById", query = "SELECT b FROM BankOperation b WHERE b.id = :id"),
    @NamedQuery(name = "BankOperation.findByUserSourceId", query = "SELECT b FROM BankOperation b WHERE b.userSourceId = :userSourceId"),
    @NamedQuery(name = "BankOperation.findByBankOperationNumber", query = "SELECT b FROM BankOperation b WHERE b.bankOperationNumber = :bankOperationNumber")})

public class BankOperation extends AbstractWalletEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "bankOperationDate")
    @Temporal(TemporalType.DATE)
    private Date bankOperationDate;
    @Basic(optional = false)
    @Column(name = "bankOperationAmount")
    private float bankOperationAmount;
    @JoinColumn(name = "accountBankId", referencedColumnName = "id")
    @ManyToOne
    private AccountBank accountBankId;
    @JoinColumn(name = "paymentTypeId", referencedColumnName = "id")
    @ManyToOne
    private PaymentType paymentTypeId;
    private static final long serialVersionUID = 1L;    
    @Column(name = "userSourceId")
    private BigInteger userSourceId;
    @Column(name = "bankOperationNumber")
    private String bankOperationNumber;
    @Column(name = "responsible")
    private String responsible;
    @Column(name = "observations")
    private String observations;
    @JoinColumn(name = "commisionId", referencedColumnName = "id")
    @ManyToOne
    private Commission commisionId;
    @JoinColumn(name = "productId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Product productId;
    @JoinColumn(name = "transactionId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Transaction transactionId;
    @JoinColumn(name = "bankId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Bank bankId;
    @JoinColumn(name = "statusBankOperationId", referencedColumnName = "id")
    private StatusBankOperation statusBankOperationId;
    @JoinColumn(name = "bankOperationTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private BankOperationType bankOperationTypeId;
    @JoinColumn(name = "bankOperationModeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private BankOperationMode bankOperationModeId;
    @Column(name = "businessId")
    private BigInteger businessId;
    @Column(name = "accountBankBusinessId")
    private BigInteger accountBankBusinessId;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;

    public BankOperation() {
    }

    public BankOperation(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigInteger getUserSourceId() {
        return userSourceId;
    }

    public void setUserSourceId(BigInteger userSourceId) {
        this.userSourceId = userSourceId;
    }

    public String getBankOperationNumber() {
        return bankOperationNumber;
    }

    public void setBankOperationNumber(String bankOperationNumber) {
        this.bankOperationNumber = bankOperationNumber;
    }
    
    public String getResponsible() {
        return responsible;
    }

    public void setResponsible(String responsible) {
        this.responsible = responsible;
    }

    public Commission getCommisionId() {
        return commisionId;
    }

    public void setCommisionId(Commission commisionId) {
        this.commisionId = commisionId;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public Transaction getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Transaction transactionId) {
        this.transactionId = transactionId;
    }

    public Bank getBankId() {
        return bankId;
    }

    public void setBankId(Bank bankId) {
        this.bankId = bankId;
    }

    public BankOperationType getBankOperationTypeId() {
        return bankOperationTypeId;
    }

    public void setBankOperationTypeId(BankOperationType bankOperationTypeId) {
        this.bankOperationTypeId = bankOperationTypeId;
    }

    public BankOperationMode getBankOperationModeId() {
        return bankOperationModeId;
    }

    public void setBankOperationModeId(BankOperationMode bankOperationModeId) {
        this.bankOperationModeId = bankOperationModeId;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public StatusBankOperation getStatusBankOperationId() {
        return statusBankOperationId;
    }

    public void setStatusBankOperationId(StatusBankOperation statusBankOperationId) {
        this.statusBankOperationId = statusBankOperationId;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BankOperation)) {
            return false;
        }
        BankOperation other = (BankOperation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.model.BankOperation[ id=" + id + " ]";
    }
    
    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }

    public Date getBankOperationDate() {
        return bankOperationDate;
    }

    public void setBankOperationDate(Date bankOperationDate) {
        this.bankOperationDate = bankOperationDate;
    }

    public float getBankOperationAmount() {
        return bankOperationAmount;
    }

    public void setBankOperationAmount(float bankOperationAmount) {
        this.bankOperationAmount = bankOperationAmount;
    }

    public AccountBank getAccountBankId() {
        return accountBankId;
    }

    public void setAccountBankId(AccountBank accountBankId) {
        this.accountBankId = accountBankId;
    }

    public PaymentType getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(PaymentType paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

	public BigInteger getBusinessId() {
		return businessId;
	}

	public void setBusinessId(BigInteger businessId) {
		this.businessId = businessId;
	}

	public BigInteger getAccountBankBusinessId() {
		return accountBankBusinessId;
	}

	public void setAccountBankBusinessId(BigInteger accountBankBusinessId) {
		this.accountBankBusinessId = accountBankBusinessId;
	}	
    
}
