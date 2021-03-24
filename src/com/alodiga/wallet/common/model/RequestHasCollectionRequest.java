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
@Table(name = "request_has_collection_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RequestHasCollectionRequest.findAll", query = "SELECT r FROM RequestHasCollectionRequest r"),
    @NamedQuery(name = "RequestHasCollectionRequest.findById", query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.id = :id"),
    @NamedQuery(name = "RequestHasCollectionRequest.findByCreateDate", query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.createDate = :createDate"),
    @NamedQuery(name = "RequestHasCollectionRequest.findByUpdateDate", query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.updateDate = :updateDate"),
    @NamedQuery(name = "RequestHasCollectionRequest.findByImageFileUrl", query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.imageFileUrl = :imageFileUrl"),
    @NamedQuery(name = "RequestHasCollectionRequest.findByObservations", query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.observations = :observations"),
    @NamedQuery(name = "RequestHasCollectionRequest.findByIndApproved", query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.indApproved = :indApproved"),
    @NamedQuery(name = QueryConstants.REQUEST_HAS_COLLECTION_REQUEST_BY_REQUEST_BY_COLLECTION_REQUEST, query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.affiliationRequestId.id=:affiliationRequestId AND r.collectionsRequestId.id=:collectionsRequestId"),
    @NamedQuery(name = QueryConstants.REQUEST_HAS_COLLECTION_REQUEST_BY_AFFILIATON_REQUEST, query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.affiliationRequestId.id=:affiliationRequestId"),
    @NamedQuery(name = QueryConstants.REQUEST_HAS_COLLECTION_REQUEST_BY_AFFILIATON_REQUEST_COMPLET, query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.affiliationRequestId.id=:affiliationRequestId AND r.indApproved is null or r.indApproved=0"),
    @NamedQuery(name = QueryConstants.REQUEST_HAS_COLLECTION_REQUEST_BY_AFFILIATON_REQUEST_INCOMPLET, query = "SELECT r FROM RequestHasCollectionRequest r WHERE r.affiliationRequestId.id=:affiliationRequestId AND r.indApproved=0")})

public class RequestHasCollectionRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @Size(max = 250)
    @Column(name = "imageFileUrl")
    private String imageFileUrl;
    @Size(max = 1000)
    @Column(name = "observations")
    private String observations;
    @Column(name = "indApproved")
    private Boolean indApproved;
    @JoinColumn(name = "affiliationRequestId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private AffiliationRequest affiliationRequestId;
    @JoinColumn(name = "collectionsRequestId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CollectionsRequest collectionsRequestId;

    public RequestHasCollectionRequest() {
    }

    public RequestHasCollectionRequest(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getImageFileUrl() {
        return imageFileUrl;
    }

    public void setImageFileUrl(String imageFileUrl) {
        this.imageFileUrl = imageFileUrl;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public Boolean getIndApproved() {
        return indApproved;
    }

    public void setIndApproved(Boolean indApproved) {
        this.indApproved = indApproved;
    }

    public AffiliationRequest getAffiliationRequestId() {
        return affiliationRequestId;
    }

    public void setAffiliationRequestId(AffiliationRequest affiliationRequestId) {
        this.affiliationRequestId = affiliationRequestId;
    }

    public CollectionsRequest getCollectionsRequestId() {
        return collectionsRequestId;
    }

    public void setCollectionsRequestId(CollectionsRequest collectionsRequestId) {
        this.collectionsRequestId = collectionsRequestId;
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
        if (!(object instanceof RequestHasCollectionRequest)) {
            return false;
        }
        RequestHasCollectionRequest other = (RequestHasCollectionRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.RequestHasCollectionRequest[ id=" + id + " ]";
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
