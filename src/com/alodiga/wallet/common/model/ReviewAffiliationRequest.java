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

/**
 *
 * @author jose
 */
@Entity
@Table(name = "review_affiliation_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReviewAffiliationRequest.findAll", query = "SELECT r FROM ReviewAffiliationRequest r"),
    @NamedQuery(name = "ReviewAffiliationRequest.findById", query = "SELECT r FROM ReviewAffiliationRequest r WHERE r.id = :id"),
    @NamedQuery(name = "ReviewAffiliationRequest.findByReviewDate", query = "SELECT r FROM ReviewAffiliationRequest r WHERE r.reviewDate = :reviewDate"),
    @NamedQuery(name = "ReviewAffiliationRequest.findByObservations", query = "SELECT r FROM ReviewAffiliationRequest r WHERE r.observations = :observations"),
    @NamedQuery(name = "ReviewsAffiliationRequest.findByIndApproved", query = "SELECT r FROM ReviewAffiliationRequest r WHERE r.indApproved = :indApproved"),
    @NamedQuery(name = "ReviewAffiliationRequest.findByCreateDate", query = "SELECT r FROM ReviewAffiliationRequest r WHERE r.createDate = :createDate"),
    @NamedQuery(name = "ReviewAffiliationRequest.findByUpdateDate", query = "SELECT r FROM ReviewAffiliationRequest r WHERE r.updateDate = :updateDate"),
    @NamedQuery(name = QueryConstants.REVIEW_REQUEST_BY_REQUEST, query = "SELECT r FROM ReviewAffiliationRequest r where r.affiliationRequestId.id = :affiliationRequestId AND r.reviewTypeId.id = :reviewTypeId")})

public class ReviewAffiliationRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "ReviewDate")
    @Temporal(TemporalType.DATE)
    private Date reviewDate;
    @Size(max = 1000)
    @Column(name = "observations")
    private String observations;
    @Column(name = "indApproved")
    private Boolean indApproved;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "affiliationRequestId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private AffiliationRequest affiliationRequestId;
    @JoinColumn(name = "reviewTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ReviewType reviewTypeId;
    @JoinColumn(name = "userReviewId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userReviewId;

    public ReviewAffiliationRequest() {
    }

    public ReviewAffiliationRequest(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
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

    public AffiliationRequest getAffiliationRequestId() {
        return affiliationRequestId;
    }

    public void setAffiliationRequestId(AffiliationRequest affiliationRequestId) {
        this.affiliationRequestId = affiliationRequestId;
    }

    public ReviewType getReviewTypeId() {
        return reviewTypeId;
    }

    public void setReviewTypeId(ReviewType reviewTypeId) {
        this.reviewTypeId = reviewTypeId;
    }

    public User getUserReviewId() {
        return userReviewId;
    }

    public void setUserReviewId(User userReviewId) {
        this.userReviewId = userReviewId;
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
        if (!(object instanceof ReviewAffiliationRequest)) {
            return false;
        }
        ReviewAffiliationRequest other = (ReviewAffiliationRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.ReviewBusinessAffiliationRequest[ id=" + id + " ]";
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
