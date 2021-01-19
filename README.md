# Hisense-mqtt-keyfiles
Some version of mqtt hisense smart TV require keys
keyfiles attached.
hi_keys.zip

Just incase this helps anyone on certain models of HS tv. u7qf eg. Which would not let me connect.

Put “rcm_certchain.pem.cer” as “client certificate” in mqtt explorer
and “rcm_pem_privkey.pkcs8” as “client key” in mqtt explorer
server certificate ca was not required for me. Encryption and Validate cert do not need to be ticked.
You should be able to connect now.
