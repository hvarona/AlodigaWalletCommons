/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alodiga.wallet.common.model;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "status_applicant")
@XmlType(name = "maw_status_applicant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StatusApplicant.findAll", query = "SELECT s FROM StatusApplicant s"),
    @NamedQuery(name = "StatusApplicant.findById", query = "SELECT s FROM StatusApplicant s WHERE s.id = :id"),
    @NamedQuery(name = "StatusApplicant.findByDescription", query = "SELECT s FROM StatusApplicant s WHERE s.description = :description"),
    @NamedQuery(name = "StatusApplicant.findByCode", query = "SELECT s FROM StatusApplicant s WHERE s.code = :code")})
public class StatusApplicant extends AbstractWalletEntity implements Serializable {

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
    @Basic(optional = false)
    @Size(min = 1, max = 10)
    @Column(name = "code")
    private String code;

    public StatusApplicant() {
    }

    public StatusApplicant(Integer id) {
        this.id = id;
    }

    public StatusApplicant(Integer id, String description, String code) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StatusApplicant)) {
            return false;
        }
        StatusApplicant other = (StatusApplicant) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.StatusApplicant[ id=" + id + " ]";
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
