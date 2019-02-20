# ArkCase configuration files

Configuration for ArkCase extensions is maintained as branches, where the "core" branch represents the Core ArkCase configuration!  
The "master" branch represents the configuration for the current/latest ArkCase release and it is tag'ed with each release.

&nbsp;
&nbsp;

Run the following commands to switch to the desired ArkCase configuration branch:  
**NOTE**: The following commands will delete your ArkCase configuration  
**NOTE**: Windows users should execute the following commands in `Git Bash`  

```
cd <your $HOME/.arkcase directory>
git checkout <branch>
git pull

# External ArkCase Notes

1. Add the ArkCase keys and certificates to your .arkcase folder
   ```bash
   cd ~
   scp vagrant@arkcase-ce.local:/etc/ssl/ca/arkcase-ca.crt ~/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/opt/common/arkcase.ks ~/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/opt/common/arkcase.ts ~/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/etc/ssl/private/acm-arkcase.rsa.pem ~/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/etc/ssl/crt/acm-arkcase.crt ~/.arkcase/acm/private/
   scp vagrant@arkcase-ce.local:/opt/common/symmetricKey.encrypted ~/.arkcase/acm/encryption/
   # add all the certs from your JVM to the arkcase.ts
   keytool -importkeystore -srckeystore $JAVA_HOME/jre/lib/security/cacerts -srcstorepass changeit -destkeystore ~/.arkcase/acm/private/arkcase.ts -deststorepass password -noprompt

   ```
