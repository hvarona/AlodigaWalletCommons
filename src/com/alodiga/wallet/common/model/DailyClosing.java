/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "daily_closing")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DailyClosing.findAll", query = "SELECT d FROM DailyClosing d")
    , @NamedQuery(name = "DailyClosing.findById", query = "SELECT d FROM DailyClosing d WHERE d.id = :id")
    , @NamedQuery(name = "DailyClosing.findByClosingDate", query = "SELECT d FROM DailyClosing d WHERE d.closingDate = :closingDate")
    , @NamedQuery(name = "DailyClosing.findByClosingStartTime", query = "SELECT d FROM DailyClosing d WHERE d.closingStartTime = :closingStartTime")
    , @NamedQuery(name = "DailyClosing.findByClosingEndTime", query = "SELECT d FROM DailyClosing d WHERE d.closingEndTime = :closingEndTime")
    , @NamedQuery(name = "DailyClosing.findByTotalTransactions", query = "SELECT d FROM DailyClosing d WHERE d.totalTransactions = :totalTransactions")
    , @NamedQuery(name = "DailyClosing.findByCreateDate", query = "SELECT d FROM DailyClosing d WHERE d.createDate = :createDate")
    , @NamedQuery(name = "DailyClosing.findByUpdateDate", query = "SELECT d FROM DailyClosing d WHERE d.updateDate = :updateDate")})
public class DailyClosing implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "closingDate")
    @Temporal(TemporalType.DATE)
    private Date closingDate;
    @Column(name = "closingStartTime")
    @Temporal(TemporalType.TIME)
    private Date closingStartTime;
    @Column(name = "closingEndTime")
    @Temporal(TemporalType.TIME)
    private Date closingEndTime;
    @Column(name = "totalTransactions")
    private Integer totalTransactions;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "dailyClosingTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DailyClosingType dailyClosingTypeId;
    @OneToMany(mappedBy = "dailyClosingId")
    private Collection<Transaction> transactionCollection;

    public DailyClosing() {
    }

    public DailyClosing(Long id) {
        this.id = id;
    }

    public DailyClosing(Long id, Date closingDate) {
        this.id = id;
        this.closingDate = closingDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public Date getClosingStartTime() {
        return closingStartTime;
    }

    public void setClosingStartTime(Date closingStartTime) {
        this.closingStartTime = closingStartTime;
    }

    public Date getClosingEndTime() {
        return closingEndTime;
    }

    public void setClosingEndTime(Date closingEndTime) {
        this.closingEndTime = closingEndTime;
    }

    public Integer getTotalTransactions() {
        return totalTransactions;
    }

    public void setTotalTransactions(Integer totalTransactions) {
        this.totalTransactions = totalTransactions;
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

    public DailyClosingType getDailyClosingTypeId() {
        return dailyClosingTypeId;
    }

    public void setDailyClosingTypeId(DailyClosingType dailyClosingTypeId) {
        this.dailyClosingTypeId = dailyClosingTypeId;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<Transaction> getTransactionCollection() {
        return transactionCollection;
    }

    public void setTransactionCollection(Collection<Transaction> transactionCollection) {
        this.transactionCollection = transactionCollection;
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
        if (!(object instanceof DailyClosing)) {
            return false;
        }
        DailyClosing other = (DailyClosing) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.DailyClosing[ id=" + id + " ]";
    }
    
}
