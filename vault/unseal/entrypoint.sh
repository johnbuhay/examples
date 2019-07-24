#!/bin/sh

VAULT_INIT_LOG=/vault/logs/init.log
vault operator init | tee $VAULT_INIT_LOG
for n in 1 3 5; do
    grep "Unseal Key $n:" $VAULT_INIT_LOG | sed "s#Unseal Key $n: ##" | xargs vault operator unseal
done

grep 'Initial Root Token: ' $VAULT_INIT_LOG | sed "s#Initial Root Token: ##" > /vault/token
cat /vault/token | vault login -
vault audit enable file file_path=/vault/logs/audit.log
