/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "status_bank_operation")
@XmlType(name = "maw_status_bank_operation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusBankOperation.findAll", query = "SELECT s FROM StatusBankOperation s")
    , @NamedQuery(name = "StatusBankOperation.findById", query = "SELECT s FROM StatusBankOperation s WHERE s.id = :id")
    , @NamedQuery(name = "StatusBankOperation.findByDescription", query = "SELECT s FROM StatusBankOperation s WHERE s.description = :description")
    , @NamedQuery(name = "StatusBankOperation.findByCode", query = "SELECT s FROM StatusBankOperation s WHERE s.code = :code")
    , @NamedQuery(name = "StatusBankOperation.findByCreateDate", query = "SELECT s FROM StatusBankOperation s WHERE s.createDate = :createDate")
    , @NamedQuery(name = "StatusBankOperation.findByUpdateDate", query = "SELECT s FROM StatusBankOperation s WHERE s.updateDate = :updateDate")})

public class StatusBankOperation  extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Size(min = 1, max = 50)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "code")
    private String code;
    @Basic(optional = false)   
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;

    public StatusBankOperation() {
    }

    public StatusBankOperation(Long id) {
        this.id = id;
    }

    public StatusBankOperation(Long id, String description, Date createDate) {
        this.id = id;
        this.description = description;
        this.createDate = createDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StatusBankOperation)) {
            return false;
        }
        StatusBankOperation other = (StatusBankOperation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "StatusBankOperation{" + "id=" + id + ", description=" + description + ", code=" + code + ", createDate=" + createDate + ", updateDate=" + updateDate + '}';
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
