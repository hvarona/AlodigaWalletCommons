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
@Table(name = "password_change_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PasswordChangeRequest.findAll", query = "SELECT p FROM PasswordChangeRequest p")
    , @NamedQuery(name = "PasswordChangeRequest.findById", query = "SELECT p FROM PasswordChangeRequest p WHERE p.id = :id")
    , @NamedQuery(name = "PasswordChangeRequest.findByRequestNumber", query = "SELECT p FROM PasswordChangeRequest p WHERE p.requestNumber = :requestNumber")
    , @NamedQuery(name = "PasswordChangeRequest.findByRequestDate", query = "SELECT p FROM PasswordChangeRequest p WHERE p.requestDate = :requestDate")
    , @NamedQuery(name = "PasswordChangeRequest.findByIndApproved", query = "SELECT p FROM PasswordChangeRequest p WHERE p.indApproved = :indApproved")
    , @NamedQuery(name = "PasswordChangeRequest.findByCurrentPassword", query = "SELECT p FROM PasswordChangeRequest p WHERE p.currentPassword = :currentPassword")
    , @NamedQuery(name = "PasswordChangeRequest.findByNewPassword", query = "SELECT p FROM PasswordChangeRequest p WHERE p.newPassword = :newPassword")
    , @NamedQuery(name = "PasswordChangeRequest.findByCreateDate", query = "SELECT p FROM PasswordChangeRequest p WHERE p.createDate = :createDate")
    , @NamedQuery(name = "PasswordChangeRequest.findByUpdateDate", query = "SELECT p FROM PasswordChangeRequest p WHERE p.updateDate = :updateDate")})
public class PasswordChangeRequest extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 40)
    @Column(name = "requestNumber")
    private String requestNumber;
    @Column(name = "requestDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date requestDate;
    @Column(name = "indApproved")
    private Boolean indApproved;
    @Size(max = 80)
    @Column(name = "currentPassword")
    private String currentPassword;
    @Size(max = 80)
    @Column(name = "newPassword")
    private String newPassword;
    @Basic(optional = false)
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "userId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userId;

    public PasswordChangeRequest() {
    }

    public PasswordChangeRequest(Long id) {
        this.id = id;
    }

    public PasswordChangeRequest(Long id, Date createDate) {
        this.id = id;
        this.createDate = createDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRequestNumber() {
        return requestNumber;
    }

    public void setRequestNumber(String requestNumber) {
        this.requestNumber = requestNumber;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Boolean getIndApproved() {
        return indApproved;
    }

    public void setIndApproved(Boolean indApproved) {
        this.indApproved = indApproved;
    }

    public String getCurrentPassword() {
        return currentPassword;
    }

    public void setCurrentPassword(String currentPassword) {
        this.currentPassword = currentPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
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

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof PasswordChangeRequest)) {
            return false;
        }
        PasswordChangeRequest other = (PasswordChangeRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.PasswordChangeRequest[ id=" + id + " ]";
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
