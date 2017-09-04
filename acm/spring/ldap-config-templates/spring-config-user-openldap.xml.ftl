<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/security"
        xmlns:beans="http://www.springframework.org/schema/beans"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:task="http://www.springframework.org/schema/task"
        xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.1.xsd
                            http://www.springframework.org/schema/security http://www.springframework.org/schema/security/spring-security-3.2.xsd
                            http://www.springframework.org/schema/task http://www.springframework.org/schema/task/spring-task-3.2.xsd">

    <beans:bean class="com.armedia.acm.crypto.properties.AcmEncryptablePropertySourcesPlaceholderConfigurer">
        <beans:property name="encryptablePropertyUtils" ref="acmEncryptablePropertyUtils"/>
        <beans:property name="location" value="file:${r'${user.home}'}/.arkcase/acm/spring/spring-config-user-${id}-openldap.properties"/>
    </beans:bean>
   
    <beans:bean id="${id}_userSync" class="com.armedia.acm.services.users.service.ldap.AcmLdapUserSyncConfig">
        <beans:property name="attributes">
            <beans:map>
                <beans:entry key="cn" value='${r"${openLdapAddUserConfig.cn}"}'/>
                <beans:entry key="givenName" value='${r"${openLdapAddUserConfig.givenName}"}'/>
                <beans:entry key="sn" value='${r"${openLdapAddUserConfig.sn}"}'/>
                <beans:entry key="uid" value='${r"${openLdapAddUserConfig.uid}"}'/>
                <beans:entry key="mail" value='${r"${openLdapAddUserConfig.mail}"}'/>
                <beans:entry key="userAccountControl" value='${r"${openLdapAddUserConfig.userAccountControl}"}'/>
                <beans:entry key="userPassword" value='${r"${openLdapAddUserConfig.userPassword}"}'/>
                <beans:entry key="uidNumber" value='${r"${openLdapAddUserConfig.uidNumber}"}'/>
                <beans:entry key="gidNumber" value='${r"${openLdapAddUserConfig.gidNumber}"}'/>
                <beans:entry key="homeDirectory" value='${r"${openLdapAddUserConfig.homeDirectory}"}'/>
                <beans:entry key="objectClass" value='${r"${openLdapAddUserConfig.objectClass}"}'/>
                <beans:entry key="shadowWarning" value='${r"${openLdapAddUserConfig.shadowWarning}"}'/>
                <beans:entry key="shadowLastChange" value='${r"${openLdapAddUserConfig.shadowLastChange}"}'/>
                <beans:entry key="shadowMax" value='${r"${openLdapAddUserConfig.shadowMax}"}'/>
            </beans:map>
        </beans:property>
    </beans:bean>
</beans:beans>
