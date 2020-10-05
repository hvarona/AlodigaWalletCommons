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
@Table(name = "documents_person_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DocumentsPersonType.findAll", query = "SELECT d FROM DocumentsPersonType d"),
    @NamedQuery(name = "DocumentsPersonType.findById", query = "SELECT d FROM DocumentsPersonType d WHERE d.id = :id"),
    @NamedQuery(name = "DocumentsPersonType.findByDescription", query = "SELECT d FROM DocumentsPersonType d WHERE d.description = :description"),
    @NamedQuery(name = "DocumentsPersonType.findBypersonTypeId", query = "SELECT d FROM DocumentsPersonType d WHERE d.personTypeId.id = :personTypeId"),
    @NamedQuery(name = QueryConstants.DOCUMENTS_BY_COUNTRY, query = "SELECT d FROM DocumentsPersonType d, PersonType e, Country f WHERE d.personTypeId.id = e.id AND f.id = e.countryId.id AND e.countryId.id=:countryId AND e.originApplicationId.id=:originApplicationId AND e.indNaturalPerson=:indNaturalPerson"),
    @NamedQuery(name = "DocumentsPersonType.findByCodeIdentification", query = "SELECT d FROM DocumentsPersonType d WHERE d.codeIdentification = :codeIdentification")})
public class DocumentsPersonType extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "description")
    private String description;
    @Size(max = 10)
    @Column(name = "codeIdentification")
    private String codeIdentification;
    @JoinColumn(name = "personTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PersonType personTypeId;

    public DocumentsPersonType() {
    }

    public DocumentsPersonType(Integer id) {
        this.id = id;
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

    public String getCodeIdentification() {
        return codeIdentification;
    }

    public void setCodeIdentification(String codeIdentification) {
        this.codeIdentification = codeIdentification;
    }

    public PersonType getPersonTypeId() {
        return personTypeId;
    }

    public void setPersonTypeId(PersonType personTypeId) {
        this.personTypeId = personTypeId;
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
        if (!(object instanceof DocumentsPersonType)) {
            return false;
        }
        DocumentsPersonType other = (DocumentsPersonType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.DocumentsPersonType[ id=" + id + " ]";
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
