/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.util.Date;
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
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.utils.QueryConstants;
import javax.persistence.Basic;

/**
 *
 * @author usuario
 */
@Entity
@Table(name = "commission")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Commission.findAll", query = "SELECT c FROM Commission c"),
    @NamedQuery(name = "Commission.findById", query = "SELECT c FROM Commission c WHERE c.id = :id"),
    @NamedQuery(name = "Commission.findByBeginningDate", query = "SELECT c FROM Commission c WHERE c.beginningDate = :beginningDate"),
    @NamedQuery(name = "Commission.findByEndingDate", query = "SELECT c FROM Commission c WHERE c.endingDate = :endingDate"),
    @NamedQuery(name = "Commission.findByIsPercentCommision", query = "SELECT c FROM Commission c WHERE c.isPercentCommision = :isPercentCommision"),
    @NamedQuery(name = "Commission.findByProductTransactionType", query = "SELECT c FROM Commission c WHERE c.productId.id = :productId AND c.transactionTypeId.id = :transactionTypeId AND c.endingDate is null"),
    @NamedQuery(name = "Commission.findByValue", query = "SELECT c FROM Commission c WHERE c.value = :value"),
    @NamedQuery(name = QueryConstants.COMMISSION_BY_PRODUCT, query = "SELECT c FROM Commission c WHERE c.productId.id= :productId"),
    @NamedQuery(name = QueryConstants.COMMISSION_BY_TRANSACTIONTYPE_AND_PRODUCT, query = "SELECT c FROM Commission c WHERE c.productId.id = :productId AND c.transactionTypeId.id = :transactionTypeId AND c.indApplicationCommission = :indApplicationCommission  AND c.endingDate is null")})

public class Commission extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;    
    @Column(name = "beginningDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date beginningDate;    
    @Column(name = "endingDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endingDate;    
    @Column(name = "isPercentCommision")
    private short isPercentCommision;    
    @Column(name = "value")
    private float value;    
    @JoinColumn(name = "transactionTypeId", referencedColumnName = "id")
    @ManyToOne
    private TransactionType transactionTypeId;    
    @JoinColumn(name = "productId", referencedColumnName = "id")
    @ManyToOne
    private Product productId;    
    @Column(name = "indApplicationCommission")
    private int indApplicationCommission;

    public Commission() {
    }

    public Commission(Long id) {
        this.id = id;
    }

    public Commission(Long id, Date beginningDate, short isPercentCommision, float value) {
        this.id = id;
        this.beginningDate = beginningDate;
        this.isPercentCommision = isPercentCommision;
        this.value = value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public short getIsPercentCommision() {
        return isPercentCommision;
    }

    public void setIsPercentCommision(short isPercentCommision) {
        this.isPercentCommision = isPercentCommision;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public TransactionType getTransactionTypeId() {
        return transactionTypeId;
    }

    public void setTransactionTypeId(TransactionType transactionTypeId) {
        this.transactionTypeId = transactionTypeId;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }
    
    public int getIndApplicationCommission() {
        return indApplicationCommission;
    }

    public void setIndApplicationCommission(int indApplicationCommission) {
        this.indApplicationCommission = indApplicationCommission;
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
        if (!(object instanceof Commission)) {
            return false;
        }
        Commission other = (Commission) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.Commission[ id=" + id + " ]";
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
