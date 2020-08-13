/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "business_affiliation_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BusinessAffiliationRequest.findAll", query = "SELECT b FROM BusinessAffiliationRequest b")
    , @NamedQuery(name = "BusinessAffiliationRequest.findById", query = "SELECT b FROM BusinessAffiliationRequest b WHERE b.id = :id")
    , @NamedQuery(name = "BusinessAffiliationRequest.findByNumberRequest", query = "SELECT b FROM BusinessAffiliationRequest b WHERE b.numberRequest = :numberRequest")
    , @NamedQuery(name = "BusinessAffiliationRequest.findByDateRequest", query = "SELECT b FROM BusinessAffiliationRequest b WHERE b.dateRequest = :dateRequest")
    , @NamedQuery(name = "BusinessAffiliationRequest.findByCreateDate", query = "SELECT b FROM BusinessAffiliationRequest b WHERE b.createDate = :createDate")
    , @NamedQuery(name = "BusinessAffiliationRequest.findByUpdateDate", query = "SELECT b FROM BusinessAffiliationRequest b WHERE b.updateDate = :updateDate")})
public class BusinessAffiliationRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 40)
    @Column(name = "numberRequest")
    private String numberRequest;
    @Column(name = "dateRequest")
    @Temporal(TemporalType.DATE)
    private Date dateRequest;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "businessAffiliationRequestId")
    private ReviewBusinessAffiliationRequest reviewBusinessAffiliationRequest;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "businessAffiliationRequestId")
    private RequestHasCollectionRequest requestHasCollectionRequest;
    @JoinColumn(name = "businessPersonId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Person businessPersonId;
    @JoinColumn(name = "statusBusinessAffiliationRequestId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusBusinessAffiliationRequest statusBusinessAffiliationRequestId;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "businessAffiliationRequestId")
    private ReviewOfac reviewOfac;

    public BusinessAffiliationRequest() {
    }

    public BusinessAffiliationRequest(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumberRequest() {
        return numberRequest;
    }

    public void setNumberRequest(String numberRequest) {
        this.numberRequest = numberRequest;
    }

    public Date getDateRequest() {
        return dateRequest;
    }

    public void setDateRequest(Date dateRequest) {
        this.dateRequest = dateRequest;
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

    public ReviewBusinessAffiliationRequest getReviewBusinessAffiliationRequest() {
        return reviewBusinessAffiliationRequest;
    }

    public void setReviewBusinessAffiliationRequest(ReviewBusinessAffiliationRequest reviewBusinessAffiliationRequest) {
        this.reviewBusinessAffiliationRequest = reviewBusinessAffiliationRequest;
    }

    public RequestHasCollectionRequest getRequestHasCollectionRequest() {
        return requestHasCollectionRequest;
    }

    public void setRequestHasCollectionRequest(RequestHasCollectionRequest requestHasCollectionRequest) {
        this.requestHasCollectionRequest = requestHasCollectionRequest;
    }

    public Person getBusinessPersonId() {
        return businessPersonId;
    }

    public void setBusinessPersonId(Person businessPersonId) {
        this.businessPersonId = businessPersonId;
    }

    public StatusBusinessAffiliationRequest getStatusBusinessAffiliationRequestId() {
        return statusBusinessAffiliationRequestId;
    }

    public void setStatusBusinessAffiliationRequestId(StatusBusinessAffiliationRequest statusBusinessAffiliationRequestId) {
        this.statusBusinessAffiliationRequestId = statusBusinessAffiliationRequestId;
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
        if (!(object instanceof BusinessAffiliationRequest)) {
            return false;
        }
        BusinessAffiliationRequest other = (BusinessAffiliationRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.BusinessAffiliationRequets[ id=" + id + " ]";
    }

    public ReviewOfac getReviewOfac() {
        return reviewOfac;
    }

    public void setReviewOfac(ReviewOfac reviewOfac) {
        this.reviewOfac = reviewOfac;
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
