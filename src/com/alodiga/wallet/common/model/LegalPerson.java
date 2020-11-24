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
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "legal_person")
@XmlType(name = "maw_legal_person")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LegalPerson.findAll", query = "SELECT l FROM LegalPerson l"),
    @NamedQuery(name = "LegalPerson.findById", query = "SELECT l FROM LegalPerson l WHERE l.id = :id"),
    @NamedQuery(name = "LegalPerson.findByCreateDate", query = "SELECT l FROM LegalPerson l WHERE l.createDate = :createDate"),
    @NamedQuery(name = "LegalPerson.findByUpdateDate", query = "SELECT l FROM LegalPerson l WHERE l.updateDate = :updateDate"),
    @NamedQuery(name = "LegalPerson.findByIdentificationNumber", query = "SELECT l FROM LegalPerson l WHERE l.identificationNumber = :identificationNumber"),
    @NamedQuery(name = "LegalPerson.findByTradeName", query = "SELECT l FROM LegalPerson l WHERE l.tradeName = :tradeName"),
    @NamedQuery(name = "LegalPerson.findByBusinessName", query = "SELECT l FROM LegalPerson l WHERE l.businessName = :businessName"),
    @NamedQuery(name = "LegalPerson.findByRegisterNumber", query = "SELECT l FROM LegalPerson l WHERE l.registerNumber = :registerNumber"),
    @NamedQuery(name = "LegalPerson.findByDateInscriptionRegister", query = "SELECT l FROM LegalPerson l WHERE l.dateInscriptionRegister = :dateInscriptionRegister"),
    @NamedQuery(name = "LegalPerson.findByPayedCapital", query = "SELECT l FROM LegalPerson l WHERE l.payedCapital = :payedCapital"),
    @NamedQuery(name = QueryConstants.LEGAL_PERSON_BY_LEGAL_REPRESENTATIVE, query = "SELECT l FROM LegalPerson l WHERE l.legalRepresentativeId.id = :legalRepresentativeId"),
    @NamedQuery(name = QueryConstants.LEGAL_PERSON_BY_PERSON, query = "SELECT l FROM LegalPerson l WHERE l.personId.id = :personId")})
public class LegalPerson extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "identificationNumber")
    private String identificationNumber;
    @Size(max = 60)
    @Column(name = "tradeName")
    private String tradeName;
    @Basic(optional = false)
    @Size(min = 1, max = 80)
    @Column(name = "businessName")
    private String businessName;
    @Size(max = 45)
    @Column(name = "registerNumber")
    private String registerNumber;
    @Column(name = "dateInscriptionRegister")
    @Temporal(TemporalType.DATE)
    private Date dateInscriptionRegister;
    @JoinColumn(name = "businessCategoryId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private BusinessCategory businessCategoryId;
    @JoinColumn(name = "documentsPersonTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DocumentsPersonType documentsPersonTypeId;
    @JoinColumn(name = "personId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Person personId;
    @JoinColumn(name = "legalRepresentativeId", referencedColumnName = "id")
    @ManyToOne
    private LegalRepresentative legalRepresentativeId;
    @Basic(optional = false)
    @Column(name = "payedCapital")
    private float payedCapital;
    @JoinColumn(name = "statusApplicantId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusApplicant statusApplicantId;

    public LegalPerson() {
    }

    public LegalPerson(Long id) {
        this.id = id;
    }

    public LegalPerson(Long id, String identificationNumber, String businessName) {
        this.id = id;
        this.identificationNumber = identificationNumber;
        this.businessName = businessName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public String getTradeName() {
        return tradeName;
    }

    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getRegisterNumber() {
        return registerNumber;
    }

    public void setRegisterNumber(String registerNumber) {
        this.registerNumber = registerNumber;
    }

    public Date getDateInscriptionRegister() {
        return dateInscriptionRegister;
    }

    public void setDateInscriptionRegister(Date dateInscriptionRegister) {
        this.dateInscriptionRegister = dateInscriptionRegister;
    }

    public BusinessCategory getBusinessCategoryId() {
        return businessCategoryId;
    }

    public void setBusinessCategoryId(BusinessCategory businessCategoryId) {
        this.businessCategoryId = businessCategoryId;
    }

    public DocumentsPersonType getDocumentsPersonTypeId() {
        return documentsPersonTypeId;
    }

    public void setDocumentsPersonTypeId(DocumentsPersonType documentsPersonTypeId) {
        this.documentsPersonTypeId = documentsPersonTypeId;
    }

    public Person getPersonId() {
        return personId;
    }

    public void setPersonId(Person personId) {
        this.personId = personId;
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
        if (!(object instanceof LegalPerson)) {
            return false;
        }
        LegalPerson other = (LegalPerson) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.LegalPerson[ id=" + id + " ]";
    }

    public LegalRepresentative getLegalRepresentativeId() {
        return legalRepresentativeId;
    }

    public void setLegalRepresentativeId(LegalRepresentative legalRepresentativeId) {
        this.legalRepresentativeId = legalRepresentativeId;
    }

    public float getPayedCapital() {
        return payedCapital;
    }

    public void setPayedCapital(float payedCapital) {
        this.payedCapital = payedCapital;
    }

    public StatusApplicant getStatusApplicantId() {
        return statusApplicantId;
    }

    public void setStatusApplicantId(StatusApplicant statusApplicantId) {
        this.statusApplicantId = statusApplicantId;
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
