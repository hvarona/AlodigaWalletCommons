/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.math.BigInteger;
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
 * @author usuario
 */
@Entity
@Table(name = "preference_control")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreferenceControl.findAll", query = "SELECT p FROM PreferenceControl p"),
    @NamedQuery(name = "PreferenceControl.findById", query = "SELECT p FROM PreferenceControl p WHERE p.id = :id"),
    @NamedQuery(name = "PreferenceControl.findByPreferenceValueId", query = "SELECT p FROM PreferenceControl p WHERE p.preferenceValueId = :preferenceValueId"),
    @NamedQuery(name = "PreferenceControl.findByUserId", query = "SELECT p FROM PreferenceControl p WHERE p.userId = :userId"),
    @NamedQuery(name = "PreferenceControl.findByParamOld", query = "SELECT p FROM PreferenceControl p WHERE p.paramOld = :paramOld"),
    @NamedQuery(name = "PreferenceControl.findByCreationDate", query = "SELECT p FROM PreferenceControl p WHERE p.creationDate = :creationDate")})
public class PreferenceControl extends AbstractWalletEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "userId")
    private Long userId;
    @Basic(optional = false)
    @Column(name = "paramOld")
    private String paramOld;
    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @JoinColumn(name = "preferenceValueId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PreferenceValue preferenceValueId;

    public PreferenceControl() {
    }

    public PreferenceControl(Long id) {
        this.id = id;
    }

    public PreferenceControl(Long id, String paramOld,Date creationDate) {
        this.id = id;
        this.creationDate = creationDate;
        this.paramOld = paramOld;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
  
    public String getParamOld() {
		return paramOld;
	}

	public void setParamOld(String paramOld) {
		this.paramOld = paramOld;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}


	public PreferenceValue getPreferenceValueId() {
		return preferenceValueId;
	}

	public void setPreferenceValueId(PreferenceValue preferenceValueId) {
		this.preferenceValueId = preferenceValueId;
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
        if (!(object instanceof PreferenceControl)) {
            return false;
        }
        PreferenceControl other = (PreferenceControl) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.PreferenceControl[ id=" + id + " ]";
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
