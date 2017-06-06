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
        <beans:property name="location" value="file:${r'${user.home}'}/.arkcase/acm/spring/spring-config-group-${id}-openldap.properties"/>
    </beans:bean>
   
    <beans:bean id="${id}_groupSync" class="com.armedia.acm.services.users.service.ldap.AcmLdapGroupSyncConfig">
        <beans:property name="attributes">
            <beans:map>
                <beans:entry key="cn" value='${r"${openLdapAddGroupConfig.cn}"}'/>
                <beans:entry key="gidNumber" value='${r"${openLdapAddGroupConfig.gidNumber}"}'/>
                <beans:entry key="objectClass" value='${r"${openLdapAddGroupConfig.objectClass}"}'/>
                <beans:entry key="member" value='${r"${openLdapAddGroupConfig.member}"}'/>
                <beans:entry key="memberOf" value='${r"${openLdapAddGroupConfig.memberOf}"}'/>
            </beans:map>
        </beans:property>
    </beans:bean>
</beans:beans>
