package com.alodiga.wallet.common.model;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.model.Profile;
import com.alodiga.wallet.common.model.User;



/**
 * The persistent class for the user_has_profile_has_enterprise database table.
 * 
 */
@Entity
@Table(name="user_has_profile")

public class UserHasProfile extends AbstractWalletEntity implements Serializable {
	
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Timestamp beginningDate;
    private Timestamp endingDate;
    @ManyToOne
    @JoinColumn(name="userId")
    private User user;
    @ManyToOne
    @JoinColumn(name="profileId")
    private Profile profile;


    public UserHasProfile() {
    }

    public Long getId() {
            return this.id;
    }

    public void setId(Long id) {
            this.id = id;
    }

    public Timestamp getBeginningDate() {
            return this.beginningDate;
    }

    public void setBeginningDate(Timestamp beginningDate) {
            this.beginningDate = beginningDate;
    }

    public Timestamp getEndingDate() {
            return this.endingDate;
    }

    public void setEndingDate(Timestamp endingDate) {
            this.endingDate = endingDate;
    }

    public Profile getProfile() {
            return this.profile;
    }

    public void setProfile(Profile profile) {
            this.profile = profile;
    }

    public User getUser() {
            return user;
    }

    public void setUser(User user) {
            this.user = user;
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