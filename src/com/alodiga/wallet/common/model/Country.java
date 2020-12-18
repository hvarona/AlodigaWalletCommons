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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author usuario
 */
@Entity
@Table(name = "country")
@XmlType(name = "maw_country")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Country.findAll", query = "SELECT c FROM Country c"),
    @NamedQuery(name = "Country.findById", query = "SELECT c FROM Country c WHERE c.id = :id"),
    @NamedQuery(name = "Country.findByName", query = "SELECT c FROM Country c WHERE c.name = :name"),
    @NamedQuery(name = "Country.findByShortName", query = "SELECT c FROM Country c WHERE c.shortName = :shortName"),
    @NamedQuery(name = "Country.findByCode", query = "SELECT c FROM Country c WHERE c.code = :code"),
    @NamedQuery(name = "Country.findByAlternativeName1", query = "SELECT c FROM Country c WHERE c.alternativeName1 = :alternativeName1"),
    @NamedQuery(name = "Country.findByAlternativeName2", query = "SELECT c FROM Country c WHERE c.alternativeName2 = :alternativeName2"),
    @NamedQuery(name = "Country.findByAlternativeName3", query = "SELECT c FROM Country c WHERE c.alternativeName3 = :alternativeName3"),
    @NamedQuery(name = QueryConstants.CODE_EXIST_IN_BD_COUNTRY, query = "SELECT c FROM Country c WHERE c.code = :code"),
    @NamedQuery(name = QueryConstants.NAME_EXIST_IN_BD_COUNTRY, query = "SELECT c FROM Country c WHERE c.name = :name")})

public class Country extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "shortName")
    private String shortName;
    @Column(name = "code")
    private String code;
    @Column(name = "code_iso3")
    private String code_iso3;
    @Column(name = "alternativeName1")
    private String alternativeName1;
    @Column(name = "alternativeName2")
    private String alternativeName2;
    @Column(name = "alternativeName3")
    private String alternativeName3;

    public Country() {
    }

    public Country(Long id) {
        this.id = id;
    }

    public Country(Long id, String name) {
        this.id = id;
        this.name = name;
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

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode_iso3() {
        return code_iso3;
    }

    public void setCode_iso3(String code_iso3) {
        this.code_iso3 = code_iso3;
    }

    public String getAlternativeName1() {
        return alternativeName1;
    }

    public void setAlternativeName1(String alternativeName1) {
        this.alternativeName1 = alternativeName1;
    }

    public String getAlternativeName2() {
        return alternativeName2;
    }

    public void setAlternativeName2(String alternativeName2) {
        this.alternativeName2 = alternativeName2;
    }

    public String getAlternativeName3() {
        return alternativeName3;
    }

    public void setAlternativeName3(String alternativeName3) {
        this.alternativeName3 = alternativeName3;
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
        if (!(object instanceof Country)) {
            return false;
        }
        Country other = (Country) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.Country[ id=" + id + " ]";
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
