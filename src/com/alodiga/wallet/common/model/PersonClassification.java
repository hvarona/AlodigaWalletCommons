/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

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
@Table(name = "person_classification")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PersonClassification.findAll", query = "SELECT p FROM PersonClassification p")
    , @NamedQuery(name = "PersonClassification.findById", query = "SELECT p FROM PersonClassification p WHERE p.id = :id")
    , @NamedQuery(name = "PersonClassification.findByCodeNa", query = "SELECT p FROM PersonClassification p WHERE p.code = 'NaBuAp'")
    , @NamedQuery(name = "PersonClassification.findByCodeLe", query = "SELECT p FROM PersonClassification p WHERE p.code = 'LeBuAp'")
    , @NamedQuery(name = QueryConstants.PERSON_CLASSIFICATION_BY_CODE, query = "SELECT p FROM PersonClassification p WHERE p.code = :code")    
    , @NamedQuery(name = "PersonClassification.findByDescription", query = "SELECT p FROM PersonClassification p WHERE p.description = :description")})
public class PersonClassification implements Serializable {

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
    @Column(name = "code")
    private String code;

    public PersonClassification() {
    }

    public PersonClassification(Integer id) {
        this.id = id;
    }

    public PersonClassification(Integer id, String description) {
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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
        if (!(object instanceof PersonClassification)) {
            return false;
        }
        PersonClassification other = (PersonClassification) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.PersonClassification[ id=" + id + " ]";
    }
    
}
