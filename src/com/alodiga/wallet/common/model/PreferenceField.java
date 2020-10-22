/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;
import javax.validation.constraints.Size;

/**
 *
 * @author usuario
 */
@Entity
@Table(name = "preference_field")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PreferenceField.findAll", query = "SELECT p FROM PreferenceField p"),
    @NamedQuery(name = "PreferenceField.findById", query = "SELECT p FROM PreferenceField p WHERE p.id = :id"),
    @NamedQuery(name = "PreferenceField.findByName", query = "SELECT p FROM PreferenceField p WHERE p.name = :name"),
    @NamedQuery(name = "PreferenceField.findByPreference", query = "SELECT p FROM PreferenceField p WHERE p.preferenceId.id = :preferenceId"),
    @NamedQuery(name = QueryConstants.CODE_EXIST_IN_BD_PREFERENCE_FIELD, query = "SELECT p FROM PreferenceField p WHERE p.code = :code"),
    @NamedQuery(name = "PreferenceField.findByEnabled", query = "SELECT p FROM PreferenceField p WHERE p.enabled = :enabled")})

public class PreferenceField extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "enabled")
    private short enabled;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preferenceFieldId")
    private Collection<PreferenceValue> preferenceValueCollection;
    @JoinColumn(name = "preferenceTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PreferenceType preferenceTypeId;
    @JoinColumn(name = "preferenceId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Preference preferenceId;
    @OneToMany(mappedBy = "preferenceField", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<PreferenceFieldData> preferenceFieldData;
    @Size(max = 80)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "code")
    private String code;

    public PreferenceField() {
    }

    public PreferenceField(Long id) {
        this.id = id;
    }

    public PreferenceField(Long id, String name, short enabled) {
        this.id = id;
        this.name = name;
        this.enabled = enabled;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    
    public short getEnabled() {
        return enabled;
    }

    public void setEnabled(short enabled) {
        this.enabled = enabled;
    }

    @XmlTransient
    public Collection<PreferenceValue> getPreferenceValueCollection() {
        return preferenceValueCollection;
    }

    public void setPreferenceValueCollection(Collection<PreferenceValue> preferenceValueCollection) {
        this.preferenceValueCollection = preferenceValueCollection;
    }

    public PreferenceType getPreferenceTypeId() {
        return preferenceTypeId;
    }

    public void setPreferenceTypeId(PreferenceType preferenceTypeId) {
        this.preferenceTypeId = preferenceTypeId;
    }

    public Preference getPreferenceId() {
        return preferenceId;
    }

    public void setPreferenceId(Preference preferenceId) {
        this.preferenceId = preferenceId;
    }

    public PreferenceFieldData getPreferenceFieldDataByLanguageId(Long languageId) {
    	PreferenceFieldData pd = null;
        for (PreferenceFieldData pData : this.preferenceFieldData) {
            if (pData.getLanguage().getId().equals(languageId)) {
                pd = pData;
                break;
            }
        }
        return pd;
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
        if (!(object instanceof PreferenceField)) {
            return false;
        }
        PreferenceField other = (PreferenceField) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.PreferenceField[ id=" + id + " ]";
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