package com.alodiga.wallet.common.manager;

import com.alodiga.wallet.common.ejb.AccessControlEJB;
import com.alodiga.wallet.common.ejb.UserEJB;
import com.alodiga.wallet.common.exception.EmptyListException;
import com.alodiga.wallet.common.exception.NullParameterException;
import com.alodiga.wallet.common.model.Permission;
import com.alodiga.wallet.common.model.PermissionGroup;
import com.alodiga.wallet.common.model.Profile;
import com.alodiga.wallet.common.utils.EJBServiceLocator;
import com.alodiga.wallet.common.utils.EjbConstants;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
public class PermissionManager {

    private static PermissionManager instance;
    private List<PermissionGroup> permissionGroups;
    private List<Permission> permissions;
    private AccessControlEJB accessControlEJB;
    private Map<Long, List<Permission>> permissionByGroup;
    private Map<Long, List<Permission>> permissionByProfile;

    public static synchronized PermissionManager getInstance() throws Exception {
        if (instance == null) {
            instance = new PermissionManager();
        }
        return instance;
    }

    public static void refresh() throws Exception {
        instance = new PermissionManager();
    }

    private PermissionManager() throws Exception {
    	accessControlEJB = (AccessControlEJB) EJBServiceLocator.getInstance().get(EjbConstants.ACCESS_CONTROL_EJB);
        permissionGroups = accessControlEJB.getPermissionGroups();
        permissionByGroup = new HashMap<Long, List<Permission>>();
        permissionByProfile = new HashMap<Long, List<Permission>>();
        List<Permission> ps = null;
        for (PermissionGroup permissionGroup : permissionGroups) {
            try {
                ps = accessControlEJB.getPermissionByGroupId(permissionGroup.getId());
                permissionByGroup.put(permissionGroup.getId(), ps);
            } catch (EmptyListException e) {
                e.printStackTrace();
            }
        }
        permissions = accessControlEJB.getPermissions();
        List<Profile> profiles = null;
        try {
            profiles = accessControlEJB.getProfiles();
            for (Profile profile : profiles) {
                try {
                    ps = accessControlEJB.getPermissionByProfileId(profile.getId());
                    permissionByProfile.put(profile.getId(), ps);
                } catch (EmptyListException e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public List<Permission> getPermissionByGroupId(Long groupId) throws NullParameterException {
        if (groupId == null) {
            throw new NullParameterException("Parameter groupId cannot be null");
        }
        return permissionByGroup.get(groupId);
    }

    public List<PermissionGroup> getPermissionGroups() throws NullParameterException {
        return permissionGroups;
    }

    public List<Permission> getPermissions() throws NullParameterException {
        return permissions;
    }

    public Permission getPermissionById(Long permissionId) throws NullParameterException {
        if (permissionId == null) {
            throw new NullParameterException("Parameter permissionId cannot be null");
        }
        for (Permission permission : permissions) {
            if (permission.getId().equals(permissionId)) {
                return permission;
            }
        }
        return null;
    }

    public PermissionGroup getPermissionGroupById(Long permissionGroupId) throws NullParameterException {
        if (permissionGroupId == null) {
            throw new NullParameterException("Parameter permissionGroupId cannot be null");
        }
        for (PermissionGroup permissionGroup : permissionGroups) {
            if (permissionGroup.getId().equals(permissionGroupId)) {
                return permissionGroup;
            }
        }
        return null;
    }

    public List<Permission> getPermissionByProfileId(Long profileId) throws NullParameterException {
        if (profileId == null) {
            throw new NullParameterException("Parameter profileId cannot be null");
        }
        return permissionByProfile.get(profileId);
    }

    public boolean hasPermisssion(Long profileId, Long permissionId) throws NullParameterException {
        if (profileId == null) {
            throw new NullParameterException("Parameter profileId cannot be null");
        }else  if (permissionId == null) {
            throw new NullParameterException("Parameter permissionId cannot be null");
        }
         for(Permission permission : permissionByProfile.get(profileId)){
            if(permission.getId().equals(permissionId)){
            return true;
            }
         }
         return false;
    }

}
