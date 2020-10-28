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
 * @author jose
 */
@Entity
@Table(name = "status_business_affiliation_has_final_state")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusBusinessAffiliationHasFinalState.findAll", query = "SELECT s FROM StatusBusinessAffiliationHasFinalState s")
    , @NamedQuery(name = "StatusBusinessAffiliationHasFinalState.findById", query = "SELECT s FROM StatusBusinessAffiliationHasFinalState s WHERE s.id = :id")
    , @NamedQuery(name = "StatusBusinessAffiliationHasFinalState.findByCreateDate", query = "SELECT s FROM StatusBusinessAffiliationHasFinalState s WHERE s.createDate = :createDate")
    , @NamedQuery(name = "StatusBusinessAffiliationHasFinalState.findByUpdateDate", query = "SELECT s FROM StatusBusinessAffiliationHasFinalState s WHERE s.updateDate = :updateDate")})
public class StatusBusinessAffiliationHasFinalState extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "statusBusinessAffiliationRequetsId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusRequest statusBusinessAffiliationRequetsId;
    @JoinColumn(name = "finalStateId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusRequest finalStateId;

    public StatusBusinessAffiliationHasFinalState() {
    }

    public StatusBusinessAffiliationHasFinalState(Integer id) {
        this.id = id;
    }

    public StatusBusinessAffiliationHasFinalState(Integer id, Date createDate) {
        this.id = id;
        this.createDate = createDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public StatusRequest getStatusBusinessAffiliationRequetsId() {
        return statusBusinessAffiliationRequetsId;
    }

    public void setStatusBusinessAffiliationRequetsId(StatusRequest statusBusinessAffiliationRequetsId) {
        this.statusBusinessAffiliationRequetsId = statusBusinessAffiliationRequetsId;
    }

    public StatusRequest getFinalStateId() {
        return finalStateId;
    }

    public void setFinalStateId(StatusRequest finalStateId) {
        this.finalStateId = finalStateId;
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
        if (!(object instanceof StatusBusinessAffiliationHasFinalState)) {
            return false;
        }
        StatusBusinessAffiliationHasFinalState other = (StatusBusinessAffiliationHasFinalState) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.StatusBusinessAffiliationHasFinalState[ id=" + id + " ]";
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
