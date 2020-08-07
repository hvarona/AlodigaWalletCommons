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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 
 */
@Entity
@Table(name = "sequences")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sequences.findAll", query = "SELECT s FROM Sequences s"),
    @NamedQuery(name = "Sequences.findById", query = "SELECT s FROM Sequences s WHERE s.id = :id"),
    @NamedQuery(name = "Sequences.findByInitialValue", query = "SELECT s FROM Sequences s WHERE s.initialValue = :initialValue"),
    @NamedQuery(name = "Sequences.findByCurrentValue", query = "SELECT s FROM Sequences s WHERE s.currentValue = :currentValue"),
    @NamedQuery(name = "Sequences.findBydocumentType_idByoriginApplicationId", query = "SELECT s FROM Sequences s WHERE s.documentTypeId.id = :documentTypeId AND s.originApplicationId.id = :originApplicationId"),
    @NamedQuery(name = "Sequences.findByDocumentType", query = "SELECT s FROM Sequences s WHERE s.documentTypeId.id = :documentTypeId")})
public class Sequences extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "initialValue")
    private Integer initialValue;
    @Column(name = "currentValue")
    private Integer currentValue;
    @JoinColumn(name = "documentTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DocumentType documentTypeId;
    @JoinColumn(name = "originApplicationId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private OriginApplication originApplicationId;

    public Sequences() {
    }

    public Sequences(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInitialValue() {
        return initialValue;
    }

    public void setInitialValue(Integer initialValue) {
        this.initialValue = initialValue;
    }

    public Integer getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(Integer currentValue) {
        this.currentValue = currentValue;
    }

    public DocumentType getDocumentTypeId() {
        return documentTypeId;
    }

    public void setDocumentTypeId(DocumentType documentTypeId) {
        this.documentTypeId = documentTypeId;
    }

    public OriginApplication getOriginApplicationId() {
        return originApplicationId;
    }

    public void setOriginApplicationId(OriginApplication originApplicationId) {
        this.originApplicationId = originApplicationId;
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
        if (!(object instanceof Sequences)) {
            return false;
        }
        Sequences other = (Sequences) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.Sequences[ id=" + id + " ]";
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
