# Hisense-mqtt-keyfiles
Some version of mqtt hisense smart TV require keys

Just incase this helps anyone on certain models of HS tv. u7qf eg. Which would not let me connect.

Extract hi_keys.zip in this repo.

Download mqtt explorer
Authenticate with remoteNow on android device.  If you want your remote commands to have effect to the tv, its mac has to be authenticated.
Mac address is sent with each mqtt command.

But you can listen to topics still without being authenticated.
Using the same mac address as your already authenticated android device works via remoteNow will work.

Put “rcm_certchain.pem.cer” as “client certificate” in mqtt explorer
and “rcm_pem_privkey.pkcs8” as “client key” in mqtt explorer
server certificate ca was not required for me. Encryption and Validate cert do not need to be ticked.
You should be able to connect now.
