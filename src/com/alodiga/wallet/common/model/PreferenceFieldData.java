package com.alodiga.wallet.common.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.alodiga.wallet.common.exception.TableNotFoundException;
import com.alodiga.wallet.common.genericEJB.AbstractWalletEntity;
import com.alodiga.wallet.common.utils.QueryConstants;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "preference_field_data")
@XmlRootElement
@NamedQueries({
     @NamedQuery(name = QueryConstants.PREFERENCE_FIELD_DATA_BY_PREFERENCE, query = "SELECT p FROM PreferenceFieldData p WHERE p.preferenceField.id = :preferenceFieldId")})   

public class PreferenceFieldData extends AbstractWalletEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String description;
    @ManyToOne
    @JoinColumn(name = "languageId")
    private Language language;
    @ManyToOne
    @JoinColumn(name = "preferenceFieldId")
    private PreferenceField preferenceField;

    public PreferenceFieldData() {
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Language getLanguage() {
        return this.language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public PreferenceField getPreferenceField() {
		return preferenceField;
	}

	public void setPreferenceField(PreferenceField preferenceField) {
		this.preferenceField = preferenceField;
	}

	@Override
    public String toString() {
        return super.toString();
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
