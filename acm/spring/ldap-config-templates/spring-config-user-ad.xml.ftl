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
        <beans:property name="location" value="file:${r'${user.home}'}/.arkcase/acm/spring/spring-config-user-${id}-ad.properties"/>
    </beans:bean>
   
    <beans:bean id="${id}_userSync" class="com.armedia.acm.services.users.service.ldap.AcmLdapUserSyncConfig">
        <beans:property name="attributes">
            <beans:map>
                <beans:entry key="cn" value='${r"${adAddUserConfig.cn}"}'/>
                <beans:entry key="sAMAccountName" value='${r"${adAddUserConfig.sAMAccountName}"}'/>
                <beans:entry key="givenName" value='${r"${adAddUserConfig.givenName}"}'/>
                <beans:entry key="sn" value='${r"${adAddUserConfig.sn}"}'/>
                <beans:entry key="mail" value='${r"${adAddUserConfig.mail}"}'/>
                <beans:entry key="userAccountControl" value='${r"${adAddUserConfig.userAccountControl}"}'/>
                <beans:entry key="unicodePwd" value='${r"${adAddUserConfig.unicodePwd}"}'/>
                <beans:entry key="homeDirectory" value='${r"${adAddUserConfig.homeDirectory}"}'/>
                <beans:entry key="objectClass" value='${r"${adAddUserConfig.objectClass}"}'/>
            </beans:map>
        </beans:property>
    </beans:bean>
</beans:beans>
