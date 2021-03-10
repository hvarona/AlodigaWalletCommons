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

/**
 *
 * @author jose
 */
@Entity
@Table(name = "natural_person")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NaturalPerson.findAll", query = "SELECT n FROM NaturalPerson n"),
    @NamedQuery(name = "NaturalPerson.findById", query = "SELECT n FROM NaturalPerson n WHERE n.id = :id"),
    @NamedQuery(name = "NaturalPerson.findByIdentificationNumber", query = "SELECT n FROM NaturalPerson n WHERE n.identificationNumber = :identificationNumber"),
    @NamedQuery(name = "NaturalPerson.findByDueDateDocumentIdentification", query = "SELECT n FROM NaturalPerson n WHERE n.dueDateDocumentIdentification = :dueDateDocumentIdentification"),
    @NamedQuery(name = "NaturalPerson.findByIdentificactionNumberOld", query = "SELECT n FROM NaturalPerson n WHERE n.identificactionNumberOld = :identificactionNumberOld"),
    @NamedQuery(name = "NaturalPerson.findByFirstName", query = "SELECT n FROM NaturalPerson n WHERE n.firstName = :firstName"),
    @NamedQuery(name = "NaturalPerson.findByLastName", query = "SELECT n FROM NaturalPerson n WHERE n.lastName = :lastName"),
    @NamedQuery(name = "NaturalPerson.findByMarriedLastName", query = "SELECT n FROM NaturalPerson n WHERE n.marriedLastName = :marriedLastName"),
    @NamedQuery(name = "NaturalPerson.findByGender", query = "SELECT n FROM NaturalPerson n WHERE n.gender = :gender"),
    @NamedQuery(name = "NaturalPerson.findByPlaceBirth", query = "SELECT n FROM NaturalPerson n WHERE n.placeBirth = :placeBirth"),
    @NamedQuery(name = "NaturalPerson.findByDateBirth", query = "SELECT n FROM NaturalPerson n WHERE n.dateBirth = :dateBirth"),
    @NamedQuery(name = "NaturalPerson.findByCreateDate", query = "SELECT n FROM NaturalPerson n WHERE n.createDate = :createDate"),
    @NamedQuery(name = "NaturalPerson.findByUpdateDate", query = "SELECT n FROM NaturalPerson n WHERE n.updateDate = :updateDate"),
    @NamedQuery(name = QueryConstants.NATURAL_PERSON_BY_PERSON, query = "SELECT n FROM NaturalPerson n WHERE n.personId.id = :personId")})

public class NaturalPerson extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Size(max = 40)
    @Column(name = "identificationNumber")
    private String identificationNumber;
    @Column(name = "dueDateDocumentIdentification")
    @Temporal(TemporalType.DATE)
    private Date dueDateDocumentIdentification;
    @Size(max = 40)
    @Column(name = "identificactionNumberOld")
    private String identificactionNumberOld;
    @Size(max = 40)
    @Column(name = "firstName")
    private String firstName;
    @Size(max = 40)
    @Column(name = "lastName")
    private String lastName;
    @Size(max = 40)
    @Column(name = "marriedLastName")
    private String marriedLastName;
    @Size(max = 1)
    @Column(name = "gender")
    private String gender;
    @Size(max = 50)
    @Column(name = "placeBirth")
    private String placeBirth;
    @Column(name = "dateBirth")
    @Temporal(TemporalType.DATE)
    private Date dateBirth;
    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;
    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate;
    @JoinColumn(name = "civilStatusId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private CivilStatus civilStatusId;
    @JoinColumn(name = "documentsPersonTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DocumentsPersonType documentsPersonTypeId;
    @JoinColumn(name = "personId", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Person personId;
    @JoinColumn(name = "professionId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Profession professionId;
    @JoinColumn(name = "statusApplicantId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private StatusApplicant statusApplicantId;

    public NaturalPerson() {
    }

    public NaturalPerson(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public Date getDueDateDocumentIdentification() {
        return dueDateDocumentIdentification;
    }

    public void setDueDateDocumentIdentification(Date dueDateDocumentIdentification) {
        this.dueDateDocumentIdentification = dueDateDocumentIdentification;
    }

    public String getIdentificactionNumberOld() {
        return identificactionNumberOld;
    }

    public void setIdentificactionNumberOld(String identificactionNumberOld) {
        this.identificactionNumberOld = identificactionNumberOld;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMarriedLastName() {
        return marriedLastName;
    }

    public void setMarriedLastName(String marriedLastName) {
        this.marriedLastName = marriedLastName;
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

    public CivilStatus getCivilStatusId() {
        return civilStatusId;
    }

    public void setCivilStatusId(CivilStatus civilStatusId) {
        this.civilStatusId = civilStatusId;
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

    public Profession getProfessionId() {
        return professionId;
    }

    public void setProfessionId(Profession professionId) {
        this.professionId = professionId;
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
        if (!(object instanceof NaturalPerson)) {
            return false;
        }
        NaturalPerson other = (NaturalPerson) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alodiga.wallet.common.model.NaturalPerson[ id=" + id + " ]";
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
