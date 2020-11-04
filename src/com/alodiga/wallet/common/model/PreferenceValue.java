/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
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

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;

/**
 *
 * @author usuario
 */
@Entity
@Table(name = "preference_value")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreferenceValue.findAll", query = "SELECT p FROM PreferenceValue p"),
    @NamedQuery(name = "PreferenceValue.findById", query = "SELECT p FROM PreferenceValue p WHERE p.id = :id"),
    @NamedQuery(name = "PreferenceValue.findByPreferenceFieldId", query = "SELECT p FROM PreferenceValue p WHERE p.preferenceFieldId.id = :preferenceFieldId and p.preferenceClassficationId.id = :preferenceClassficationId and p.productId IS NULL and p.transactionTypeId IS NULL and p.bussinessId IS NULL and p.enabled = 1"),
    @NamedQuery(name = "PreferenceValue.findByValue", query = "SELECT p FROM PreferenceValue p WHERE p.value = :value"),
    @NamedQuery(name = "PreferenceValue.findByCreateDate", query = "SELECT p FROM PreferenceValue p WHERE p.createDate = :createDate"),
    @NamedQuery(name = "PreferenceValue.findByUpdateDate", query = "SELECT p FROM PreferenceValue p WHERE p.updateDate = :updateDate")})

public class PreferenceValue extends AbstractWalletEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "value")
    private String value;
    @Column(name = "beginningDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date beginningDate;    
    @Column(name = "endingDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endingDate;    
    @Column(name = "isPercentage")
    private Boolean isPercentage;   
    @JoinColumn(name = "preferenceFieldId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PreferenceField preferenceFieldId;
    @JoinColumn(name = "productId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Product productId;
    @JoinColumn(name = "transactionTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private TransactionType transactionTypeId;
    @JoinColumn(name = "preferenceClassficationId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PreferenceClassification preferenceClassficationId;
    @JoinColumn(name = "preferenceValueParentId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PreferenceValue preferenceValueParentId;
    private Long bussinessId;
    @Basic(optional = false)
    @Column(name = "enabled")
    private boolean enabled;
    @Basic(optional = false)
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;

    public PreferenceValue() {
    }

    public PreferenceValue(Long id) {
        this.id = id;
    }

    public PreferenceValue(Long id, String value, Date createDate, Date updateDate) {
        this.id = id;
        this.value = value;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Date getBeginningDate() {
        return beginningDate;
    }

    public void setBeginningDate(Date beginningDate) {
        this.beginningDate = beginningDate;
    }

    public Date getEndingDate() {
        return endingDate;
    }

    public void setEndingDate(Date endingDate) {
        this.endingDate = endingDate;
    }

    public Boolean getIsPercentage() {
        return isPercentage;
    }

    public void setIsPercentage(Boolean isPercentage) {
        this.isPercentage = isPercentage;
    }

    public PreferenceField getPreferenceFieldId() {
        return preferenceFieldId;
    }

    public void setPreferenceFieldId(PreferenceField preferenceFieldId) {
        this.preferenceFieldId = preferenceFieldId;
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

	public Product getProductId() {
		return productId;
	}

	public void setProductId(Product productId) {
		this.productId = productId;
	}

	public TransactionType getTransactionTypeId() {
		return transactionTypeId;
	}

	public void setTransactionTypeId(TransactionType transactionTypeId) {
		this.transactionTypeId = transactionTypeId;
	}

	public PreferenceClassification getPreferenceClassficationId() {
		return preferenceClassficationId;
	}

	public void setPreferenceClassficationId(PreferenceClassification preferenceClassficationId) {
		this.preferenceClassficationId = preferenceClassficationId;
	}

	public PreferenceValue getPreferenceValueParentId() {
		return preferenceValueParentId;
	}

	public void setPreferenceValueParentId(PreferenceValue preferenceValueParentId) {
		this.preferenceValueParentId = preferenceValueParentId;
	}

	public Long getBussinessId() {
		return bussinessId;
	}

	public void setBussinessId(Long bussinessId) {
		this.bussinessId = bussinessId;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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
        if (!(object instanceof PreferenceValue)) {
            return false;
        }
        PreferenceValue other = (PreferenceValue) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.PreferenceValue[ id=" + id + " ]";
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
