/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "account_bank")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountBank.findAll", query = "SELECT a FROM AccountBank a")
    , @NamedQuery(name = "AccountBank.findById", query = "SELECT a FROM AccountBank a WHERE a.id = :id")
    , @NamedQuery(name = "AccountBank.findByUnifiedRegistryId", query = "SELECT a FROM AccountBank a WHERE a.unifiedRegistryId = :unifiedRegistryId")
    , @NamedQuery(name = "AccountBank.findByUnifiedRegistryIdByAccountNumberByBankIdByStatusAccountId", query = "SELECT a FROM AccountBank a WHERE a.unifiedRegistryId = :unifiedRegistryId AND a.accountNumber = :accountNumber AND a.bankId.id = :bankId AND a.statusAccountBankId.id = 1")
    , @NamedQuery(name = "AccountBank.findByAccountNumber", query = "SELECT a FROM AccountBank a WHERE a.accountNumber = :accountNumber")
    , @NamedQuery(name = "AccountBank.findByUpdateDate", query = "SELECT a FROM AccountBank a WHERE a.updateDate = :updateDate")
    , @NamedQuery(name = "AccountBank.findByCreateDate", query = "SELECT a FROM AccountBank a WHERE a.createDate = :createDate")})

public class AccountBank extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "UnifiedRegistryId")
    private long unifiedRegistryId;
    @Column(name = "accountNumber")
    private String accountNumber;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @Basic(optional = false)
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @JoinColumn(name = "accountTypeBankId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private AccountTypeBank accountTypeBankId;
    @JoinColumn(name = "bankId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Bank bankId;
    @JoinColumn(name = "statusAccountBankId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusAccountBank statusAccountBankId;
    @Column(name = "businessId")
    private long businessId;

    public AccountBank() {
    }

    public AccountBank(Long id) {
        this.id = id;
    }

    public AccountBank(Long id, long unifiedRegistryId, String accountNumber, Date createDate) {
        this.id = id;
        this.unifiedRegistryId = unifiedRegistryId;
        this.accountNumber = accountNumber;
        this.createDate = createDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getUnifiedRegistryId() {
        return unifiedRegistryId;
    }

    public void setUnifiedRegistryId(long unifiedRegistryId) {
        this.unifiedRegistryId = unifiedRegistryId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public AccountTypeBank getAccountTypeBankId() {
        return accountTypeBankId;
    }

    public void setAccountTypeBankId(AccountTypeBank accountTypeBankId) {
        this.accountTypeBankId = accountTypeBankId;
    }

    public Bank getBankId() {
        return bankId;
    }

    public void setBankId(Bank bankId) {
        this.bankId = bankId;
    }

    public StatusAccountBank getStatusAccountBankId() {
        return statusAccountBankId;
    }

    public void setStatusAccountBankId(StatusAccountBank statusAccountBankId) {
        this.statusAccountBankId = statusAccountBankId;
    }
     

    public long getBusinessId() {
		return businessId;
	}

	public void setBusinessId(long businessId) {
		this.businessId = businessId;
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
        if (!(object instanceof AccountBank)) {
            return false;
        }
        AccountBank other = (AccountBank) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.AccountBank[ id=" + id + " ]";
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
