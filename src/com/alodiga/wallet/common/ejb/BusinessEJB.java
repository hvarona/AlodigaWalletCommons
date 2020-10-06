package com.alodiga.wallet.common.ejb;

import java.util.List;
import javax.ejb.Remote;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJB;
import com.portal.business.commons.exceptions.EmptyListException;
import com.portal.business.commons.exceptions.GeneralException;
import com.portal.business.commons.exceptions.NullParameterException;
import com.portal.business.commons.models.Business;	


@SuppressWarnings(value = {"all"})
@Remote
public interface BusinessEJB extends WalletGenericEJB {

    public Business getBusinessById(long id) throws NullParameterException, GeneralException;
    public Business getBusinessByCode(String code) throws NullParameterException, GeneralException; 
    public Business getBusinessByIdentification(String identification) throws NullParameterException, GeneralException;
    public Business getBusinessByEmail(String email) throws NullParameterException, GeneralException; 
    public Business getBusinessByPhone(String phone) throws NullParameterException, GeneralException; 
    public Business getBusinessByLogin(String login) throws NullParameterException, GeneralException;
    public List<Business> getAll() throws EmptyListException, GeneralException;
    
}

