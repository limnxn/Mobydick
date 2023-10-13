#!/bin/bash

# SAN設定ファイルを作成 for Chrome
echo subjectAltName = DNS:dev.example, DNS:localhost, IP:127.0.0.1 > subjectaltname.txt
# サーバー用の秘密鍵を作成
openssl genrsa -des3 -passout pass:pass -out localhost.key 2048
# パスフレーズなしの秘密鍵を作成
openssl rsa -passin pass:pass -in localhost.key -out localhost.key
# CAに向けた証明書署名要求を作成
openssl req -new -sha256 -key localhost.key -out localhost.csr -subj "/C=JP/ST=/L=/O=/OU=/CN=localhost"
# 自己署名サーバー証明書を作成
openssl x509 -req -extfile subjectaltname.txt -signkey localhost.key -in localhost.csr -out localhost.crt -days 365
