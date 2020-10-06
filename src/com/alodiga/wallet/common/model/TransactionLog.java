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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "transaction_log")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TransactionLog.findAll", query = "SELECT t FROM TransactionLog t")
    , @NamedQuery(name = "TransactionLog.findById", query = "SELECT t FROM TransactionLog t WHERE t.id = :id")
    , @NamedQuery(name = "TransactionLog.findByObservations", query = "SELECT t FROM TransactionLog t WHERE t.observations = :observations")
    , @NamedQuery(name = "TransactionLog.findByCreateDate", query = "SELECT t FROM TransactionLog t WHERE t.createDate = :createDate")
    , @NamedQuery(name = "TransactionLog.findByUpdateDate", query = "SELECT t FROM TransactionLog t WHERE t.updateDate = :updateDate")})
public class TransactionLog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 1500)
    @Column(name = "observations")
    private String observations;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "codeErrorTransactionLogId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CodeErrorTransactionLog codeErrorTransactionLogId;
    @JoinColumn(name = "statusTransactionLogId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusTransactionLog statusTransactionLogId;
    @JoinColumn(name = "transactionId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Transaction transactionId;

    public TransactionLog() {
    }

    public TransactionLog(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public CodeErrorTransactionLog getCodeErrorTransactionLogId() {
        return codeErrorTransactionLogId;
    }

    public void setCodeErrorTransactionLogId(CodeErrorTransactionLog codeErrorTransactionLogId) {
        this.codeErrorTransactionLogId = codeErrorTransactionLogId;
    }

    public StatusTransactionLog getStatusTransactionLogId() {
        return statusTransactionLogId;
    }

    public void setStatusTransactionLogId(StatusTransactionLog statusTransactionLogId) {
        this.statusTransactionLogId = statusTransactionLogId;
    }

    public Transaction getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Transaction transactionId) {
        this.transactionId = transactionId;
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
        if (!(object instanceof TransactionLog)) {
            return false;
        }
        TransactionLog other = (TransactionLog) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.TransactionLog[ id=" + id + " ]";
    }
    
}
