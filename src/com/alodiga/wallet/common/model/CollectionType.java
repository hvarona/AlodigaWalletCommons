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
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "collection_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CollectionType.findAll", query = "SELECT c FROM CollectionType c"),
    @NamedQuery(name = "CollectionType.findById", query = "SELECT c FROM CollectionType c WHERE c.id = :id"),
    @NamedQuery(name = "CollectionType.findBycountryId", query = "SELECT c FROM CollectionType c WHERE c.countryId.id = :countryId"),
    @NamedQuery(name = "CollectionType.findByDescription", query = "SELECT c FROM CollectionType c WHERE c.description = :description"),
    @NamedQuery(name = QueryConstants.COLLECTION_TYPE_BY_COUNTRY_BY_PERSON_TYPE, query = "SELECT c FROM CollectionType c WHERE c.countryId.id=:countryId AND c.personTypeId.id =:personTypeId"),
    @NamedQuery(name = QueryConstants.COLLECTION_TYPE_BY_COUNTRY, query = "SELECT c FROM CollectionType c WHERE c.countryId.id=:countryId")})
public class CollectionType extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Size(min = 1, max = 50)
    @Column(name = "description")
    private String description;
    @JoinColumn(name = "countryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Country countryId;
    @JoinColumn(name = "personTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PersonType personTypeId;
    @Column(name = "orden")
    private String orden;
    
    public CollectionType() {
    }

    public CollectionType(Integer id) {
        this.id = id;
    }

    public CollectionType(Integer id, String description) {
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

    public Country getCountryId() {
        return countryId;
    }

    public void setCountryId(Country countryId) {
        this.countryId = countryId;
    }
    
    public PersonType getPersonTypeId() {
        return personTypeId;
    }

    public void setPersonTypeId(PersonType personTypeId) {
        this.personTypeId = personTypeId;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
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
        if (!(object instanceof CollectionType)) {
            return false;
        }
        CollectionType other = (CollectionType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.CollectionType[ id=" + id + " ]";
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
