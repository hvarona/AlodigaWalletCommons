package com.alodiga.wallet.common.ejb;

import java.util.List;

import javax.ejb.Local;

import com.alodiga.wallet.common.exception.DisabledUserException;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.GeneralException;
import com.alodiga.wallet.common.exception.InvalidPasswordException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.exception.RegisterNotFoundException;
import com.alodiga.wallet.common.genericEJB.EJBRequest;
import com.alodiga.wallet.common.genericEJB.WalletGenericEJBLocal;
import com.alodiga.wallet.common.model.Permission;
import com.alodiga.wallet.common.model.PermissionGroup;
import com.alodiga.wallet.common.model.Profile;
import com.alodiga.wallet.common.model.ProfileData;
import com.alodiga.wallet.common.model.User;

@Local
public interface AccessControlEJBLocal extends WalletGenericEJBLocal {

    public void deletePermissionHasProfile(Long profileId) throws NullParameterException, GeneralException;

    public List<Permission> getPermissions(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Permission> getPermissionOrderByAsc(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public List<Profile> getProfiles(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

    public Permission loadPermission(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public Profile loadProfile(EJBRequest request) throws RegisterNotFoundException, NullParameterException, GeneralException;

    public void logginFailed(EJBRequest request) throws NullParameterException, GeneralException, RegisterNotFoundException;

    public void logginSuccessful(EJBRequest request) throws NullParameterException, GeneralException, RegisterNotFoundException;

    public Permission savePermission(EJBRequest request) throws NullParameterException, GeneralException;

    public Profile saveProfile(EJBRequest request) throws NullParameterException, GeneralException;

    public ProfileData saveProfileData(EJBRequest request) throws NullParameterException, GeneralException;

    public boolean validateLoginPreferences(EJBRequest request) throws NullParameterException, GeneralException, RegisterNotFoundException;

    public User validateUser(String login, String password) throws InvalidPasswordException, RegisterNotFoundException, NullParameterException, GeneralException,DisabledUserException;

    public List<PermissionGroup> getPermissionGroups() throws EmptyListException, NullParameterException, GeneralException;

    public List<Permission> getPermissions() throws EmptyListException, NullParameterException, GeneralException;

    public List<Permission> getPermissionByGroupId(Long groupId) throws EmptyListException, NullParameterException, GeneralException;

    public List<Permission> getPermissionByProfileId(Long profileId) throws EmptyListException, NullParameterException, GeneralException;

    public Permission loadPermissionById(Long permissionId) throws GeneralException, NullParameterException, RegisterNotFoundException;
    
    public List<Profile> getProfiles() throws EmptyListException, GeneralException;
    
    public List<User> getUsersWithParams(EJBRequest request) throws EmptyListException, GeneralException, NullParameterException;

}
