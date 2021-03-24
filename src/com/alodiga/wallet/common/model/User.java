package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "user")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id=:id"),
    @NamedQuery(name = "User.validateUser", query = "SELECT u FROM User u WHERE u.login=:login AND u.password=:password"),
    @NamedQuery(name = "User.loadUserByLogin", query = "SELECT u FROM User u WHERE u.login=:login"),
    @NamedQuery(name = "User.loadUserByEmail", query = "SELECT u FROM User u WHERE u.email=:email"),
    @NamedQuery(name = QueryConstants.LOGIN_EXIST_IN_BD, query = "SELECT u FROM User u WHERE u.login = :login"),
    @NamedQuery(name = QueryConstants.EMPLOYEE_EXIST_IN_BD, query = "SELECT u FROM User u WHERE u.employeeId.id = :employeeId"),
    @NamedQuery(name = QueryConstants.VALIDATE_PASSWORD, query = "SELECT u FROM User u WHERE u.password=:currentPassword AND u.id=:userId")})
public class User extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "login")
    private String login;
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @Size(min = 1, max = 45)
    @Column(name = "firstName")
    private String firstName;
    @Basic(optional = false)
    @Size(min = 1, max = 45)
    @Column(name = "lastName")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "creationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Correo electrónico no válido")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @Size(min = 1, max = 255)
    @Column(name = "email")
    private String email;
    @Size(max = 45)
    @Column(name = "phoneNumber")
    private String phoneNumber;
    @Basic(optional = false)
    @Column(name = "receiveTopUpNotification")
    private boolean receiveTopUpNotification;
    @Basic(optional = false)
    @Column(name = "enabled")
    private boolean enabled;    
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<UserHasProfile> userHasProfile;
    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "identificationNumber")
    private String identificationNumber;
    @JoinColumn(name = "authorizedEmployeeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Employee authorizedEmployeeId;
    @JoinColumn(name = "documentsPersonTypeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DocumentsPersonType documentsPersonTypeId;
    @JoinColumn(name = "employeeId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Employee employeeId;
    @JoinColumn(name = "personId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Person personId;

    public User() {
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getEnabled() {
        return this.enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public List<UserHasProfile> getUserHasProfile() {
        return this.userHasProfile;
    }

    public void setUserHasProfile(List<UserHasProfile> userHasProfile) {
        this.userHasProfile = userHasProfile;
    }

    public boolean getReceiveTopUpNotification() {
        return receiveTopUpNotification;
    }

    public void setReceiveTopUpNotification(boolean receiveTopUpNotification) {
        this.receiveTopUpNotification = receiveTopUpNotification;
    }

    public Profile getCurrentProfile() {
        Profile profile = null;
        for (UserHasProfile uhp : this.userHasProfile) {
            if (uhp.getEndingDate() == null) {
                profile = uhp.getProfile();
            }
        }
        return profile;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    public String getNaturalField(Object o, Object o2) {
        StringBuilder sb = new StringBuilder();
        Class<?> thisClass = o.getClass();
        Class<?> thisClass2 = o2.getClass();
        try {
            Field[] aClassFields = thisClass.getDeclaredFields();
            Field[] aClassFields2 = thisClass2.getDeclaredFields();
            sb.append("[");
            for (Field f : aClassFields) {
                for (Field f2 : aClassFields2) {
                    if (f.get(o) != f.get(o2)) {
                        sb.append(f.getName()).append("=");
                        //                   sb.append(f.get(o)).append("|");
                        sb.append(f.get(o2)).append(",");
                        break;
                    }
                }
            }
            sb.append("]");
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    @Override
    public Object getPk() {
        return getId();
    }

    @Override
    public String getTableName() throws TableNotFoundException {
        return super.getTableName(this.getClass());
    }

    public User(Long id) {
        this.id = id;
    }

    public User(Long id, String login, String password, String firstName, String lastName, Date creationDate, String email, boolean receiveTopUpNotification, boolean enabled) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.creationDate = creationDate;
        this.email = email;
        this.receiveTopUpNotification = receiveTopUpNotification;
        this.enabled = enabled;
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
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    

    public Employee getAuthorizedEmployeeId() {
        return authorizedEmployeeId;
    }

    public void setAuthorizedEmployeeId(Employee authorizedEmployeeId) {
        this.authorizedEmployeeId = authorizedEmployeeId;
    }

    public DocumentsPersonType getDocumentsPersonTypeId() {
        return documentsPersonTypeId;
    }

    public void setDocumentsPersonTypeId(DocumentsPersonType documentsPersonTypeId) {
        this.documentsPersonTypeId = documentsPersonTypeId;
    }

    public Employee getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Employee employeeId) {
        this.employeeId = employeeId;
    }

    public Person getPersonId() {
        return personId;
    }

    public void setPersonId(Person personId) {
        this.personId = personId;
    }

}
