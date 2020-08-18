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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "status_card_has_final_state")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusCardHasFinalState.findAll", query = "SELECT s FROM StatusCardHasFinalState s")
    , @NamedQuery(name = "StatusCardHasFinalState.findById", query = "SELECT s FROM StatusCardHasFinalState s WHERE s.id = :id")
    , @NamedQuery(name = "StatusCardHasFinalState.findByCreateDate", query = "SELECT s FROM StatusCardHasFinalState s WHERE s.createDate = :createDate")
    , @NamedQuery(name = "StatusCardHasFinalState.findByUpdateDate", query = "SELECT s FROM StatusCardHasFinalState s WHERE s.updateDate = :updateDate")
    , @NamedQuery(name = QueryConstants.CARDSTATUS_BY_ID, query = "SELECT s FROM StatusCardHasFinalState s WHERE s.statusCardId.id=:statusCardId")})
public class StatusCardHasFinalState extends AbstractWalletEntity implements Serializable {

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
    @JoinColumn(name = "statusCardId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusCard statusCardId;
    @JoinColumn(name = "statusCardFinalStateId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusCard statusCardFinalStateId;

    public StatusCardHasFinalState() {
    }

    public StatusCardHasFinalState(Long id) {
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

    public StatusCard getStatusCardId() {
        return statusCardId;
    }

    public void setStatusCardId(StatusCard statusCardId) {
        this.statusCardId = statusCardId;
    }

    public StatusCard getStatusCardFinalStateId() {
        return statusCardFinalStateId;
    }

    public void setStatusCardFinalStateId(StatusCard statusCardFinalStateId) {
        this.statusCardFinalStateId = statusCardFinalStateId;
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
        if (!(object instanceof StatusCardHasFinalState)) {
            return false;
        }
        StatusCardHasFinalState other = (StatusCardHasFinalState) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.StatusCardHasFinalState[ id=" + id + " ]";
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
