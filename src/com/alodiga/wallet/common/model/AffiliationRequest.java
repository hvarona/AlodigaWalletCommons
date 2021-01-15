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
import com.alodiga.wallet.common.utils.QueryConstants;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "affiliation_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AffiliationRequest.findAll", query = "SELECT a FROM AffiliationRequest a")
    , @NamedQuery(name = "AffiliationRequest.findById", query = "SELECT a FROM AffiliationRequest a WHERE a.id = :id")
    , @NamedQuery(name = "AffiliationRequest.findByNumberRequest", query = "SELECT a FROM AffiliationRequest a WHERE a.numberRequest = :numberRequest")
    , @NamedQuery(name = "AffiliationRequest.findByDateRequest", query = "SELECT a FROM AffiliationRequest a WHERE a.dateRequest = :dateRequest")
    , @NamedQuery(name = "AffiliationRequest.findByCreateDate", query = "SELECT a FROM AffiliationRequest a WHERE a.createDate = :createDate")
    , @NamedQuery(name = "AffiliationRequest.findByUpdateDate", query = "SELECT a FROM AffiliationRequest a WHERE a.updateDate = :updateDate")
    , @NamedQuery(name = QueryConstants.AFFILIATION_REQUEST_BY_REQUEST_TYPE_ID, query = "SELECT a FROM AffiliationRequest a WHERE a.requestTypeId.id = :requestTypeId")
    , @NamedQuery(name = QueryConstants.AFFILIATION_REQUEST_BY_LEGAL_PERSON, query = "SELECT a FROM AffiliationRequest a WHERE a.businessPersonId.id = :legalPersonId")})


public class AffiliationRequest extends AbstractWalletEntity implements Serializable {

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
    @JoinColumn(name = "businessPersonId", referencedColumnName = "id")
    @OneToOne
    private Person businessPersonId;
    @JoinColumn(name = "userRegisterUnifiedId", referencedColumnName = "id")
    @OneToOne
    private Person userRegisterUnifiedId;
    @JoinColumn(name = "statusRequestId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusRequest statusRequestId;
    @JoinColumn(name = "requestTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private RequestType requestTypeId;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "affiliationRequestId")
    private ReviewAffiliationRequest reviewAffiliationRequest;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "affiliationRequestId")
    private RequestHasCollectionRequest requestHasCollectionRequest;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "affiliationRequestId")
    private ReviewOfac reviewOfac;

    public AffiliationRequest() {
    }

    public AffiliationRequest(Long id) {
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
    
        public Person getUserRegisterUnifiedId() {
        return userRegisterUnifiedId;
    }

    public void setUserRegisterUnifiedId(Person userRegisterUnifiedId) {
        this.userRegisterUnifiedId = userRegisterUnifiedId;
    }

    public RequestType getRequestTypeId() {
        return requestTypeId;
    }

    public void setRequestTypeId(RequestType requestTypeId) {
        this.requestTypeId = requestTypeId;
    }

    public StatusRequest getStatusRequestId() {
        return statusRequestId;
    }

    public void setStatusRequestId(StatusRequest statusRequestId) {
        this.statusRequestId = statusRequestId;
    }

    public ReviewAffiliationRequest getReviewAffiliationRequest() {
        return reviewAffiliationRequest;
    }

    public void setReviewAffiliationRequest(ReviewAffiliationRequest reviewAffiliationRequest) {
        this.reviewAffiliationRequest = reviewAffiliationRequest;
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
        if (!(object instanceof AffiliationRequest)) {
            return false;
        }
        AffiliationRequest other = (AffiliationRequest) object;
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
