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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author jose
 */
@Entity
@Table(name = "legal_representative")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LegalRepresentative.findAll", query = "SELECT l FROM LegalRepresentative l"),
    @NamedQuery(name = "LegalRepresentative.findById", query = "SELECT l FROM LegalRepresentative l WHERE l.id = :id"),
    @NamedQuery(name = "LegalRepresentative.findByCreateDate", query = "SELECT l FROM LegalRepresentative l WHERE l.createDate = :createDate"),
    @NamedQuery(name = "LegalRepresentative.findByUpdateDate", query = "SELECT l FROM LegalRepresentative l WHERE l.updateDate = :updateDate"),
    @NamedQuery(name = "LegalRepresentative.findByIdentificationNumber", query = "SELECT l FROM LegalRepresentative l WHERE l.identificationNumber = :identificationNumber"),
    @NamedQuery(name = "LegalRepresentative.findByIdentificationNumberOld", query = "SELECT l FROM LegalRepresentative l WHERE l.identificationNumberOld = :identificationNumberOld"),
    @NamedQuery(name = "LegalRepresentative.findByDueDateDocumentIdentification", query = "SELECT l FROM LegalRepresentative l WHERE l.dueDateDocumentIdentification = :dueDateDocumentIdentification"),
    @NamedQuery(name = "LegalRepresentative.findByFirstNames", query = "SELECT l FROM LegalRepresentative l WHERE l.firstNames = :firstNames"),
    @NamedQuery(name = "LegalRepresentative.findByLastNames", query = "SELECT l FROM LegalRepresentative l WHERE l.lastNames = :lastNames"),
    @NamedQuery(name = "LegalRepresentative.findByAge", query = "SELECT l FROM LegalRepresentative l WHERE l.age = :age"),
    @NamedQuery(name = "LegalRepresentative.findByGender", query = "SELECT l FROM LegalRepresentative l WHERE l.gender = :gender"),
    @NamedQuery(name = "LegalRepresentative.findByPlaceBirth", query = "SELECT l FROM LegalRepresentative l WHERE l.placeBirth = :placeBirth"),
    @NamedQuery(name = "LegalRepresentative.findByDateBirth", query = "SELECT l FROM LegalRepresentative l WHERE l.dateBirth = :dateBirth")})
public class LegalRepresentative extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "identificationNumber")
    private String identificationNumber;
    @Size(max = 40)
    @Column(name = "identificationNumberOld")
    private String identificationNumberOld;
    @Column(name = "dueDateDocumentIdentification")
    @Temporal(TemporalType.DATE)
    private Date dueDateDocumentIdentification;
    @Basic(optional = false)
    @Size(min = 1, max = 50)
    @Column(name = "firstNames")
    private String firstNames;
    @Basic(optional = false)
    @Size(min = 1, max = 50)
    @Column(name = "lastNames")
    private String lastNames;
    @Basic(optional = false)
    @Column(name = "age")
    private int age;
    @Size(max = 1)
    @Column(name = "gender")
    private String gender;
    @Size(max = 50)
    @Column(name = "placeBirth")
    private String placeBirth;
    @Basic(optional = false)
    @Column(name = "dateBirth")
    @Temporal(TemporalType.DATE)
    private Date dateBirth;
    @OneToMany(mappedBy = "legalRepresentativeId")
    private Collection<LegalPerson> legalPersonCollection;
    @JoinColumn(name = "documentsPersonTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DocumentsPersonType documentsPersonTypeId;
    @JoinColumn(name = "personId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Person personId;
    @JoinColumn(name = "civilStatusId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CivilStatus civilStatusId;
    @JoinColumn(name = "statusApplicantId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusApplicant statusApplicantId;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;

    public LegalRepresentative() {
    }

    public LegalRepresentative(Long id) {
        this.id = id;
    }

    public LegalRepresentative(Long id, String identificationNumber, String firstNames, String lastNames, int age, Date dateBirth) {
        this.id = id;
        this.identificationNumber = identificationNumber;
        this.firstNames = firstNames;
        this.lastNames = lastNames;
        this.age = age;
        this.dateBirth = dateBirth;
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

    public String getIdentificationNumberOld() {
        return identificationNumberOld;
    }

    public void setIdentificationNumberOld(String identificationNumberOld) {
        this.identificationNumberOld = identificationNumberOld;
    }

    public Date getDueDateDocumentIdentification() {
        return dueDateDocumentIdentification;
    }

    public void setDueDateDocumentIdentification(Date dueDateDocumentIdentification) {
        this.dueDateDocumentIdentification = dueDateDocumentIdentification;
    }

    public String getFirstNames() {
        return firstNames;
    }

    public void setFirstNames(String firstNames) {
        this.firstNames = firstNames;
    }

    public String getLastNames() {
        return lastNames;
    }

    public void setLastNames(String lastNames) {
        this.lastNames = lastNames;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPlaceBirth() {
        return placeBirth;
    }

    public void setPlaceBirth(String placeBirth) {
        this.placeBirth = placeBirth;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public StatusApplicant getStatusApplicantId() {
        return statusApplicantId;
    }

    public void setStatusApplicantId(StatusApplicant statusApplicantId) {
        this.statusApplicantId = statusApplicantId;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<LegalPerson> getLegalPersonCollection() {
        return legalPersonCollection;
    }

    public void setLegalPersonCollection(Collection<LegalPerson> legalPersonCollection) {
        this.legalPersonCollection = legalPersonCollection;
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

    public CivilStatus getCivilStatusId() {
        return civilStatusId;
    }

    public void setCivilStatusId(CivilStatus civilStatusId) {
        this.civilStatusId = civilStatusId;
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
        if (!(object instanceof LegalRepresentative)) {
            return false;
        }
        LegalRepresentative other = (LegalRepresentative) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.LegalRepresentative[ id=" + id + " ]";
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