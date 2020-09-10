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
@Table(name = "daily_closing_type")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DailyClosingType.findAll", query = "SELECT d FROM DailyClosingType d")
    , @NamedQuery(name = "DailyClosingType.findById", query = "SELECT d FROM DailyClosingType d WHERE d.id = :id")
    , @NamedQuery(name = "DailyClosingType.findByDescription", query = "SELECT d FROM DailyClosingType d WHERE d.description = :description")
    , @NamedQuery(name = "DailyClosingType.findByCode", query = "SELECT d FROM DailyClosingType d WHERE d.code = :code")})
public class DailyClosingType extends AbstractWalletEntity implements Serializable {

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
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "code")
    private String code;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dailyClosingTypeId")
    private Collection<DailyClosing> dailyClosingCollection;

    public DailyClosingType() {
    }

    public DailyClosingType(Integer id) {
        this.id = id;
    }

    public DailyClosingType(Integer id, String description, String code) {
        this.id = id;
        this.description = description;
        this.code = code;
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

    @XmlTransient
    @JsonIgnore
    public Collection<DailyClosing> getDailyClosingCollection() {
        return dailyClosingCollection;
    }

    public void setDailyClosingCollection(Collection<DailyClosing> dailyClosingCollection) {
        this.dailyClosingCollection = dailyClosingCollection;
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
        if (!(object instanceof DailyClosingType)) {
            return false;
        }
        DailyClosingType other = (DailyClosingType) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.DailyClosingType[ id=" + id + " ]";
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
