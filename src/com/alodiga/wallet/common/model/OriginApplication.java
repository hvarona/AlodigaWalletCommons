
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
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
import javax.xml.bind.annotation.XmlType;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author 
 */
@Entity
@Table(name = "origin_application")
@XmlType(name = "maw_origin_application")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OriginApplication.findAll", query = "SELECT o FROM OriginApplication o"),
    @NamedQuery(name = "OriginApplication.findById", query = "SELECT o FROM OriginApplication o WHERE o.id = :id"),
    @NamedQuery(name = "OriginApplication.findByName", query = "SELECT o FROM OriginApplication o WHERE o.name = :name"),
    @NamedQuery(name = "OriginApplication.findByCode", query = "SELECT o FROM OriginApplication o WHERE o.code = :code")})
public class OriginApplication extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Size(min = 1, max = 6)
    @Column(name = "code")
    private String code;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "originApplicationId")
    private Collection<PersonType> personTypeCollection;

    public OriginApplication() {
    }

    public OriginApplication(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<PersonType> getPersonTypeCollection() {
        return personTypeCollection;
    }

    public void setPersonTypeCollection(Collection<PersonType> personTypeCollection) {
        this.personTypeCollection = personTypeCollection;
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
        if (!(object instanceof OriginApplication)) {
            return false;
        }
        OriginApplication other = (OriginApplication) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.OriginApplication[ id=" + id + " ]";
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
