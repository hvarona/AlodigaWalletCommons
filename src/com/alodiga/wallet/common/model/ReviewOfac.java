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
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "review_ofac")
@XmlType(name = "maw_review_ofac")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReviewOfac.findAll", query = "SELECT r FROM ReviewOfac r"),
    @NamedQuery(name = "ReviewOfac.findById", query = "SELECT r FROM ReviewOfac r WHERE r.id = :id"),
    @NamedQuery(name = "ReviewOfac.findByResultReview", query = "SELECT r FROM ReviewOfac r WHERE r.resultReview = :resultReview"),
    @NamedQuery(name = "ReviewOfac.findByObservations", query = "SELECT r FROM ReviewOfac r WHERE r.observations = :observations"),
    @NamedQuery(name = "ReviewOfac.findByCreateDate", query = "SELECT r FROM ReviewOfac r WHERE r.createDate = :createDate"),
    @NamedQuery(name = "ReviewOfac.findByUpdateDate", query = "SELECT r FROM ReviewOfac r WHERE r.updateDate = :updateDate"),
    @NamedQuery(name = QueryConstants.REVIEW_OFAC_BY_REQUEST, query = "SELECT r FROM ReviewOfac r WHERE r.personId.id = :personId AND r.affiliationRequestId.id = :affiliationRequestId")})
public class ReviewOfac extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "resultReview")
    private float resultReview;
    @Size(max = 1000)
    @Column(name = "observations")
    private String observations;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "affiliationRequestId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private AffiliationRequest affiliationRequestId;
    @JoinColumn(name = "personId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Person personId;
    @JoinColumn(name = "userReviewId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userReviewId;

    public ReviewOfac() {
    }

    public ReviewOfac(Long id) {
        this.id = id;
    }

    public ReviewOfac(Long id, float resultReview) {
        this.id = id;
        this.resultReview = resultReview;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public float getResultReview() {
        return resultReview;
    }

    public void setResultReview(float resultReview) {
        this.resultReview = resultReview;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
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

    public Person getPersonId() {
        return personId;
    }

    public void setPersonId(Person personId) {
        this.personId = personId;
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
        if (!(object instanceof ReviewOfac)) {
            return false;
        }
        ReviewOfac other = (ReviewOfac) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.ReviewOfac[ id=" + id + " ]";
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
