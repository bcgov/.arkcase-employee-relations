# id refers to directory name which must be unique across all LDAP sync beans
ldapConfig.id=${id}
ldapConfig.base=${base}
ldapConfig.authUserDn=${authUserDn}
ldapConfig.authUserPassword=${authUserPassword}

ldapConfig.userSearchBase=${userSearchBase}
ldapConfig.groupSearchBase=${groupSearchBase}

ldapConfig.ldapUrl=${ldapUrl}

ldapConfig.userAttributes=cn,userAccountControl,sn,givenName,dn,distinguishedname,memberOf,sAMAccountName,userPrincipalName,uid,uidNumber,c,co,company,department,title,shadowMax,shadowLastChange,msDS-UserPasswordExpiryTimeComputed,modifyTimestamp,description,member

ldapConfig.userDomain=${userDomain}

ldapConfig.syncPageSize=${syncPageSize}

ldapConfig.enableEditingLdapUsers=${enableEditingLdapUsers?c}
ldapConfig.directoryType=${directoryType}

ldapConfig.userSearchFilter=${userSearchFilter}
ldapConfig.allUsersFilter=${allUsersFilter}
ldapConfig.allChangedUsersFilter=${allChangedUsersFilter}
ldapConfig.allUsersPageFilter=${allUsersPageFilter}
ldapConfig.allChangedUsersPageFilter=${allChangedUsersPageFilter}
ldapConfig.allUsersSortingAttribute=${allUsersSortingAttribute}
ldapConfig.groupSearchFilterForUser=${groupSearchFilterForUser}
ldapConfig.userIdAttributeName=${userIdAttributeName}
ldapConfig.groupSearchFilter=${groupSearchFilter}
ldapConfig.changedGroupSearchFilter=${changedGroupSearchFilter}
ldapConfig.groupSearchPageFilter=${groupSearchPageFilter}
ldapConfig.changedGroupSearchPageFilter=${changedGroupSearchPageFilter}
ldapConfig.groupsSortingAttribute=${groupsSortingAttribute}
ldapConfig.syncEnabled=${syncEnabled?c}
