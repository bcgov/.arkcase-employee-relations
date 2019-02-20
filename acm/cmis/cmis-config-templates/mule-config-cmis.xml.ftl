<?xml version="1.0" encoding="UTF-8"?>
<mule xmlns="http://www.mulesoft.org/schema/mule/core"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:cmis="http://www.mulesoft.org/schema/mule/cmis"
      xmlns:spring="http://www.springframework.org/schema/beans"
      xsi:schemaLocation="
               http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd
               http://www.mulesoft.org/schema/mule/cmis http://www.mulesoft.org/schema/mule/cmis/current/mule-cmis.xsd
               http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.1.xsd">

    <spring:beans>
        <spring:bean class="com.armedia.acm.crypto.properties.AcmEncryptablePropertySourcesPlaceholderConfigurer">
            <spring:property name="encryptablePropertyUtils" ref="acmEncryptablePropertyUtils"/>
            <spring:property name="location" value="file:$\{user.home}/.arkcase/acm/cmis/mule-config-${id}-cmis.properties"/>
            <spring:property name="placeholderPrefix" value="$\{id}."/>
        </spring:bean>

        <!-- register this configuration -->
        <spring:bean class="org.springframework.beans.factory.config.MethodInvokingBean">
            <spring:property name="targetObject" ref="cmisConfigRegistry"/>
            <spring:property name="targetMethod" value="registerCmisConfig"/>
            <spring:property name="arguments">
                <spring:list>
                    <beans:value>$\{${id}.cmis.id}</beans:value>
                    <beans:value>$\{${id}.cmis.cmisVersioningState}</beans:value>
                    <!-- put here additional parameters not used in <cmis:config/> section below -->
                </spring:list>
            </spring:property>
        </spring:bean>
    </spring:beans>

    <cmis:config
            name="${id}"
            baseUrl="$\{"${id}".cmis.baseUrl}"
            username="$\{"${id}".cmis.username}"
            password="$\{"${id}".cmis.password}"
            useAlfrescoExtension="$\{"${id}".cmis.useAlfrescoExtension}"
            endpoint="$\{"${id}".cmis.endpoint}"
            repositoryId="$\{ "$\{"id".cmis.repositoryId}" == "" ? null : "$\{"id".cmis.repositoryId}" }">
        <!-- for Alfresco we don"t need a repository ID, so if the property is empty, use null instead... that is what
        the above expression does. Documentum does need a repository ID. -->

        <!-- somehow we can"t use a property for exhausted action. -->
        <cmis:connection-pooling-profile
                maxActive="$\{"${id}".cmis.maxActive}"
                maxIdle="$\{"${id}".cmis.maxIdle}"
                exhaustedAction="WHEN_EXHAUSTED_GROW"
                maxWait="$\{"${id}".cmis.maxWait}"
                minEvictionMillis="$\{"${id}".cmis.minEvictionMillis}"
                evictionCheckIntervalMillis="$\{"${id}".cmis.evictionCheckIntervalMillis}"/>
        <reconnect count="$\{"${id}".cmis.reconnectCount}" frequency="$\{"${id}".cmis.reconnectFrequency}"/>

    </cmis:config>
</mule>
