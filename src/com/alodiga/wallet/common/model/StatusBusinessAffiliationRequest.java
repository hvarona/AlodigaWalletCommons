/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "status_business_affiliation_request")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusBusinessAffiliationRequets.findAll", query = "SELECT s FROM StatusBusinessAffiliationRequets s")
    , @NamedQuery(name = "StatusBusinessAffiliationRequets.findById", query = "SELECT s FROM StatusBusinessAffiliationRequets s WHERE s.id = :id")
    , @NamedQuery(name = "StatusBusinessAffiliationRequets.findByDescription", query = "SELECT s FROM StatusBusinessAffiliationRequets s WHERE s.description = :description")})
public class StatusBusinessAffiliationRequest implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "code")
    private String code;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "statusBusinessAffiliationRequetsId")
    private Collection<StatusBusinessAffiliationHasFinalState> statusBusinessAffiliationHasFinalStateCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "finalStateId")
    private Collection<StatusBusinessAffiliationHasFinalState> statusBusinessAffiliationHasFinalStateCollection1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "statusBusinessAffiliationRequetsId")
    private Collection<BusinessAffiliationRequets> businessAffiliationRequetsCollection;

    public StatusBusinessAffiliationRequest() {
    }

    public StatusBusinessAffiliationRequest(Integer id) {
        this.id = id;
    }

    public StatusBusinessAffiliationRequest(Integer id, String description) {
        this.id = id;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<BusinessAffiliationRequets> getBusinessAffiliationRequetsCollection() {
        return businessAffiliationRequetsCollection;
    }

    public void setBusinessAffiliationRequetsCollection(Collection<BusinessAffiliationRequets> businessAffiliationRequetsCollection) {
        this.businessAffiliationRequetsCollection = businessAffiliationRequetsCollection;
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
        if (!(object instanceof StatusBusinessAffiliationRequest)) {
            return false;
        }
        StatusBusinessAffiliationRequest other = (StatusBusinessAffiliationRequest) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.StatusBusinessAffiliationRequets[ id=" + id + " ]";
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<StatusBusinessAffiliationHasFinalState> getStatusBusinessAffiliationHasFinalStateCollection() {
        return statusBusinessAffiliationHasFinalStateCollection;
    }

    public void setStatusBusinessAffiliationHasFinalStateCollection(Collection<StatusBusinessAffiliationHasFinalState> statusBusinessAffiliationHasFinalStateCollection) {
        this.statusBusinessAffiliationHasFinalStateCollection = statusBusinessAffiliationHasFinalStateCollection;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<StatusBusinessAffiliationHasFinalState> getStatusBusinessAffiliationHasFinalStateCollection1() {
        return statusBusinessAffiliationHasFinalStateCollection1;
    }

    public void setStatusBusinessAffiliationHasFinalStateCollection1(Collection<StatusBusinessAffiliationHasFinalState> statusBusinessAffiliationHasFinalStateCollection1) {
        this.statusBusinessAffiliationHasFinalStateCollection1 = statusBusinessAffiliationHasFinalStateCollection1;
    }
    
}
