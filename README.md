# Introduction

This repository contains the configuration files for ArkCase CE (Community Edition).  The ArkCase code repository is here: <https://github.com/ArkCase/ArkCase>.

# How to Deploy ArkCase Standalone (Self-Contained VM; not for Programmers)

Users who are evaluating ArkCase or just want to see how it works should build and start the all-in-one ArkCase Vagrant VM according to the instructions here: <https://github.com/ArkCase/arkcase-ce>.

# How to Deploy ArkCase for Programmers

Programmers who will read the ArkCase code and contribute back to ArkCase should clone the ArkCase code repository (<https://github.com/ArkCase/ArkCase>) and build and deploy ArkCase from their IDE of choice.  This section describes how to do this.
x
A fully functional ArkCase system includes this repository (which is the ArkCase configuration); the Java web application file produced by building the ArkCase source code (<https://github.com/ArkCase/ArkCase>); and the ArkCase Vagrant VM produced by the ArkCase CE repository (<https://github.com/ArkCase/arkcase-ce>).

You must clone this repository to the home folder of the user that runs the ArkCase web application (since the ArkCase web application looks for this configuration in `~/.arkcase` folder (Linux, Mac OS) or in `%HOMEPATH%\.arkcase` (Windows).

You must build and start the Vagrant VM according to the instructions at <https://github.com/ArkCase/arkcase-ce>. 

After you have cloned this repository and built and started the Vagrant VM, you must copy some TLS keys and certs from the Vagrant VM into your clone of this repository.  This is because each time the Vagrant VM is built, it generates new TLS keys and certs, and so you have to specially copy these newly generated keys and certs into your configuration folder.

## Linux and MacOS commands to copy the TLS keys and certs

Note that the `vagrant` user password is `vagrant`.  Also, ensure that `$JAVA_HOME` is defined, and points to the Java 8 VM you will use to run ArkCase.

    ```bash
    cd ~
    scp vagrant@arkcase-ce.local:/etc/ssl/ca/arkcase-ca.crt ~/.arkcase/acm/private/
    scp vagrant@arkcase-ce.local:/opt/common/arkcase.ks ~/.arkcase/acm/private/
    scp vagrant@arkcase-ce.local:/opt/common/arkcase.ts ~/.arkcase/acm/private/
    scp vagrant@arkcase-ce.local:/etc/ssl/private/acm-arkcase.rsa.pem ~/.arkcase/acm/private/
    scp vagrant@arkcase-ce.local:/etc/ssl/crt/acm-arkcase.crt ~/.arkcase/acm/private/
    scp vagrant@arkcase-ce.local:/opt/common/symmetricKey.encrypted ~/.arkcase/acm/encryption/
    # add all the certs from your JVM to the arkcase trust store
    keytool -importkeystore -srckeystore $JAVA_HOME/jre/lib/security/cacerts -srcstorepass changeit -destkeystore ~/.arkcase/acm/private/arkcase.ts -deststorepass password -noprompt
    ```

## Windows commands to copy the TLS keys and certs

Run these commands from a `Git Bash` shell, or update the below lines to replace `scp` with whichever program you use as an scp client.

Note that the `vagrant` user password is `vagrant`.  Also, ensure that `%JAVA_HOME%` is defined, and points to the Java 8 VM you will use to run ArkCase.

  ```bash
   cd %HOMEPATH%
   scp vagrant@arkcase-ce.local:/etc/ssl/ca/arkcase-ca.crt %HOMEPATH%/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/opt/common/arkcase.ks %HOMEPATH%/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/opt/common/arkcase.ts %HOMEPATH%/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/etc/ssl/private/acm-arkcase.rsa.pem %HOMEPATH%/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/etc/ssl/crt/acm-arkcase.crt %HOMEPATH%/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/opt/common/symmetricKey.encrypted %HOMEPATH%/.arkcase/acm/encryption/
   # add all the certs from your JVM to the arkcase trust store
   keytool -importkeystore -srckeystore $JAVA_HOME/jre/lib/security/cacerts -srcstorepass changeit -destkeystore %HOMEPATH%/.arkcase/acm/private/arkcase.ts -deststorepass password -noprompt

   ```

Finally, you must build and run the ArkCase web application according to the instructions at <https://github.com/ArkCase/ArkCase>.

