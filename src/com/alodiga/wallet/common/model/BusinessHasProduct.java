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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "business_has_product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BusinessHasProduct.findAll", query = "SELECT b FROM BusinessHasProduct b")
    , @NamedQuery(name = "BusinessHasProduct.findById", query = "SELECT b FROM BusinessHasProduct b WHERE b.id = :id")
    , @NamedQuery(name = "BusinessHasProduct.findByProductId", query = "SELECT b FROM BusinessHasProduct b WHERE b.productId = :productId")
    , @NamedQuery(name = "BusinessHasProduct.findByBusinessId", query = "SELECT b FROM BusinessHasProduct b WHERE b.businessId = :businessId")
    , @NamedQuery(name = "BusinessHasProduct.findByBeginningDate", query = "SELECT b FROM BusinessHasProduct b WHERE b.beginningDate = :beginningDate")
    , @NamedQuery(name = "BusinessHasProduct.findByEndingDate", query = "SELECT b FROM BusinessHasProduct b WHERE b.endingDate = :endingDate")})
public class BusinessHasProduct implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "productId")
    private long productId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "businessId")
    private long businessId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "beginningDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date beginningDate;
    @Column(name = "endingDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endingDate;

    public BusinessHasProduct() {
    }

    public BusinessHasProduct(Long id) {
        this.id = id;
    }

    public BusinessHasProduct(Long id, long productId, long businessId, Date beginningDate) {
        this.id = id;
        this.productId = productId;
        this.businessId = businessId;
        this.beginningDate = beginningDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public long getBusinessId() {
        return businessId;
    }

    public void setBusinessId(long businessId) {
        this.businessId = businessId;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BusinessHasProduct)) {
            return false;
        }
        BusinessHasProduct other = (BusinessHasProduct) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.BusinessHasProduct[ id=" + id + " ]";
    }
    
}
